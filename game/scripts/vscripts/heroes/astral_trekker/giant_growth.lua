-- Called when modifier_giant_growth_active is created
function GrowStart(event)
	local caster = event.caster
	local ability = event.ability
	
	local model_size = ability:GetLevelSpecialValueFor("growth_size", ability:GetLevel() - 1)
	local original_model_scale = caster:GetModelScale()
	caster.original_model_scale = original_model_scale
	local model_size_interval = 100 / (model_size - original_model_scale)
	
	-- Scale Up in 100 intervals
	for i = 1, 100 do
		Timers:CreateTimer(i/75,function()
    		local modelScale = original_model_scale + i/model_size_interval
			caster:SetModelScale(modelScale)
		end)
	end
end

-- Called when modifier_giant_growth_active is destroyed (purged, after death, after duration etc.)
function GrowEnd(event)
	local caster = event.caster
	local ability = event.ability
	
	local model_size = ability:GetLevelSpecialValueFor("growth_size", ability:GetLevel() - 1)
	local original_model_scale = caster.original_model_scale or 0.74
	local model_size_interval = 100 / (model_size - original_model_scale) 
	
	-- Scale Down in 100 intervals
	for i = 1 , 100 do
		Timers:CreateTimer(i/50,function()
	    	local modelScale = model_size - i/model_size_interval
			caster:SetModelScale(modelScale)
		end)
	end
end
