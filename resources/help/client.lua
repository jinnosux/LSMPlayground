RegisterCommand('help', function()
    TriggerEvent('chat:addMessage', {
        color = {255,0,0},
        multiline = true,
        args = {'[SERVER]','YOU NEED HELP? SORRY, NO HELP YET'}
    })
end)-- /help command
