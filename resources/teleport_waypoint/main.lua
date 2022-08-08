RegisterCommand('tpw', function(source, args)

    local src = source
    local waypoint = GetFirstBlipInfoId(8)
    local playerName = GetPlayerName(src)

    if DoesBlipExist(waypoint) then
        SetEntityCoords(PlayerPedId(), GetBlipInfoIdCoord(waypoint))
    
    else
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            multiline = true,
            args = {{playerName}, "remember to set the waypoint first."}
        })
    end
end)