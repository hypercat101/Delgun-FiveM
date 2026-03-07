local lastUsage = {}
local usageCooldown = 1000

RegisterNetEvent('delgun:deleteEntity')
AddEventHandler('delgun:deleteEntity', function(netId)
    local src = source
    local playerPed = GetPlayerPed(src)

    if not IsPlayerAceAllowed(src, Config.DelgunPermission) then
        TriggerClientEvent('delgun:notify', src, Config.Messages.no_permission, 'error')
        return
    end

    if lastUsage[src] and (GetGameTimer() - lastUsage[src] < usageCooldown) then
        return
    end

    if not NetworkDoesEntityExistWithNetworkId(netId) then
        TriggerClientEvent('delgun:notify', src, Config.Messages.no_target, 'error')
        return
    end

    local ent = NetworkGetEntityFromNetworkId(netId)

    if not DoesEntityExist(ent) then
        TriggerClientEvent('delgun:notify', src, Config.Messages.no_target, 'error')
        return
    end

    local entType = GetEntityType(ent)
    if not (IsEntityAVehicle(ent) or IsEntityAnObject(ent)) then
        return
    end

    local playerCoords = GetEntityCoords(playerPed)
    local entityCoords = GetEntityCoords(ent)
    local distance = #(playerCoords - entityCoords)

    if distance > Config.MaxRange then
        TriggerClientEvent('delgun:notify', src, Config.Messages.out_of_range, 'error')
        return
    end

    lastUsage[src] = GetGameTimer()
    DeleteEntity(ent)

    Citizen.Wait(100)
    if DoesEntityExist(ent) then
        local owner = NetworkGetEntityOwner(ent)
        if owner ~= -1 and owner ~= src then
            TriggerClientEvent('delgun:forceDelete', owner, netId)
        else
            TriggerClientEvent('delgun:forceDelete', src, netId)
        end
    end

    TriggerClientEvent('delgun:notify', src, Config.Messages.deleted, 'success')
end)
