RegisterCommand('cuff', function()
    msg("This is a test!")
end, false)


handcuff = false

Citizen.CreateThread(function()
    while true do
        local player = GetPlayerId()
        local playPed = GetPlayerPed(player)
        local entity = GetEntityPlayerIsFreeAimingAt(player, Citizen.ReturnResultAnyway())

        if IsEntityAPed(entity) and IsControlJustReleased(0, 74) then
            msg("Handcuffed player")
            handcuff = true
        end
    end
end)