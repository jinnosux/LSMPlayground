RegisterCommand('tpw', function(source, args)

    local src = source
    local waypoint = GetFirstBlipInfoId(8)
    local playerName = GetPlayerName(src)

    if DoesBlipExist(waypoint) then
        SetEntityCoords(PlayerPedId(), GetBlipInfoIdCoord(waypoint), GetGroundZFor_3dCoord(x, y, z, true))
    
    else
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            multiline = true,
            args = {{playerName}, "~c~remember to set the waypoint first"}
        })
    end
end)