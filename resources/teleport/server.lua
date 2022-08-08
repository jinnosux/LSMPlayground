RegisterNetEvent('ch_teleporter:tp', function(targetId)
    local playerId = source
    local targetPed = GetPlayerPed(targetId)

    if targetPed <= 0 then
        TriggerClientEvent('chat:addMessage', playerId, {
            args = { 'Player ' .. targetId .. ' doesn\'t seem to exist.', },
        })
        return
    end

    local targetPos = GetEntityCoords(targetPed)

    TriggerClientEvent('ch_teleporter:teleport', playerId, targetPos)
end)

RegisterNetEvent('ch_teleporter:getplayer', function(targetId)
    local playerId  = source
    local playerPed = GetPlayerPed(playerId)
    local playerPos = GetEntityCoords(playerPed)

    TriggerClientEvent('ch_teleporter:teleport', targetId, playerPos)
end)