RegisterNetEvent('ch_teleporter:tp', function(targetId)
    -- Get entity handler of target
    local playerId = source
    local playerPed = GetPlayerPed(playerId)
    local targetPed = GetPlayerPed(targetId)

    if targetPed <= 0 then
        TriggerClientEvent('chat:addMessage', playerId, {
            args = { 'Player,' .. targetId .. ' doesn\'t seem to exist.',},
        })

        return
    end

    -- Get coordinates of the target
    local targetPos = GetEntityCoords(targetPed)

    -- Send the coordinates to the client, so it can go to the target
    SetEntityCoords(playerPed, targetPos)
end)

RegisterNetEvent('ch_teleporter:getplayer', function(targetId)
    -- Get coordinates of the requesting client
    local playerId = source
    local playerPed = GetPlayerPed(playerId)
    local playerPos = GetEntityCoords(playerPed)
    local targetPed = GetPlayerPed(targetId)

    if targetPed <= 0 then
        TriggerClientEvent('chat:addMessage', playerId, {
            args = { 'Player,' .. targetId .. ' doesn\'t seem to exist.',},
        })

        return
    end

    -- Teleport the target to the client
    SetEntityCoords(targetPed, playerPos)
end)
