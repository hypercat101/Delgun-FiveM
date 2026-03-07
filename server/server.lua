RegisterNetEvent('delgun:deleteEntity', function(netId)
    local src = source

    if IsPlayerAceAllowed(src, Config.DelgunPermission) then
        local ent = NetworkGetEntityFromNetworkId(netId)

        if DoesEntityExist(ent) then
            DeleteEntity(ent)

            Citizen.Wait(100)

            if DoesEntityExist(ent) then
                local owner = NetworkGetEntityOwner(ent)
                if owner ~= -1 then
                    TriggerClientEvent('delgun:forceDelete', owner, netId)
                else
                    TriggerClientEvent('delgun:forceDelete', src, netId)
                end
            end

            TriggerClientEvent('delgun:notify', src, Config.Messages.deleted, 'success')
        end
    else
        TriggerClientEvent('delgun:notify', src, Config.Messages.no_permission, 'error')
    end
end)
