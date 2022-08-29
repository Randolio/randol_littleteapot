local QBCore = exports['qb-core']:GetCoreObject() -- Core
local PlayerData = {}
local PlayerJob = {}
local orderActive = false


-- RESOURCE START/STOP | PLAYER LOAD/UNLOAD --

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        PlayerData = QBCore.Functions.GetPlayerData()
        PlayerJob = QBCore.Functions.GetPlayerData().job
        TeapotBlip()
        TeapotZones()
        ManagementSafe()
        orderActive = false
    end
end)

AddEventHandler('onResourceStop', function(resourceName) 
	if GetCurrentResourceName() == resourceName then
        exports['qb-target']:RemoveZone("teapotcounter")
        exports['qb-target']:RemoveZone("teapotfridge")
        exports['qb-target']:RemoveZone("teapotcooker")
        exports['qb-target']:RemoveZone("dutyregister")
        exports['qb-target']:RemoveZone("drinkstation")
        exports['qb-target']:RemoveZone("coffeeshit")
        exports['qb-target']:RemoveZone("randomgoodie")
        RemoveBlip(teapot)
        DeleteEntity(teapotpackage)
        DeleteEntity(teapotsafe)
	end 
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    TeapotBlip()
    TeapotZones()
    ManagementSafe()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    exports['qb-target']:RemoveZone("teapotcounter")
    exports['qb-target']:RemoveZone("teapotfridge")
    exports['qb-target']:RemoveZone("teapotcooker")
    exports['qb-target']:RemoveZone("dutyregister")
    exports['qb-target']:RemoveZone("drinkstation")
    exports['qb-target']:RemoveZone("coffeeshit")
    exports['qb-target']:RemoveZone("randomgoodie")
    RemoveBlip(teapot)
    DeleteEntity(teapotpackage)
    DeleteEntity(teapotsafe)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
    PlayerJob = JobInfo
end)


-- FUNCTIONS AND SHIT --

function TeapotBlip()
    if not DoesBlipExist(teapot) then
        teapot = AddBlipForCoord(Config.Blip)
        SetBlipSprite(teapot, 208)
        SetBlipDisplay(teapot, 4)
        SetBlipScale(teapot, 0.7)
        SetBlipAsShortRange(teapot, true)
        SetBlipColour(teapot, 9)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName("Little Teapot")
        EndTextCommandSetBlipName(teapot)
    end
end

function TeapotZones()
    exports['qb-target']:AddBoxZone("teapotcounter", vector3(-509.76, -33.94, 45.73), 0.8, 2.6, { name="teapotcounter", heading=355, minZ=45.53, maxZ=46.13,
    }, {options = {{type = "client",event = "randol_littleteapot:client:usecounter",icon = "fa-solid fa-hand",label = "Use Counter",},},distance = 2.5})

    exports['qb-target']:AddBoxZone("coffeeshit", vector3(-515.21, -34.18, 45.72), 0.8, 1, { name="coffeeshit", heading=0, minZ=45.52, maxZ=46.12,
    }, {options = {{type = "client",event = "randol_littleteapot:client:coffeestation",icon = "fa-solid fa-mug-hot",label = "Use Machine",job = "teapot",},},distance = 1.5})

    exports['qb-target']:AddBoxZone("teapotfridge", vector3(-512.45, -32.98, 45.72), 1, 1, { name="teapotfridge", heading=355, minZ=42.72, maxZ=46.72,
    }, {options = {{type = "client",event = "randol_littleteapot:client:jobstash",icon = "fa-solid fa-hand",label = "Fridge",job = "teapot",},},distance = 1.5})

    exports['qb-target']:AddCircleZone("teapotcooker", vector3(-514.74, -37.5, 45.37), 0.6, { name="teapotcooker", useZ=true,
    }, {options = {{type = "client",event = "randol_littleteapot:client:cooking",icon = "fa-solid fa-fire-burner",label = "Cook",job = "teapot",},},distance = 1.5})

    exports['qb-target']:AddCircleZone("drinkstation", vector3(-512.85, -35.48, 45.72), 0.3, { name="drinkstation", useZ=true,
    }, {options = {{type = "client",event = "randol_littleteapot:client:choppingboard",icon = "fa-solid fa-blender",label = "Fruit Drinks",job = "teapot",},},distance = 1.5})

    exports['qb-target']:AddCircleZone("randomgoodie", vector3(-514.19, -27.83, 45.57), 0.4, { name="randomgoodie", useZ=true,
    }, {options = {{type = "client",event = "randol_littleteapot:client:buyrandomsweet",icon = "fa-solid fa-cookie",label = "Purchase Treats",},},distance = 1.5})

    exports['qb-target']:AddCircleZone("dutyregister", vector3(-507.96, -34.51, 46.03), 0.4, { name="dutyregister", useZ=true,
    }, {options = {{type = "client",event = "randol_littleteapot:client:toggleduty",icon = "fa-solid fa-clock",label = "Clock In/Out",job = "teapot",},
    {type = "client",event = "randol_littleteapot:bill",icon = "fa-brands fa-cc-visa",label = "Charge Customer",job = "teapot",},
    {type = "server", event = "randol_littleteapot:purchaseingredients", icon = "fa-solid fa-phone", label = "Order Ingredients", job = "teapot", canInteract = function() if orderActive then return false end return true end, }, }, distance = 1.5 })
end

function OrderPackage()
    if not DoesEntityExist(teapotpackage) then
        RequestModel("hei_prop_heist_box")
        while not HasModelLoaded("hei_prop_heist_box") do
            Wait(0)
        end
        teapotpackage = CreateObject("hei_prop_heist_box", -507.65, -22.94, 44.61, false, false, false)
        SetEntityHeading(teapotpackage, 90.99)
        SetEntityAsMissionEntity(teapotpackage)
        FreezeEntityPosition(teapotpackage, true)
        exports['qb-target']:AddTargetEntity(teapotpackage, {
            options = {
                {
                    type = "client",
                    icon = "fa-solid fa-box-open",
                    label = "Grab Package",
                    event = "randol_littleteapot:client:deletepackage",
                    job = "teapot",
                },
            },
            distance = 1.5
        })
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "doorbell", 0.25)
        QBCore.Functions.Notify("Your order has arrived outside.")
    end
end

function ManagementSafe()
    if not DoesEntityExist(teapotsafe) then
        RequestModel("prop_ld_int_safe_01")
        while not HasModelLoaded("prop_ld_int_safe_01") do
            Wait(0)
        end
        teapotsafe = CreateObject("prop_ld_int_safe_01", -513.43, -37.79, 44.72, false, false, false)
        SetEntityHeading(teapotsafe, 177.02)
        SetEntityAsMissionEntity(teapotsafe)
        FreezeEntityPosition(teapotsafe, true)
        exports['qb-target']:AddTargetEntity(teapotsafe, {
            options = {
                {
                    type = "client",
                    icon = "fa-solid fa-briefcase",
                    label = "Manage Business",
                    event = "qb-bossmenu:client:OpenMenu",
                    job = "teapot",
                },
            },
            distance = 1.5
        })
    end
end

-- EVENTS --

RegisterNetEvent('randol_littleteapot:client:jobstash', function()
    TriggerEvent('inventory:client:SetCurrentStash', 'Teapot Stash')
    TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'Teapot Stash', {
        maxweight = 8000000,
        slots = 50,
    })
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "StashOpen", 0.4)
end)

RegisterNetEvent('randol_littleteapot:client:usecounter', function()
    TriggerEvent('inventory:client:SetCurrentStash', 'Teapot Counter')
    TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'Teapot Counter', {
        maxweight = 100000,
        slots = 10,
    })
end)

RegisterNetEvent("randol_littleteapot:client:toggleduty")
AddEventHandler("randol_littleteapot:client:toggleduty", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("randol_littleteapot:bill")
AddEventHandler("randol_littleteapot:bill", function()
    local bill = exports['qb-input']:ShowInput({
        header = "Teapot Billing",
		submitText = "Charge",
        inputs = {
            {
                text = "Server ID(#)",
				name = "citizenid", 
                type = "text", 
                isRequired = true --
            },
            {
                text = "   Bill Price ($)",
                name = "billprice", 
                type = "number",
                isRequired = false
            }
			
        }
    })
    if bill ~= nil then
        if bill.citizenid == nil or bill.billprice == nil then 
            return 
        end
        TriggerServerEvent("randol_littleteapot:bill:player", bill.citizenid, bill.billprice)
    end
end)

RegisterNetEvent("randol_littleteapot:client:callforpackage")
AddEventHandler("randol_littleteapot:client:callforpackage", function()
    if not orderActive then
        orderActive = true
        TriggerEvent('animations:client:EmoteCommandStart', {"phonecall"})
        QBCore.Functions.Progressbar("teapot_phone", "Ordering Ingredients", 5000, false, false, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            QBCore.Functions.Notify("Package is on it's way.")
            SetTimeout(Config.DeliveryTime, function()
                OrderPackage()
            end)
        end)
    end
end)

RegisterNetEvent("randol_littleteapot:client:deletepackage")
AddEventHandler("randol_littleteapot:client:deletepackage", function()
    DeleteObject(teapotpackage)
    TriggerEvent('animations:client:EmoteCommandStart', {"box"})
    TriggerServerEvent("randol_littleteapot:server:giveBox") -- Gives ingredients box.
    Wait(2000)
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    orderActive = false
end)

RegisterNetEvent("randol_littleteapot:client:unpack")
AddEventHandler("randol_littleteapot:client:unpack", function()
    TriggerEvent('animations:client:EmoteCommandStart', {"bumbin"})
    QBCore.Functions.Progressbar("teapot_open", "Unpacking Ingredients", 5000, false, false, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("randol_littleteapot:server:openBox")
    end)
end)