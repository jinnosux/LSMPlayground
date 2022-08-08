-- Command to go to another player
RegisterCommand('tp', function(_, args)
    local targetId = args[1]

    if not targetId then
        TriggerEvent('chat:addMessage', {
            args = { 'Please provide a target ID.', },
        })
        return
    end

    TriggerServerEvent('ch_teleporter:tp', targetId)
end)

-- Command to bring a player to us
RegisterCommand('getplayer', function(_, args)
    local targetId = args[1]

    if not targetId then
        TriggerEvent('chat:addMessage', {
            args = { 'Please provide a target ID.', },
        })
        return
    end

    TriggerServerEvent('ch_teleporter:getplayer', targetId)
end)

-- An event that teleports us to a specific location
RegisterNetEvent('ch_teleporter:teleport', function(targetCoordinates)
    local playerPed = PlayerPedId()

    SetEntityCoords(playerPed, targetCoordinates)
end)
