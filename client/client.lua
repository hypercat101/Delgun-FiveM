local delgun_active = false
local last_deleted_entity = nil

local function Notify(message, type)
    if Config.NotificationSystem == 'ox_lib' then
        exports.ox_lib:notify({
            title = 'Delgun',
            description = message,
            type = type
        })
    elseif Config.NotificationSystem == 'chat' then
        TriggerEvent('chat:addMessage', {
            args = { '[Delgun]', message },
            color = (type == 'success') and {0, 255, 0} or {255, 0, 0}
        })
    elseif Config.NotificationSystem == 'custom' then
        Config.CustomNotification(message, type)
    end
end

RegisterNetEvent('delgun:notify')
AddEventHandler('delgun:notify', function(message, type)
    Notify(message, type)
end)

RegisterNetEvent('delgun:forceDelete')
AddEventHandler('delgun:forceDelete', function(netId)
    local ent = NetworkGetEntityFromNetworkId(netId)
    if DoesEntityExist(ent) then
        SetEntityAsMissionEntity(ent, true, true)
        NetworkRequestControlOfEntity(ent)
        local timeout = 500
        while timeout > 0 and not NetworkHasControlOfEntity(ent) do
            Citizen.Wait(0)
            timeout = timeout - 1
        end
        DeleteEntity(ent)
    end
end)

RegisterCommand('delgun', function()
    delgun_active = not delgun_active
    if delgun_active then
        Notify(Config.Messages.activated, 'success')
    else
        Notify(Config.Messages.deactivated, 'error')
        last_deleted_entity = nil
    end
end)

Citizen.CreateThread(function()
    while true do
        local wait = 500
        if delgun_active then
            wait = 0
            local found, entityHit = GetEntityPlayerIsFreeAimingAt(PlayerId())

            if found and entityHit ~= 0 and (IsEntityAVehicle(entityHit) or IsEntityAnObject(entityHit)) then
                if entityHit ~= last_deleted_entity then
                    if NetworkGetEntityIsNetworked(entityHit) then
                        local netId = NetworkGetNetworkIdFromEntity(entityHit)
                        if netId ~= 0 then
                            TriggerServerEvent('delgun:deleteEntity', netId)
                            last_deleted_entity = entityHit
                        end
                    end
                end
            else
                last_deleted_entity = nil
            end
        end
        Citizen.Wait(wait)
    end
end)
