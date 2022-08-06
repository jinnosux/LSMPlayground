-- Command to go to another player
RegisterCommand('tp', function(_, args)
    local targetId = args[1]

    if not targetId then
        TriggerEvent('chat:addMessage', {
            args = { 'Please provide a target ID.', },
        })

        return
    end

    TriggerServerEvent('ch_teleporter:teleport', targetId)
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
