-- This is for the /return command
local returnCache = {}

-- This is to get players from a string
local function SearchPlayers(search)
    local ret = {}

    for _, player in ipairs(GetPlayers()) do
        if (player ~= nil) then
            local player_name = GetPlayerName(player)

            if(string.sub(search, 1, 1) == "#") then
                local searchId = string.sub(search, 2)
                if (player == searchId) then
                    table.insert(ret, player)
                    break
                end
            elseif (string.match(player_name:lower(), search:lower())) then
                table.insert(ret, tonumber(player))
            end
        end
    end

    return ret
end

-- This is to validate search results
local ValidateSearch = function(source, results, argnum)
    -- If the number of results is 1, return true indicating a valid search
    -- otherwise, if there is more than one player or no players at all, return
    -- false and let the player who ran the command know about the mistake.
    if(#results == 1) then
        return true
    elseif(#results == 0) then
        TriggerClientEvent("chat:addMessage", source, {
            color = {255, 104, 104},
            multiline = true,
            args = { "Teleport", string.format("No players were found. (arg=%s)", argnum == 1 and "player" or "target") }
        })

        return false
    else
        TriggerClientEvent("chat:addMessage", source, {
            color = {255, 255, 104},
            multiline = true,
            args = { "Teleport", string.format("Too many players were found, please refine your search term. (arg=%s)", argnum == 1 and "player" or "target") }
        })

        return false
    end
end

-- /return command - requires the command.return ace permission
RegisterCommand("return", function(source, args)
    if(#args == 1) then
        -- Search for the player name or id parsed to the command
        local results = SearchPlayers(args[1])

        -- Check if a player is actually returned
        if(ValidateSearch(source, results)) then
            -- Get the player and their position before they got teleported
            local player = results[1]
            local coords = returnCache[player]

            if(coords ~= nil) then
                -- Update the return cache to their current position before being returned to their previous one
                returnCache[player] = GetEntityCoords(GetPlayerPed(player))

                -- Tell the player to teleport to those coordinates
                TriggerClientEvent("_teleport:setCoords", player, coords)

                -- CHAT STUFF --
                TriggerClientEvent("chat:addMessage", source, {
                    color = {104, 255, 104},
                    multiline = true,
                    args = { "Teleport", string.format("You returned ^2%s ^7to their previous position", GetPlayerName(player)) }
                })
                TriggerClientEvent("chat:addMessage", player, {
                    color = {104, 255, 104},
                    multiline = true,
                    args = { "Teleport", string.format("^1%s ^7has returned you to your previous position", GetPlayerName(source)) }
                })
            else
                TriggerClientEvent("chat:addMessage", source, {
                    color = {255, 104, 104},
                    multiline = true,
                    args = { "Teleport", string.format("^2%s ^7doesn't have a return position because they've never been teleported before", GetPlayerName(player)) }
                })
            end
        end
    else
        TriggerClientEvent("chat:addMessage", source, {
            color = {255, 104, 104},
            multiline = true,
            args = { "Teleport", "Usage: ^2/return <player>" }
        })
    end
end, true)

-- Force teleport command - requires the command.tp ace permission
RegisterCommand("tp", function(source, args)
    -- If theres only one arg, then teleport the player running the command
    -- to the specified player if valid. Otherwise, if there's two, then use different logic
    -- to teleport the player to the target player.
    if(#args == 1) then
        local results = SearchPlayers(args[1])

        -- Check if the search results are good
        if(ValidateSearch(source, results)) then
            -- Get the player and their current coordinates
            local player = results[1]

            -- Check if the target player is the player running the command, if so, reject it
            if(player ~= source) then
                local coords = GetEntityCoords(GetPlayerPed(player))

                -- Store the current position for the player running the command for use later-on via /return
                returnCache[source] = GetEntityCoords(GetPlayerPed(source))

                -- Tell the player who ran the command to teleport to the coordinates of the specified player
                TriggerClientEvent("_teleport:setCoords", source, coords)

                -- CHAT STUFF --
                TriggerClientEvent("chat:addMessage", source, {
                    color = {104, 255, 104},
                    multiline = true,
                    args = { "Teleport", string.format("You teleported to ^2%s", GetPlayerName(player)) }
                })
                TriggerClientEvent("chat:addMessage", player, {
                    color = {104, 255, 104},
                    multiline = true,
                    args = { "Teleport", string.format("^1%s ^7has teleported to you", GetPlayerName(source)) }
                })
            else
                TriggerClientEvent("chat:addMessage", source, {
                    color = {104, 255, 104},
                    multiline = true,
                    args = { "Teleport", "You can't teleport to yourself" }
                })
            end
        end
    elseif(#args == 2) then
        -- Find the player we'll be teleporting to the target
        local player_results = SearchPlayers(args[1])

        if(ValidateSearch(source, player_results)) then
            -- Find the player we'll be teleporting the other player to
            local target_results = SearchPlayers(args[2])

            if(ValidateSearch(source, target_results)) then
                -- Get the player and the target, as well as the target coords
                local player = player_results[1]
                local target = target_results[1]

                -- Simple check to prevent pointless requests where the player is the target
                if(player ~= target) then
                    local target_coords = GetEntityCoords(GetPlayerPed(target))

                    -- Update the return cache for the player we'll be teleporting so they can be /return'd
                    returnCache[player] = GetEntityCoords(GetPlayerPed(player))

                    -- Tell the player to teleport to the target
                    TriggerClientEvent("_teleport:setCoords", player, target_coords)

                    -- CHAT STUFF --
                    TriggerClientEvent("chat:addMessage", source, {
                        color = {104, 255, 104},
                        multiline = true,
                        args = { "Teleport", string.format("You teleported ^2%s ^7to ^3%s^7", GetPlayerName(player), GetPlayerName(target)) }
                    })
                    TriggerClientEvent("chat:addMessage", player, {
                        color = {104, 255, 104},
                        multiline = true,
                        args = { "Teleport", string.format("^1%s ^7has teleported you to ^2%s", GetPlayerName(source), GetPlayerName(target)) }
                    })

                    -- If the target isn't the source who ran this command, let them know about the teleport
                    if(target ~= source) then
                        print(target, source)
                        TriggerClientEvent("chat:addMessage", target, {
                            color = {104, 255, 104},
                            multiline = true,
                            args = { "Teleport", string.format("^1%s ^7has teleported ^2%s ^7to you", GetPlayerName(source), GetPlayerName(player)) }
                        })
                    end
                else
                    TriggerClientEvent("chat:addMessage", source, {
                        color = {104, 255, 104},
                        multiline = true,
                        args = { "Teleport", "You can't teleport someone to themselves" }
                    })
                end
            end
        end
    else
        TriggerClientEvent("chat:addMessage", source, {
            color = {255, 104, 104},
            multiline = true,
            args = { "Teleport", "Usage: ^2/tp <player> [target]" }
        })
    end
end, true)