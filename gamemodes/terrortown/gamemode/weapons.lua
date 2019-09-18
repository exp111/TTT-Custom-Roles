local canBuyList = { 
	weapon_ttt_health_station = {ROLE_MERCENARY, ROLE_HYPNOTIST, ROLE_VAMPIRE, ROLE_ASSASSIN, ROLE_KILLER},
	weapon_ttt_teleport = {ROLE_MERCENARY, ROLE_KILLER},
}

local loadoutList = {
	weapon_ttt_unarmed = {ROLE_MERCENARY, ROLE_GLITCH, ROLE_HYPNOTIST, ROLE_PHANTOM, ROLE_JESTER, ROLE_ZOMBIE, ROLE_VAMPIRE, ROLE_SWAPPER, ROLE_ASSASSIN, ROLE_KILLER},
	weapon_zm_carry = {ROLE_MERCENARY, ROLE_GLITCH, ROLE_HYPNOTIST, ROLE_PHANTOM, ROLE_JESTER, ROLE_ZOMBIE, ROLE_VAMPIRE, ROLE_SWAPPER, ROLE_ASSASSIN, ROLE_KILLER},
	weapon_zm_improvised = {ROLE_MERCENARY, ROLE_GLITCH, ROLE_HYPNOTIST, ROLE_PHANTOM, ROLE_JESTER, ROLE_ZOMBIE, ROLE_VAMPIRE, ROLE_SWAPPER, ROLE_ASSASSIN, ROLE_KILLER},
}

local added = false

function AddUnique(t1, t2) -- Shitty performance but only called like 3 times
	for k,v in pairs(t2) do
		if not table.HasValue(t1, v) then
			table.insert(t1, v)
		end
	end
end

hook.Add("OnGamemodeLoaded", "AddSWEPSToRole", function()
	if added then
		return
	end
	
	for k, v in pairs(weapons.GetList()) do
		if v and v.ClassName then
			-- Can spawn "naturally" (AutoSpawnable & Kind != WEAPON_EQUIP*)
			if v.AutoSpawnable and v.Kind and v.Kind != WEAPON_EQUIP1 and v.Kind != WEAPON_EQUIP2 then
				if not v.CanBuy then
					v.CanBuy = {}
				end
				AddUnique(v.CanBuy, {ROLE_MERCENARY, ROLE_KILLER})
			end

			if canBuyList[v.ClassName] then
				if not v.CanBuy then
					v.CanBuy = {}
				end
				AddUnique(v.CanBuy, canBuyList[v.ClassName])
			end

			if loadoutList[v.ClassName] then
				AddUnique(v.InLoadoutFor, loadoutList[v.ClassName])
			end
		end
	end
	added = true
end)