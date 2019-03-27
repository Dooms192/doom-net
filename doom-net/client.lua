RegisterCommand('help', function()
    msg("Website: gecrp.com")
    msg("teamspeak: 75.156.170.17")
end, false)

RegisterCommand('clear', function()
    RemoveAllPedWeapons(GetPlayerPed(-1), true)
    msg("Removed all weapon!")
end,false)

RegisterCommand('yo', function()
    local player = PlayerId()
    local plyPed = GetPlayerPed(player)
    local playerVeh = IsPedInAnyVehicle(plyPed, false)
    msg(playerVeh)

end,false)

first = true
seatbelt = false
playerLeftVehicle = false

RegisterCommand('seatbelt', function()
    seatbelt = true
    msg("Thanks for putting your seatbelt on!")
end,false)

RegisterCommand('checkseat', function()
    msg(seatbelt)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local player = PlayerId()
        local plyPed = GetPlayerPed(player)
        local playerInVehicle = IsPedInAnyVehicle(plyPed, false)
        --msg(playerInVehicle)
        if playerInVehicle and first then
            msg("Type /seatbelt, to put on your seatbelt!")
            first = false
        elseif not playerInVehicle and seatbelt then
           playerLeftVehicle = true
           seatbelt = false
           first = true
            msg("Bye!")
        else
            first = true
            seatbelt = false
            first = true
        end
    end
end)