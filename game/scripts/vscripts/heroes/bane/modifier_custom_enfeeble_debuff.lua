if modifier_custom_enfeeble_debuff == nil then
	modifier_custom_enfeeble_debuff = class({})
end

function modifier_custom_enfeeble_debuff:IsHidden()
	return false
end

function modifier_custom_enfeeble_debuff:IsDebuff()
	return true
end

function modifier_custom_enfeeble_debuff:IsPurgable()
	return false
end

function modifier_custom_enfeeble_debuff:RemoveOnDeath()
	return true
end

function modifier_custom_enfeeble_debuff:OnCreated()
	local ability = self:GetAbility()
	self.attack_damage_reduction = ability:GetSpecialValueFor("attack_damage_reduction")
	self.spell_damage_reduction = ability:GetSpecialValueFor("spell_damage_reduction")
end

function modifier_custom_enfeeble_debuff:OnRefresh()
	local ability = self:GetAbility()
	self.attack_damage_reduction = ability:GetSpecialValueFor("attack_damage_reduction")
	self.spell_damage_reduction = ability:GetSpecialValueFor("spell_damage_reduction")
end

function modifier_custom_enfeeble_debuff:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_DAMAGEOUTGOING_PERCENTAGE,
		MODIFIER_PROPERTY_TOOLTIP
	}
	return funcs
end

function modifier_custom_enfeeble_debuff:GetModifierDamageOutgoing_Percentage()
	return self.attack_damage_reduction
end

function modifier_custom_enfeeble_debuff:OnTooltip()
  return self.spell_damage_reduction
end

function modifier_custom_enfeeble_debuff:GetEffectName()
	return "particles/units/heroes/hero_bane/bane_enfeeble.vpcf"
end

function modifier_custom_enfeeble_debuff:GetEffectAttachType()
	return PATTACH_OVERHEAD_FOLLOW
end
