local waypoint = GetFirstBlipInfoId(8)

RegisterCommand('tpw', function(source, args)
    
    if DoesBlipExist(waypoint) then
        SetEntityCoords(PlayerPedId(), GetBlipInfoIdCoord(waypoint))
    
    else
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            multiline = true,
            args = {"Me", "remember to set the waypoint first."}
        })
    end
end)