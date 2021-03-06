if astral_trekker_astral_charge == nil then
	astral_trekker_astral_charge = class({})
end

LinkLuaModifier("modifier_astral_charge_buff", "heroes/astral_trekker/modifier_astral_charge_buff.lua", LUA_MODIFIER_MOTION_NONE)

-- function astral_trekker_astral_charge:CastFilterResultLocation(location)
	-- local default_result = self.BaseClass.CastFilterResultLocation(self, location)
	-- local caster = self:GetCaster()
	-- -- This prevents casting multiple times
	-- if caster.astral_charge_is_running == true then
		-- return UF_FAIL_CUSTOM
	-- end

	-- return default_result
-- end

-- function astral_trekker_astral_charge:GetCustomCastErrorLocation(location)
	-- local caster = self:GetCaster()
	-- if caster.astral_charge_is_running == true then
		-- return "Astral Charge already active."
	-- end
-- end

function astral_trekker_astral_charge:OnAbilityPhaseStart()
	local caster = self:GetCaster()
	
	if IsServer() then
		if caster:GetHealth() < 100 then
			-- Display the error message
			SendErrorMessage(caster:GetPlayerOwnerID(), "Not enough health to cast this spell.")
			return false
		end
	end
	
	return true
end

function astral_trekker_astral_charge:OnSpellStart()
	local caster = self:GetCaster()
	
	if caster.astral_charge_is_running == nil then
		caster.astral_charge_is_running = false
	end

	if IsServer() then
		-- If health of the caster is below 100 then refund mana cost
		if caster:GetHealth() > 100 and caster.astral_charge_is_running == false then
			-- Sound on caster
			caster:EmitSound("Hero_StormSpirit.BallLightning")
			-- Add the buff to the caster
			caster:AddNewModifier(caster, self, "modifier_astral_charge_buff", {})
			-- Get target point
			self.target_point = self:GetCursorPosition()
			-- Make sure there are no multiple instances on one caster
			caster.astral_charge_is_running = true
			-- Start astral charge traverse
			self:astral_charge_traverse()
		else
			self:RefundManaCost()
		end
	end
end

function astral_trekker_astral_charge:ProcsMagicStick()
	return true
end

--Start traversing the caster, and checking if caster should stop traversing based on destination or health
--This ability cannot be casted multiple times while it is active
function astral_trekker_astral_charge:astral_charge_traverse()
	local caster = self:GetCaster()
	local caster_position = caster:GetAbsOrigin()
	local target = self.target_point

	-- KV Variables
	local speed = self:GetSpecialValueFor("move_speed")
	local destroy_radius = self:GetSpecialValueFor("tree_destroy_radius")
	local vision_radius = self:GetSpecialValueFor("vision_radius")
	local hp_percent = self:GetSpecialValueFor("hp_travel_cost_percent")
	local distance_per_hp = self:GetSpecialValueFor("distance_per_hp")
	local hp_cost_base = self:GetSpecialValueFor("hp_cost_base")
	local damage = self:GetSpecialValueFor("damage")
	local radius = self:GetSpecialValueFor("damage_radius")
	
	-- Variables based on modifiers and precaches
	local loop_sound_name = "Hero_StormSpirit.BallLightning.Loop"
	local modifier_name = "modifier_astral_charge_buff"
	
	-- Necessary pre-calculated variables
	local current_position = caster_position
	local intervals_per_second = speed/destroy_radius -- This will calculate how many times in one second, unit should move based on destroy tree radius
	local forwardVec = Vector(target.x - caster_position.x, target.y - caster_position.y, 0):Normalized()
	local hp_per_distance = (hp_percent/100)*caster:GetMaxHealth()
	
	-- Adjust vision (decrease vision of the caster)
	caster:SetDayTimeVisionRange(vision_radius)
	caster:SetNightTimeVisionRange(vision_radius)
	
	-- Start
	local distance = 0.0
	if caster:GetHealth() > hp_per_distance and caster:GetHealth() > 100 then
		-- Spend initial health cost; Health can't get lower than 100 hp with Astral Charge
		if ((caster:GetHealth() - hp_per_distance) > 100) then
			caster:SetHealth(caster:GetHealth() - hp_per_distance)
		else
			caster:SetHealth(100)
		end
		
		-- Sound on caster (loop sound)
		caster:EmitSound(loop_sound_name)
		
		-- Traverse
		Timers:CreateTimer(function()
			-- Removing health
			distance = distance + speed / intervals_per_second
			if distance >= distance_per_hp then
				-- Check if there is enough health to cast
				local hp_to_spend = hp_cost_base + hp_per_distance
				if caster:GetHealth() >= hp_to_spend and caster:GetHealth() > 100 then
					if ((caster:GetHealth() - hp_to_spend) > 100) then
						caster:SetHealth(caster:GetHealth() - hp_to_spend)
					else
						caster:SetHealth(100)
					end
				else
					-- Exit condition if caster runs out of hp (his hp is < 100)
					local modifier = caster:FindModifierByName(modifier_name)
					modifier:SetDuration(0.1, false)
					return nil
				end
				distance = distance - distance_per_hp
			end
			
			-- Update location
			current_position = current_position + forwardVec * ( speed / intervals_per_second )
			-- caster:SetAbsOrigin( current_position ) -- This doesn't work because unit will not stick to the ground but rather travel in linear
			FindClearSpaceForUnit(caster, current_position, false)
			
			-- Check if unit is close to the destination point
			if (target - current_position):Length2D() <= speed / intervals_per_second then
				-- Exit condition if caster arrived at designated location
				local modifier = caster:FindModifierByName(modifier_name)
				modifier:SetDuration(0.1, false)

				-- Damage around destination
				local enemies = FindUnitsInRadius(caster:GetTeamNumber(), caster:GetAbsOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 0, 0, false)
				for k, enemy in pairs(enemies) do
					ApplyDamage({victim = enemy, attacker = caster, ability = self, damage = damage, damage_type = DAMAGE_TYPE_MAGICAL})
				end
				return nil
			else
				return 1 / intervals_per_second
			end
		end)
	else
		self:RefundManaCost()
		-- Exit condition if caster doesn't have enough health 
		-- This will happen only if the caster has less than 666 max hp, coincidence?
		local modifier = caster:FindModifierByName(modifier_name)
		modifier:SetDuration(0.1, false)
		
		-- Display the error message
		SendErrorMessage(caster:GetPlayerOwnerID(), "Not enough health to cast this spell.")
	end
end
