﻿if bane_custom_terror_blink == nil then
	bane_custom_terror_blink = class({})
end

LinkLuaModifier("modifier_custom_terror_buff", "heroes/bane/modifier_custom_terror_buff.lua", LUA_MODIFIER_MOTION_NONE)

function bane_custom_terror_blink:OnAbilityPhaseStart()
	local caster = self:GetCaster()
	local duration = self:GetSpecialValueFor("duration")
	local path_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_spectre/spectre_shadow_path.vpcf", PATTACH_POINT_FOLLOW, caster)
	ParticleManager:SetParticleControlEnt(path_particle, 3, caster, PATTACH_POINT_FOLLOW, "attach_hitloc", caster:GetAbsOrigin(), true)
	ParticleManager:SetParticleControl(path_particle, 5, Vector(duration, 0, 0))
	self.terror_particle = path_particle

	return true
end

function bane_custom_terror_blink:OnAbilityPhaseInterrupted()
	if self.terror_particle then
		ParticleManager:DestroyParticle(self.terror_particle, true)
		ParticleManager:ReleaseParticleIndex(self.terror_particle)
	end
end

function bane_custom_terror_blink:OnSpellStart()
	if IsServer() then
		local caster = self:GetCaster()
		local target_point = self:GetCursorPosition()

		local delay = self:GetSpecialValueFor("duration")

		caster.terror_previous_position = caster:GetAbsOrigin()

		local direction = target_point - caster.terror_previous_position
		direction.z = 0.0

		-- Apply the buff
		local buff_duration = delay+0.1
		caster:AddNewModifier(caster, self, "modifier_custom_terror_buff", {duration = buff_duration})

		local start_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_bane/bane_fiends_grip.vpcf", PATTACH_ABSORIGIN, caster)
		ParticleManager:SetParticleControl(start_particle, 0, caster.terror_previous_position)
		Timers:CreateTimer(delay, function()
			ParticleManager:DestroyParticle(start_particle, true)
			ParticleManager:ReleaseParticleIndex(start_particle)
		end)

		-- Teleporting caster and preventing getting stuck
		FindClearSpaceForUnit(caster, target_point, false)

		-- Disjoint disjointable/dodgeable projectiles
		ProjectileManager:ProjectileDodge(caster)

		-- Sound on caster
		caster:EmitSound("Hero_Bane.Enfeeble.Cast")

		-- After a delay (buff duration) teleport back
		Timers:CreateTimer(delay, function()
			if caster then
				if caster.terror_previous_position and (not caster:IsInvulnerable()) and caster:HasModifier("modifier_custom_terror_buff") and (not caster:IsRooted()) then
					-- Teleporting caster back and preventing getting stuck
					FindClearSpaceForUnit(caster, caster.terror_previous_position, false)

					-- Disjoint disjointable/dodgeable projectiles
					ProjectileManager:ProjectileDodge(caster)
				end
			end
			if self.terror_particle then
				ParticleManager:DestroyParticle(self.terror_particle, true)
				ParticleManager:ReleaseParticleIndex(self.terror_particle)
			end
		end)
	end
end

function bane_custom_terror_blink:ProcsMagicStick()
	return true
end
