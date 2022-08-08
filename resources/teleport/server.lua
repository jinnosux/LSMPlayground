RegisterNetEvent('ch_teleporter:tp', function(targetId)
    local playerId = source

    -- Get entity handle of target
    local targetPed = GetPlayerPed(targetId)

    if targetPed <= 0 then
        TriggerClientEvent('chat:addMessage', playerId, {
            args = { 'Player ' .. targetId .. ' doesn\'t seem to exist.', },
        })
        return
    end

    -- Get coordinates of the target
    local targetPos = GetEntityCoords(targetPed)

    -- Send the coordinate to the client, so it can go to the target
    TriggerClientEvent('ch_teleporter:teleport', playerId, targetPos)
end)

RegisterNetEvent('ch_teleporter:getplayer', function(targetId)
    local playerId  = source
    local playerPed = GetPlayerPed(playerId)

    if targetPed <= 0 then
        TriggerClientEvent('chat:addMessage', playerId, {
            args = { 'Player ' .. targetId .. ' doesn\'t seem to exist.', },
        })
        return
    end

    local playerPos = GetEntityCoords(playerPed)

    TriggerClientEvent('ch_teleporter:teleport', targetId, playerPos)
end)