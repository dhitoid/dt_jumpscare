local Framework = nil

CreateThread(function()
    if GetResourceState('qb-core') == 'started' then
        Framework = 'qbcore'
        QBCore = exports['qb-core']:GetCoreObject()
    elseif GetResourceState('es_extended') == 'started' then
        Framework = 'esx'
        ESX = exports['es_extended']:getSharedObject()
    else
        print('^1[ERROR] No framework detected! Make sure to use QB-Core or ESX.^0')
    end
end)

RegisterCommand('jumpscare', function(source, args)
    local isAdmin = false
    if Framework == 'qbcore' then
        if QBCore.Functions.HasPermission(source, 'admin') then
            isAdmin = true
        end
    elseif Framework == 'esx' then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer and xPlayer.getGroup and xPlayer.getGroup() == "admin" then
            isAdmin = true
        end
    end

    if IsPlayerAceAllowed(source, "group.admin") then
        isAdmin = true
    end

    if not isAdmin then
        if Framework == 'qbcore' then
            TriggerClientEvent('QBCore:Notify', source, '❌ You do not have permission to use this command!', 'error', 5000)
        elseif Framework == 'esx' then
            TriggerClientEvent('esx:showNotification', source, '❌ You do not have permission to use this command!')
        end
        return
    end

    if not args[1] then
        if Framework == 'qbcore' then
            TriggerClientEvent('QBCore:Notify', source, '❌ Use: /jumpscare <id>', 'error', 5000)
        elseif Framework == 'esx' then
            TriggerClientEvent('esx:showNotification', source, '❌ Use: /jumpscare <id>')
        end
        return
    end

    local targetId = tonumber(args[1])
    if not targetId or not GetPlayerName(targetId) then
        if Framework == 'qbcore' then
            TriggerClientEvent('QBCore:Notify', source, '❌ Player not found!', 'error', 5000)
        elseif Framework == 'esx' then
            TriggerClientEvent('esx:showNotification', source, '❌ Player not found!')
        end
        return
    end

    TriggerClientEvent('dt_jumpscare:show', targetId, Config.imgdiscord)
end, false)
