RegisterCommand('tpw', function(source, args)

    local src = source
    local waypoint = GetFirstBlipInfoId(8)
    local playerName = GetPlayerName(src)

    local z = 10000<spawning ped> 
    local PedHeight = natives.ENTITY.GET_ENTITY_HEIGHT_ABOVE_GROUND(PedID)
    local z = z - PedHeight  
    natives.ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PedHeight,x,y,z + 3, true, true, true);

    if DoesBlipExist(waypoint) then
        SetEntityCoords(PlayerPedId(), GetBlipInfoIdCoord(waypoint), GetGroundZFor_3dCoord(x, y, z, false)) -- 'false' Means you don't teleport directly in the water.
        notify("You have just been teleported.")
    
    else
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            multiline = true,
            args = {{playerName}, "remember to set the waypoint first"}
        })
    end

    function notify(text)
        SetNotificationTextEntry("STRING")
        AddTextComponentString(text)
        DrawNotification(false, false)
    end

end)
