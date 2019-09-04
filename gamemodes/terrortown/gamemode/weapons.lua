local canBuyList = { 
	weapon_ttt_glock = {ROLE_MERCENARY, ROLE_KILLER},
	weapon_ttt_m16 = {ROLE_MERCENARY, ROLE_KILLER},
	weapon_ttt_confgrenade = {ROLE_MERCENARY, ROLE_KILLER},
	weapon_ttt_health_station = {ROLE_MERCENARY, ROLE_HYPNOTIST, ROLE_VAMPIRE, ROLE_ASSASSIN, ROLE_KILLER},
	weapon_ttt_smokegrenade = {ROLE_MERCENARY, ROLE_KILLER},
	weapon_ttt_teleport = {ROLE_MERCENARY, ROLE_KILLER},
	weapon_zm_mac10 = {ROLE_MERCENARY, ROLE_KILLER},
	weapon_zm_molotov = {ROLE_MERCENARY, ROLE_KILLER},
	weapon_zm_pistol = {ROLE_MERCENARY, ROLE_KILLER},
	weapon_zm_revolver = {ROLE_MERCENARY, ROLE_KILLER},
	weapon_zm_rifle = {ROLE_MERCENARY, ROLE_KILLER},
	weapon_zm_shotgun = {ROLE_MERCENARY, ROLE_KILLER},
	weapon_zm_sledge = {ROLE_MERCENARY, ROLE_KILLER},
}

local loadoutList = {
	weapon_ttt_unarmed = {ROLE_MERCENARY, ROLE_GLITCH, ROLE_HYPNOTIST, ROLE_PHANTOM, ROLE_JESTER, ROLE_ZOMBIE, ROLE_VAMPIRE, ROLE_SWAPPER, ROLE_ASSASSIN, ROLE_KILLER},
	weapon_zm_carry = {ROLE_MERCENARY, ROLE_GLITCH, ROLE_HYPNOTIST, ROLE_PHANTOM, ROLE_JESTER, ROLE_ZOMBIE, ROLE_VAMPIRE, ROLE_SWAPPER, ROLE_ASSASSIN, ROLE_KILLER},
	weapon_zm_improvised = {ROLE_MERCENARY, ROLE_GLITCH, ROLE_HYPNOTIST, ROLE_PHANTOM, ROLE_JESTER, ROLE_ZOMBIE, ROLE_VAMPIRE, ROLE_SWAPPER, ROLE_ASSASSIN, ROLE_KILLER},
}

local added = false

hook.Add("OnGamemodeLoaded", "AddRoleToSWEPS", function()
	if added then
		return
	end
	
	for k, v in pairs(weapons.GetList()) do
		if v and v.ClassName then
			if canBuyList[v.ClassName] then
				if not v.CanBuy then
					v.CanBuy = {}
				end
				table.Add(v.CanBuy, canBuyList[v.ClassName])
			end

			if loadoutList[v.ClassName] then
				table.Add(v.InLoadoutFor, loadoutList[v.ClassName])
			end
		end
	end
	added = true
end)