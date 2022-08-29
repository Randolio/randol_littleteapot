local QBCore = exports['qb-core']:GetCoreObject() -- Core

RegisterNetEvent('QBCore:Server:UpdateObject', function()
	if source ~= '' then return false end
	QBCore = exports['qb-core']:GetCoreObject()
end)


-- USEABLE ITEMS --          

QBCore.Functions.CreateUseableItem("pancakesbb", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("randol_littleteapot:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("pancakesmaple", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("randol_littleteapot:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("baconegg", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("randol_littleteapot:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("teapotorange", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("randol_littleteapot:client:Drink", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("teapotcoffee", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("randol_littleteapot:client:Drink", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("teapottea", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("randol_littleteapot:client:Drink", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("smoothieor", function(source, item) -- orange
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("randol_littleteapot:client:Drink", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("smoothiera", function(source, item) -- raspberry
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("randol_littleteapot:client:Drink", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("smoothiest", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("randol_littleteapot:client:Drink", src, item.name) -- strawberry
    end
end)

QBCore.Functions.CreateUseableItem("smoothiema", function(source, item) -- mango
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("randol_littleteapot:client:Drink", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("bltsandwich", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("randol_littleteapot:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("ltbox", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("randol_littleteapot:client:unpack", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("ltdonut", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("randol_littleteapot:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("ltcroissant", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("randol_littleteapot:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("ltcookies", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("randol_littleteapot:client:Eat", src, item.name)
    end
end)


-- BILLING --          

RegisterServerEvent("randol_littleteapot:bill:player")
AddEventHandler("randol_littleteapot:bill:player", function(playerId, amount)
    local biller = QBCore.Functions.GetPlayer(source)
    local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
    local amount = tonumber(amount)
    if biller.PlayerData.job.name == 'teapot' then
        if billed ~= nil then
            if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                if amount and amount > 0 then
                billed.Functions.RemoveMoney('bank', amount)
                TriggerClientEvent('QBCore:Notify', source, 'You charged a customer.', 'success')
                TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'You have been charged $'..amount..' for your order at Little Teapot.')
                exports['qb-management']:AddMoney('teapot', amount)
                else
                    TriggerClientEvent('QBCore:Notify', source, 'Must be a valid amount above 0', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'You cannot bill yourself', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'Player not online', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', source, 'No access', 'error')
    end
end)


-- ADD/REMOVE EVENTS --          

RegisterNetEvent('randol_littleteapot:server:makebbpancakes', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem('pancakemix', 1)
    Player.Functions.RemoveItem('blueberries', 1)
    Player.Functions.AddItem('pancakesbb', 1)
end)

RegisterNetEvent('randol_littleteapot:server:makesyruppancakes', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem('pancakemix', 1)
    Player.Functions.RemoveItem('maplesyrup', 1)
    Player.Functions.AddItem('pancakesmaple', 1)
end)

RegisterNetEvent('randol_littleteapot:server:makebaconegg', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem('ltmuffin', 1)
    Player.Functions.RemoveItem('ltbacon', 1)
    Player.Functions.RemoveItem('ltcheese', 1)
    Player.Functions.RemoveItem('lteggs', 1)
    Player.Functions.AddItem('baconegg', 1)
end)

RegisterNetEvent('randol_littleteapot:server:makeBLT', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem('ltbacon', 1)
    Player.Functions.RemoveItem('ltlettuce', 1)
    Player.Functions.RemoveItem('lttomato', 1)
    Player.Functions.RemoveItem('ltbuns', 1)
    Player.Functions.AddItem('bltsandwich', 1)
end)

RegisterNetEvent('randol_littleteapot:server:makeOJ', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem('oranges', 1)
    Player.Functions.AddItem('teapotorange', 1)
end)

RegisterNetEvent('randol_littleteapot:server:makeCoffee', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem('coffeebeans', 1)
    Player.Functions.AddItem('teapotcoffee', 1)
end)

RegisterNetEvent('randol_littleteapot:server:makeTea', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem('ltteabags', 1)
    Player.Functions.AddItem('teapottea', 1)
end)

RegisterNetEvent('randol_littleteapot:server:makesmoothieOrange', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem('oranges', 1)
    Player.Functions.AddItem('smoothieor', 1)
end)

RegisterNetEvent('randol_littleteapot:server:makesmoothieRaspberry', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem('ltraspberry', 1)
    Player.Functions.AddItem('smoothiera', 1)
end)

RegisterNetEvent('randol_littleteapot:server:makesmoothieStrawberry', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem('ltstrawberry', 1)
    Player.Functions.AddItem('smoothiest', 1)
end)

RegisterNetEvent('randol_littleteapot:server:makesmoothieMango', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem('ltmango', 1)
    Player.Functions.AddItem('smoothiema', 1)
end)

RegisterNetEvent('randol_littleteapot:server:giveBox', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.AddItem('ltbox', 1)
    TriggerClientEvent('QBCore:Notify', source, 'You have your ingredients now.', 'success')
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['ltbox'], 'add')
end)

RegisterNetEvent('randol_littleteapot:server:openBox', function() -- Open Ingredients Box.
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    for cum, penis in pairs(Config.BoxIngredients) do
        local amount = 30
        Player.Functions.AddItem(penis, amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[penis], 'add')
    end
    TriggerClientEvent('QBCore:Notify', source, 'You unpack all the ingredients.', 'success')
end)

RegisterNetEvent('randol_littleteapot:server:buyrandomsweet', function(args) 
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local args = tonumber(args)
    local bank = Player.PlayerData.money['bank']
    if args == 1 then
        if bank >= Config.SweetPrice then
            Player.Functions.AddItem("ltcookies", 1)
            Player.Functions.RemoveMoney('bank', Config.SweetPrice)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["ltcookies"], 'add')
            TriggerClientEvent('QBCore:Notify', src, 'You paid $'..Config.SweetPrice..' for a Cookie.', 'success')
            exports['qb-management']:AddMoney('teapot', math.floor(Config.SweetPrice*0.5)) -- Business gets half the money.
            Wait(1000)
            TriggerClientEvent('randol_littleteapot:client:buyrandomsweet', src)
        else
            TriggerClientEvent('QBCore:Notify', src, 'You can\'t afford this.', 'error')
            TriggerClientEvent('randol_littleteapot:client:buyrandomsweet', src)
        end
    elseif args == 2 then
        if bank >= Config.SweetPrice then
            Player.Functions.AddItem("ltdonut", 1)
            Player.Functions.AddMoney('bank', Config.SweetPrice)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["ltdonut"], 'add')
            TriggerClientEvent('QBCore:Notify', src, 'You paid $'..Config.SweetPrice..' for a Donut.', 'success')
            exports['qb-management']:AddMoney('teapot', math.floor(Config.SweetPrice*0.5)) -- Business gets half the money.
            Wait(1000)
            TriggerClientEvent('randol_littleteapot:client:buyrandomsweet', src)
        else
            TriggerClientEvent('QBCore:Notify', src, 'You can\'t afford this.', 'error')
            TriggerClientEvent('randol_littleteapot:client:buyrandomsweet', src)
        end
    elseif args == 3 then
        if bank >= Config.SweetPrice then
            Player.Functions.AddItem("ltcroissant", 1)
            Player.Functions.AddMoney('bank', Config.SweetPrice)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["ltcroissant"], 'add')
            TriggerClientEvent('QBCore:Notify', src, 'You paid $'..Config.SweetPrice..' for a Croissant.', 'success')
            exports['qb-management']:AddMoney('teapot', math.floor(Config.SweetPrice*0.5)) -- Business gets half the money.
            Wait(1000)
            TriggerClientEvent('randol_littleteapot:client:buyrandomsweet', src)
        else
            TriggerClientEvent('QBCore:Notify', src, 'You can\'t afford this.', 'error')
            TriggerClientEvent('randol_littleteapot:client:buyrandomsweet', src)
        end
    end
end)

RegisterNetEvent('randol_littleteapot:purchaseingredients', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local funds = exports['qb-management']:GetAccount('teapot')
    if Player.PlayerData.job.name == "teapot" then
        if Player.PlayerData.job.onduty then
            if funds >= Config.IngredientsPrice then
                exports['qb-management']:RemoveMoney('teapot', Config.IngredientsPrice)
                TriggerClientEvent('QBCore:Notify', src, 'You paid $'..Config.IngredientsPrice..' from the business account.', 'success')
                TriggerClientEvent('randol_littleteapot:client:callforpackage', src)
            else
                TriggerClientEvent('QBCore:Notify', src, 'Funds are looking a little low buddy.', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'You must be clocked in to make orders.', 'error')
        end
    end
end)


