Config = {}

Config.DelgunPermission = 'delgun.use'
Config.MaxRange = 100.0

-- Notification system: 'ox_lib', 'chat', or 'custom'
Config.NotificationSystem = 'ox_lib'

-- Custom notification function if Config.NotificationSystem is set to 'custom'
Config.CustomNotification = function(message, type)
    -- Example: exports.mythic_notify:SendAlert(type, message)
end

Config.Messages = {
    no_permission = 'You do not have permission to use the delgun.',
    no_target = 'No target found.',
    deleted = 'Entity deleted.',
    activated = 'Delgun activated.',
    deactivated = 'Delgun deactivated.',
    out_of_range = 'Target is out of range.',
}
