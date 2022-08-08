RegisterCommand('tpw', function(source, args)

    local src = source
    local waypoint = GetFirstBlipInfoId(8)
    local playerName = GetPlayerName(src)

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