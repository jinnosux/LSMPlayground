RegisterCommand('ws', function(source, args)
    local player = GetPlayerPed(-1)
    if args[1] == 'admin' then
        GiveWeaponToPed(player, GetHashKey("weapon_minigun"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_rpg"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_raycarbine"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_rayminigun"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_raypistol"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_stickybomb"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_specialcarbine_mk2"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_smokegrenade"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_smg_mk2"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_revolver_mk2"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_railgun"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_pistol_mk2"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_pistol50"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_petrolcan"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_musket"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_molotov"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_microsmg"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_marksmanrifle_mk2"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_knife"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_hominglauncher"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_heavysniper_mk2"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_heavyshotgun"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_grenadelauncher"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_grenade"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_flaregun"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_firework"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_fireextinguisher"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_doubleaction"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_compactlauncher"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_combatmg_mk2"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_carbinerifle_mk2"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_bzgas"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_assaultshotgun"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_assaultrifle_mk2"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_appistol"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_snowball"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_appistol"), 9999, false, false)
        GiveWeaponToPed(player, GetHashKey("weapon_flashlight"), 9999, false, false)
        
        notify("~r~Weapons: ~g~Admin Loadout Equipped")
    else
        notify("~r~Wrong loadout type. ~c~Try: /ws admin")
    end
end)

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end
