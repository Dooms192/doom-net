    function giveWeapon(weaponHash)
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(weaponHash), 999, false, false)
    end

    function msg(text)
        -- TriggerEvent will send a chat message to the client in the prefix as red
        TriggerEvent("chatMessage",  "[Server]", {255,0,0}, text)
    end

    function GetPedInFront()
        local player = PlayerId()
        local plyPed = GetPlayerPed(player)
        local plyPos = GetEntityCoords(plyPed, false)
        local plyOffset = GetOffsetFromEntityInWorldCoords(plyPed, 0.0, 1.3, 0.0)
        local rayHandle = StartShapeTestCapsule(plyPos.x, plyPos.y, plyPos.z, plyOffset.x, plyOffset.y, plyOffset.z, 1.0, 12, plyPed, 7)
        local _, _, _, _, ped = GetShapeTestResult(rayHandle)
        return ped
    end
    
    function GetPlayerFromPed(ped)
        for a = 0, 64 do
            if GetPlayerPed(a) == ped then
                return a
            end
        end
        return -1
    end