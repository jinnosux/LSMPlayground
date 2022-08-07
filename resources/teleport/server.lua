-- Get entity handler of target
RegisterNetEvent('ch_teleporter:tp', function(targetId)

    local playerId = source
    local playerPed = GetPlayerPed(playerId)
    local targetPed = GetPlayerPed(targetId)
    local targetPos = GetEntityCoords(targetPed)

    -- Send the coordinates to the client, so it can go to the target
    if targetPed > 0 then
        SetEntityCoords(playerPed, targetPos)
    else
        TriggerClientEvent('chat:addMessage', playerId, {
            args = { 'Player ' .. targetId .. ' doesn\'t seem to exist.', },
        })
        return
    end
end)


-- Get coordinates of the requesting client
RegisterNetEvent('ch_teleporter:getplayer', function(targetId)

    local playerId = source
    local playerPed = GetPlayerPed(playerId)
    local playerPos = GetEntityCoords(playerPed)
    local targetPed = GetPlayerPed(targetId)

    -- Teleport the target to the client
    if targetPed > 0 then
        SetEntityCoords(targetPed, playerPos)   
    else    
        TriggerClientEvent('chat:addMessage', playerId, {
            args = { 'Player ' .. targetId .. ' doesn\'t seem to exist.', },
        })
        return
    end
end)
