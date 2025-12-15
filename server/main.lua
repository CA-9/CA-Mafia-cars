QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('mafia:spawnVehicle', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player and Player.PlayerData.gang.name == Config.MafiaName then
        TriggerClientEvent('mafia:openVehicleMenu', src)
    end
end)