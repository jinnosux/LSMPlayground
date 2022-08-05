RegisterCommand('help2', function() 
    TriggerEvent('chat:addMessage', {
        color = {255,0,0},
        multiline = true,
        args = {'[SERVER]','TEST COMMAND'}
    })
end)-- /help2 command
