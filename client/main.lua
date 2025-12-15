QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    local v = Config.Peds.MafiaTanks1
    RequestModel(GetHashKey(v.model))
    while not HasModelLoaded(GetHashKey(v.model)) do
        Wait(1)
    end
    local ped = CreatePed(4, GetHashKey(v.model), v.location.x, v.location.y, v.location.z - 1.0, v.location.w, false, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    exports["qb-target"]:AddTargetEntity(ped, {
        options = {
            {
                event = "mafia:MafiaTankMenu",
                icon = "fa-solid fa-truck-moving",
                label = "Tanks Manager"
            }
        },
        distance = 2.0
    })
end)

RegisterNetEvent("mafia:MafiaTankMenu")
AddEventHandler("mafia:MafiaTankMenu", function()
    local PlayerData = QBCore.Functions.GetPlayerData()

    if PlayerData.gang.name == Config.MafiaName then 
        exports["qb-menu"]:openMenu({
            {
                header = "Main Menu",
                icon = "fa-solid fa-house",
                isMenuHeader = true,
            },
            {
                header = "Tank Spawning Actions",
                txt = "Tanks For Mafia",
                icon = "fa-solid fa-explosion",
                params = {
                    event = "mafia:openMafiaTankMenu"
                }
            },
            {
                header = "Close Menu",
                txt = "Exit and come back later",
                icon = "fa-solid fa-angles-left",
                params = {
                    event = ""
                }
            },
        })
    else
        QBCore.Functions.Notify("You are not an Mafia Boss! Access denied.", "error")
    end
end)

RegisterNetEvent("mafia:openMafiaTankMenu")
AddEventHandler("mafia:openMafiaTankMenu", function()
    local PlayerData = QBCore.Functions.GetPlayerData()

    if PlayerData.gang.name == Config.MafiaName then 
        exports["qb-menu"]:openMenu({
            {
                header = "Tanks Menu",
                icon = "fa-solid fa-truck-moving",
                isMenuHeader = true,
            },
            {
                header = "War Tanks!",
                txt = "Tanks For mafia",
                icon = "fa-solid fa-skull-crossbones",
                params = {
                    event = "mafia:startTankSpawn",
                    args = Config.Actions.tank.type
                }
            },
            {
                header = "Mafia tanks",
                txt = "Spawn a Mafia Tank",
                icon = "fa-solid fa-person-military-rifle",
                params = {
                    event = "mafia:spawnVehicleMenu",
                    args = Config.WarTanks.Tank.Military
                }
            },
            {
                header = "Mafia Boss",
                txt = "Spawn Mafia Cars",
                icon = "fa-solid fa-user-ninja",
                params = {
                    event = "mafia:spawnVehicleMenu2",
                    args = Config.Mafia.boss.cars
                }
            },
            {
                header = "Return back",
                txt = "Return back to the main menu",
                icon = "fa-solid fa-angle-left",
                params = {
                    event = "mafia:MafiaTankMenu"
                }
            },
            {
                header = "Close Menu",
                txt = "Exit and come back later",
                icon = "fa-solid fa-angles-left",
                params = {
                    event = ""
                }
            },
        })
    else
        QBCore.Functions.Notify("You are not an Mafia Boss! Access denied.", "error")
    end
end)


RegisterNetEvent('mafia:spawnVehicleMenu')
AddEventHandler('mafia:spawnVehicleMenu', function(vehicleList)
    local Player = QBCore.Functions.GetPlayerData()

    if Player.gang.name == Config.MafiaName then
        local VehicleMenu = {
            {
                header = "Available Tanks",
                icon = "fa-solid fa-jet-fighter",
                isMenuHeader = true
            },
        }

        for _, v in pairs(vehicleList) do
            table.insert(VehicleMenu, {
                header = "Vehicle: " .. v.name,
                txt = "Model: " .. v.model,
                icon = "fa-solid fa-jet-fighter",
                params = {
                    event = "mafia:spawnVehicle",
                    args = {
                        name = v.name,
                        model = v.model
                    }
                }
            })
        end

        table.insert(VehicleMenu, {
            header = "Return Back",
            txt = "Return To Tanks Menu",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "mafia:openMafiaTankMenu",
            }
        })

        table.insert(VehicleMenu, {
            header = "Close Menu",
            txt = "Exit vehicle selection",
            icon = "fa-solid fa-angles-left",
            params = {
                event = "qb-menu:closeMenu",
            }
        })

        

        exports['qb-menu']:openMenu(VehicleMenu)
    else
        QBCore.Functions.Notify("Access Denied!", "error")
    end
end)

RegisterNetEvent('mafia:spawnVehicleMenu2')
AddEventHandler('mafia:spawnVehicleMenu2', function(vehicleList2)
    local Player = QBCore.Functions.GetPlayerData()

    if Player.gang.name == Config.MafiaName then
        local VehicleMenu2 = {
            {
                header = "Available Tanks",
                icon = "fa-solid fa-jet-fighter",
                isMenuHeader = true
            },
        }

        for _, v in pairs(vehicleList2) do
            table.insert(VehicleMenu2, {
                header = "Vehicle: " .. v.name,
                txt = "Model: " .. v.model,
                icon = "fa-solid fa-jet-fighter",
                params = {
                    event = "mafia:spawnVehicle",
                    args = {
                        name = v.name,
                        model = v.model
                    }
                }
            })
        end

        table.insert(VehicleMenu2, {
            header = "Return Back",
            txt = "Return To Tanks Menu",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "mafia:openMafiaTankMenu",
            }
        })

        table.insert(VehicleMenu2, {
            header = "Close Menu",
            txt = "Exit vehicle selection",
            icon = "fa-solid fa-angles-left",
            params = {
                event = "qb-menu:closeMenu",
            }
        })

        

        exports['qb-menu']:openMenu(VehicleMenu2)
    else
        QBCore.Functions.Notify("Access Denied!", "error")
    end
end)




RegisterNetEvent('mafia:spawnVehicle')
AddEventHandler('mafia:spawnVehicle', function(data)
    local vehicleModel = data.model  
    local playerPed = PlayerPedId()
    local coords = Config.SpawnLocation

    if not vehicleModel then
        QBCore.Functions.Notify("❌ No Tank model provided!", "error")
        return
    end

    QBCore.Functions.Notify("Spawning Tank: " .. vehicleModel)

    RequestModel(vehicleModel)
    while not HasModelLoaded(vehicleModel) do
        Wait(1)
    end

    local spawnedVehicle = CreateVehicle(vehicleModel, coords.x, coords.y, coords.z, coords.w, true, false)
    SetPedIntoVehicle(playerPed, spawnedVehicle, -1)

    local plate = GetVehicleNumberPlateText(spawnedVehicle)
    TriggerEvent('vehiclekeys:client:SetOwner', plate)

    QBCore.Functions.Notify("🔑 You have been given the keys!", "success")
end)


RegisterNetEvent("train:Notify")
AddEventHandler("train:Notify", function(msg, time, type)
  Notify(msg, time, type)
end)


RegisterNetEvent('mafia:startTankSpawn')
AddEventHandler('mafia:startTankSpawn', function(tanksType)
    print("📌 Training Type Received:", tanksType) -- ✅ طباعة التصحيح

    if tanksType == "tank" then
        QBCore.Functions.Notify("Tanks Are Spawned", "success")
        TriggerEvent("mafia:spawnAutoTanks", "tank")
    else
        QBCore.Functions.Notify("❌ Invalid Tanks type!", "error")
        print("⚠️ ERROR: Received invalid Tanks type ->", tanksType) -- ✅ طباعة الخطأ
    end
end)


RegisterNetEvent('mafia:spawnAutoTanks')
AddEventHandler('mafia:spawnAutoTanks', function(tanksType)
    local spawnLocations = Config.TanksLocation
    local vehiclesToSpawn = {}

    if tanksType == "tank" then
        vehiclesToSpawn = {
            Config.WAR_TANKS.tank.mafia[1].model, 
            Config.WAR_TANKS.tank.mafia[2].model, 
            Config.WAR_TANKS.tank.mafia[3].model, 
            Config.WAR_TANKS.tank.mafia[4].model, 
            Config.WAR_TANKS.tank.mafia[5].model, 
            Config.WAR_TANKS.tank.mafia[6].model, 
            Config.WAR_TANKS.tank.mafia[7].model, 
            Config.WAR_TANKS.tank.mafia[8].model, 
            Config.WAR_TANKS.tank.mafia[9].model, 
            Config.WAR_TANKS.tank.mafia[10].model, 
            Config.WAR_TANKS.tank.mafia[11].model, 
            Config.WAR_TANKS.tank.mafia[12].model, 
            Config.WAR_TANKS.tank.mafia[13].model, 
            Config.WAR_TANKS.tank.mafia[14].model, 
            Config.WAR_TANKS.tank.mafia[15].model, 
            Config.WAR_TANKS.tank.mafia[16].model, 
            Config.WAR_TANKS.tank.mafia[17].model
        }
    else
        QBCore.Functions.Notify("❌ Invalid training type!", "error")
        return
    end
    
    local totalVehicles = #vehiclesToSpawn

    for i, coords in ipairs(spawnLocations) do

        local vehicleIndex = ((i - 1) % totalVehicles) + 1
        local model = GetHashKey(vehiclesToSpawn[vehicleIndex])
    
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(100)
        end
    
        print("🚗 Spawning vehicle: " .. vehiclesToSpawn[vehicleIndex] .. " at " .. coords.x .. ", " .. coords.y .. ", " .. coords.z)
    
        local vehicle = CreateVehicle(model, coords.x, coords.y, coords.z, coords.w, true, false)
        SetVehicleOnGroundProperly(vehicle)
        SetEntityAsMissionEntity(vehicle, true, true)

            -- Set vehicle properties
    exports[Config.fuelscript]:SetFuel(vehicle, 100.0) -- البترول فل
    SetVehicleDirtLevel(vehicle, 0.0)
    
    -- Try to give keys using different methods
    local plate = QBCore.Functions.GetPlate(vehicle)
    print("Vehicle spawned with plate: " .. plate)
    
    TriggerEvent("vehiclekeys:client:SetOwner", plate)
    
        QBCore.Functions.Notify("🚗 Spawned vehicle: " .. vehiclesToSpawn[vehicleIndex], "success")
    
        Wait(500)
    end
     
end)
