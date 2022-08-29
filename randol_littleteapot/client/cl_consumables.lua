local QBCore = exports['qb-core']:GetCoreObject()

-- CONSUMABLE EVENTS --          

RegisterNetEvent('randol_littleteapot:client:Eat', function(itemName)
    if itemName == "ltdonut" or itemName == "ltcookies" or itemName == "ltcroissant" then
        TriggerEvent('animations:client:EmoteCommandStart', {"donut"})
    else
        TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    end
    QBCore.Functions.Progressbar("eat_something", "Munching", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + HungerFill[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(5, 8))
    end)
end)

RegisterNetEvent('randol_littleteapot:client:Drink', function(itemName)
    if itemName == "teapotcoffee" or itemName == "teapottea" then 
        TriggerEvent('animations:client:EmoteCommandStart', {"coffee"})
    elseif itemName == "smoothieor" or itemName == "smoothiera" or itemName == "smoothiest" or itemName == "smoothiema" then
        TriggerEvent('animations:client:EmoteCommandStart', {"cup"})
    else   
        TriggerEvent('animations:client:EmoteCommandStart', {"drink"}) 
    end
    QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ThirstFill[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(5, 8))
    end)
end)


-- PRODUCTION EVENTS --          

RegisterNetEvent('randol_littleteapot:client:makebbpancakes', function()
	local ingredients = QBCore.Functions.HasItem({"pancakemix", "blueberries"})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"fbbq"})
        QBCore.Functions.Progressbar("teapot_cook", "Making pancakes..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("randol_littleteapot:server:makebbpancakes")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pancakemix"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["blueberries"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pancakesbb"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('randol_littleteapot:client:cooking')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('randol_littleteapot:client:cooking')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('randol_littleteapot:client:makesyruppancakes', function()
	local ingredients = QBCore.Functions.HasItem({"pancakemix", "maplesyrup"})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"fbbq"})
        QBCore.Functions.Progressbar("teapot_cook", "Making pancakes..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("randol_littleteapot:server:makesyruppancakes")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pancakemix"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["maplesyrup"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pancakesmaple"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('randol_littleteapot:client:cooking')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('randol_littleteapot:client:cooking')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('randol_littleteapot:client:makebaconegg', function()
	local ingredients = QBCore.Functions.HasItem({"lteggs", "ltbacon", "ltmuffin", "ltcheese"})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"fbbq"})
        QBCore.Functions.Progressbar("teapot_cook", "Making Bacon & Egg Muffin..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("randol_littleteapot:server:makebaconegg")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lteggs"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["ltbacon"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["ltmuffin"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["ltcheese"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["baconegg"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('randol_littleteapot:client:cooking')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('randol_littleteapot:client:cooking')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('randol_littleteapot:client:makeBLT', function()
	local ingredients = QBCore.Functions.HasItem({"ltbacon", "ltlettuce", "lttomato", "ltbuns"})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"fbbq"})
        QBCore.Functions.Progressbar("teapot_cook", "Making BLT Sandwich..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("randol_littleteapot:server:makeBLT")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["ltbacon"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["ltlettuce"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lttomato"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["ltbuns"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bltsandwich"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('randol_littleteapot:client:cooking')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('randol_littleteapot:client:cooking')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('randol_littleteapot:client:makeOJ', function()
	local ingredients = QBCore.Functions.HasItem("oranges")
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
        QBCore.Functions.Progressbar("teapot_cook", "Making some Orange Juice..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("randol_littleteapot:server:makeOJ")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["oranges"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["teapotorange"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
        end)
    else		
        QBCore.Functions.Notify('You don\'t have any Oranges.', 'error')
    end
end)

RegisterNetEvent('randol_littleteapot:client:makesmoothieOrange', function()
	local ingredients = QBCore.Functions.HasItem("oranges")
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
        QBCore.Functions.Progressbar("teapot_cook", "Making Orange Smoothie.", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("randol_littleteapot:server:makesmoothieOrange")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["oranges"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["smoothieor"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
        end)
    else		
        QBCore.Functions.Notify('You don\'t have any Oranges.', 'error')
    end
end)

RegisterNetEvent('randol_littleteapot:client:makesmoothieRaspberry', function()
	local ingredients = QBCore.Functions.HasItem("ltraspberry")
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
        QBCore.Functions.Progressbar("teapot_cook", "Making Raspberry Smoothie.", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("randol_littleteapot:server:makesmoothieRaspberry")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["ltraspberry"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["smoothiera"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
        end)
    else		
        QBCore.Functions.Notify('You don\'t have any Raspberries.', 'error')
    end
end)

RegisterNetEvent('randol_littleteapot:client:makesmoothieStrawberry', function()
	local ingredients = QBCore.Functions.HasItem("ltstrawberry")
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
        QBCore.Functions.Progressbar("teapot_cook", "Making Strawberry Smoothie.", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("randol_littleteapot:server:makesmoothieStrawberry")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["ltstrawberry"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["smoothiest"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
        end)
    else		
        QBCore.Functions.Notify('You don\'t have any Strawberries.', 'error')
    end
end)

RegisterNetEvent('randol_littleteapot:client:makesmoothieMango', function()
	local ingredients = QBCore.Functions.HasItem("ltmango")
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
        QBCore.Functions.Progressbar("teapot_cook", "Making Mango Smoothie.", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("randol_littleteapot:server:makesmoothieMango")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["ltmango"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["smoothiema"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
        end)
    else		
        QBCore.Functions.Notify('You don\'t have any Mango.', 'error')
    end
end)

RegisterNetEvent('randol_littleteapot:client:makeCoffee', function()
	local ingredients = QBCore.Functions.HasItem("coffeebeans")
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
        QBCore.Functions.Progressbar("teapot_cook", "Making some Coffee..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("randol_littleteapot:server:makeCoffee")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["coffeebeans"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["teapotcoffee"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
        end)
    else		
        QBCore.Functions.Notify('You don\'t have any Coffee Beans.', 'error')
    end
end)

RegisterNetEvent('randol_littleteapot:client:makeTea', function()
	local ingredients = QBCore.Functions.HasItem("ltteabags")
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
        QBCore.Functions.Progressbar("teapot_cook", "Making some Tea..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("randol_littleteapot:server:makeTea")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["ltteabags"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["teapottea"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
        end)
    else		
        QBCore.Functions.Notify('You don\'t have any Tea Bags.', 'error')
    end
end)


-- MENUS --     

RegisterNetEvent('randol_littleteapot:closemenu', function()
    ClearPedTasksImmediately(PlayerPedId())
    TriggerEvent("qb-menu:closeMenu")
end)

RegisterNetEvent('randol_littleteapot:client:cooking', function()
    SetEntityCoords(PlayerPedId(), -514.36, -36.81, 44.72)
    SetEntityHeading(PlayerPedId(), 177.04)
    exports['qb-menu']:openMenu({
        {
            header = "Little Teapot Stove",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Blueberry Pancakes",
            txt = "Requires:</p>1x Blueberries | 1x Pancake Mix",
            icon = "fa-solid fa-utensils",
            params = {
                event = "randol_littleteapot:client:makebbpancakes",
            }
        },
        {
            header = "Maple Syrup Pancakes",
            txt = "Requires:</p>1x Maple Syrup | 1x Pancake Mix",
            icon = "fa-solid fa-utensils",
            params = {
                event = "randol_littleteapot:client:makesyruppancakes",
            }
        },
        {
            header = "Bacon & Egg Muffin",
            txt = "Requires:</p>1x Bacon | 1x Egg | 1x Cheese | 1x Muffin",
            icon = "fa-solid fa-utensils",
            params = {
                event = "randol_littleteapot:client:makebaconegg",
            }
        },
        {
            header = "BLT Sandwich",
            txt = "Requires:</p>1x Bacon | 1x Lettuce | 1x Tomato | 1x Buns",
            icon = "fa-solid fa-utensils",
            params = {
                event = "randol_littleteapot:client:makeBLT",
            }
        },
        {
            header = "Exit",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "randol_littleteapot:closemenu"
            }
        },
    })
end)

RegisterNetEvent('randol_littleteapot:client:choppingboard', function()
    SetEntityCoords(PlayerPedId(), -513.33, -35.42, 44.72)
    SetEntityHeading(PlayerPedId(), 269.81)
    exports['qb-menu']:openMenu({
        {
            header = "Drink Station",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Orange Juice",
            txt = "Requires:</p>1x Oranges",
            icon = "fa-solid fa-glass-water",
            params = {
                event = "randol_littleteapot:client:makeOJ",
            }
        },
        {
            header = "Orange Smoothie",
            txt = "Requires:</p>1x Oranges",
            icon = "fa-solid fa-glass-water",
            params = {
                event = "randol_littleteapot:client:makesmoothieOrange",
            }
        },
        {
            header = "Raspberry Smoothie",
            txt = "Requires:</p>1x Raspberries",
            icon = "fa-solid fa-glass-water",
            params = {
                event = "randol_littleteapot:client:makesmoothieRaspberry",
            }
        },
        {
            header = "Strawberry Smoothie",
            txt = "Requires:</p>1x Strawberries",
            icon = "fa-solid fa-glass-water",
            params = {
                event = "randol_littleteapot:client:makesmoothieStrawberry",
            }
        },
        {
            header = "Mango Smoothie",
            txt = "Requires:</p>1x Mango",
            icon = "fa-solid fa-glass-water",
            params = {
                event = "randol_littleteapot:client:makesmoothieMango",
            }
        },
        {
            header = "Exit",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "randol_littleteapot:closemenu"
            }
        },
    })
end)

RegisterNetEvent('randol_littleteapot:client:coffeestation', function()
    SetEntityCoords(PlayerPedId(), -514.32, -34.26, 44.72)
    SetEntityHeading(PlayerPedId(), 87.47)
    exports['qb-menu']:openMenu({
        {
            header = "Hot Drink Station",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Coffee",
            txt = "Requires:</p>1x Coffee Beans",
            icon = "fa-solid fa-mug-hot",
            params = {
                event = "randol_littleteapot:client:makeCoffee",
            }
        },
        {
            header = "Tea",
            txt = "Requires:</p>1x Tea Bags",
            icon = "fa-solid fa-mug-hot",
            params = {
                event = "randol_littleteapot:client:makeTea",
            }
        },
        {
            header = "Exit",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "randol_littleteapot:closemenu"
            }
        },
    })
end)

RegisterNetEvent('randol_littleteapot:client:buyrandomsweet', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"parkingmeter"})
    exports['qb-menu']:openMenu({
        {
            header = "Sweet Treats",
            txt = "Freshly made today!",
            isMenuHeader = true
        },
        {
            header = "LT Cookie",
            txt = "Purchase a Cookie",
            icon = "fa-solid fa-cookie",
            params = {
                event = "randol_littleteapot:server:buyrandomsweet",
                isServer = true,
                args = 1
            }
        },
        {
            header = "LT Donut",
            txt = "Purchase a Donut",
            icon = "fa-solid fa-cookie",
            params = {
                event = "randol_littleteapot:server:buyrandomsweet",
                isServer = true,
                args = 2
            }
        },
        { 
            header = "LT Croissant",
            txt = "Purchase a Croissant",
            icon = "fa-solid fa-cookie",
            params = {
                event = "randol_littleteapot:server:buyrandomsweet",
                isServer = true,
                args = 3
            }
        },
        {
            header = "Exit",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "randol_littleteapot:closemenu"
            }
        },
    })
end)