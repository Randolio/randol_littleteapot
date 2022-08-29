# randol_littleteapot
Little Teapot Job for QBCore

# A universal cooking emote that females & males can use. Add to dpemotes > client > AnimationList.lua

["fbbq"] = {"amb@prop_human_bbq@male@idle_a", "idle_b", "fbbq", AnimationOptions =
   {
       Prop = "prop_fish_slice_01",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       --
       EmoteLoop = true,
       EmoteMoving = false,
   }},

# Cup emote. (Not sure if it's default or I added it myself. Was a while ago.)

["cup"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Cup", AnimationOptions =
{
    Prop = 'prop_plastic_cup_02',
    PropBone = 28422,
    PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    EmoteLoop = true,
    EmoteMoving = true,
}},

#  Add these items to qb-core/shared/items.lua
# Little Teapot items
["pancakesbb"] = { ["name"] = "pancakesbb", ["label"] = "Blueberry Pancakes", ["weight"] = 10, ["type"] = "item", ["image"] = "pancakesbb.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Yum." },
["pancakesmaple"] = { ["name"] = "pancakesmaple", ["label"] = "Syrup Pancakes", ["weight"] = 10, ["type"] = "item", ["image"] = "pancakesmaple.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Yum." },
["pancakemix"] = { ["name"] = "pancakemix", ["label"] = "Pancake Mix", ["weight"] = 10, ["type"] = "item", ["image"] = "pancakemix.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Pancake mix." },
["blueberries"] = { ["name"] = "blueberries", ["label"] = "Blueberries", ["weight"] = 10, ["type"] = "item", ["image"] = "blueberries.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Blueberries." },
["maplesyrup"] = { ["name"] = "maplesyrup", ["label"] = "Maple Syrup", ["weight"] = 10, ["type"] = "item", ["image"] = "maplesyrup.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Maple Syrup." },
["baconegg"] = { ["name"] = "baconegg", ["label"] = "B.E Muffin", ["weight"] = 10, ["type"] = "item", ["image"] = "baconegg.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Like McDonalds but better." },
["lteggs"] = { ["name"] = "lteggs", ["label"] = "LT Eggs", ["weight"] = 10, ["type"] = "item", ["image"] = "lteggs.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["ltcheese"] = { ["name"] = "ltcheese", ["label"] = "LT Cheese", ["weight"] = 10, ["type"] = "item", ["image"] = "ltcheese.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["ltmuffin"] = { ["name"] = "ltmuffin", ["label"] = "Muffin Bun", ["weight"] = 10, ["type"] = "item", ["image"] = "ltmuffin.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["ltbacon"] = { ["name"] = "ltbacon", ["label"] = "Bacon", ["weight"] = 10, ["type"] = "item", ["image"] = "ltbacon.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["teapotorange"] = { ["name"] = "teapotorange", ["label"] = "Orange Juice", ["weight"] = 10, ["type"] = "item", ["image"] = "teapotorange.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["oranges"] = { ["name"] = "oranges", ["label"] = "Oranges", ["weight"] = 10, ["type"] = "item", ["image"] = "oranges.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["teapotcoffee"] = { ["name"] = "teapotcoffee", ["label"] = "Cup of Coffee", ["weight"] = 10, ["type"] = "item", ["image"] = "teapotcoffee.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["ltbox"] = { ["name"] = "ltbox", ["label"] = "LT Ingredients", ["weight"] = 10, ["type"] = "item", ["image"] = "ltbox.png", ["unique"] = true, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["coffeebeans"] = { ["name"] = "coffeebeans", ["label"] = "Coffee Beans", ["weight"] = 10, ["type"] = "item", ["image"] = "coffeebeans.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["ltbuns"] = { ["name"] = "ltbuns", ["label"] = "Breakfast Buns", ["weight"] = 10, ["type"] = "item", ["image"] = "ltbuns.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["ltlettuce"] = { ["name"] = "ltlettuce", ["label"] = "Lettuce", ["weight"] = 10, ["type"] = "item", ["image"] = "ltlettuce.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["lttomato"] = { ["name"] = "lttomato", ["label"] = "Tomato", ["weight"] = 10, ["type"] = "item", ["image"] = "lttomato.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["bltsandwich"] = { ["name"] = "bltsandwich", ["label"] = "BLT Sandwich", ["weight"] = 10, ["type"] = "item", ["image"] = "bltsandwich.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["ltteabags"] = { ["name"] = "ltteabags", ["label"] = "Tea Bags", ["weight"] = 10, ["type"] = "item", ["image"] = "ltteabags.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["teapottea"] = { ["name"] = "teapottea", ["label"] = "Cup of Tea", ["weight"] = 10, ["type"] = "item", ["image"] = "teapottea.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["ltcookies"] = {["name"] = "ltcookies", ["label"] = "Cookie",  ["weight"] = 10, ["type"] = "item", ["image"] = "ltcookies.png", ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Cookies"},
["ltdonut"]   = {["name"] = "ltdonut", ["label"] = "Donut", ["weight"] = 10, ["type"] = "item", ["image"] = "ltdonut.png", ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Donut"},
["ltcroissant"] ={["name"] = "ltcroissant", ["label"] = "Croissant", ["weight"] = 10, 		["type"] = "item", 			["image"] = "ltcroissant.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Croissant"},
["smoothieor"] = { ["name"] = "smoothieor", ["label"] = "Orange Smoothie", ["weight"] = 10, ["type"] = "item", ["image"] = "smoothieor.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Orange Smoothie" },
["smoothiera"] = { ["name"] = "smoothiera", ["label"] = "Raspberry Smoothie", ["weight"] = 10, ["type"] = "item", ["image"] = "smoothiera.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Raspberry Smoothie" },
["ltraspberry"] = { ["name"] = "ltraspberry", ["label"] = "Raspberries", ["weight"] = 10, ["type"] = "item", ["image"] = "ltraspberry.png", ["unique"] = false, ['useable'] = false, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Raspberries" },
["smoothiest"] = { ["name"] = "smoothiest", ["label"] = "Strawberry Smoothie", ["weight"] = 10, ["type"] = "item", ["image"] = "smoothiest.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Strawberry Smoothie" },
["ltstrawberry"] = { ["name"] = "ltstrawberry", ["label"] = "Strawberries", ["weight"] = 10, ["type"] = "item", ["image"] = "ltstrawberry.png", ["unique"] = false, ['useable'] = false, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Strawberries" },
["smoothiema"] = { ["name"] = "smoothiema", ["label"] = "Mango Smoothie", ["weight"] = 10, ["type"] = "item", ["image"] = "smoothiema.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Mango Smoothie" },
["ltmango"] = { ["name"] = "ltmango", ["label"] = "Mango", ["weight"] = 10, ["type"] = "item", ["image"] = "ltmango.png", ["unique"] = false, ['useable'] = false, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Mango" },

# "teapot" job to be added to qb-core/shared/jobs.lua (Can add more grades if you want?)

['teapot'] = { label = 'Little Teapot', defaultDuty = false, offDutyPay = false, grades = {
        ['0'] = { name = 'Trainee', payment = 125},
        ['1'] = { name = 'Employee', payment = 215},
        ['2'] = { name = 'Supervisor', payment = 325},
        ['3'] = { name = 'Manager', payment = 475},
        ['4'] = { name = 'Owner', isboss = true, payment = 525},
    }
},

### Credits: Pablito for providing this cute FREE MLO. Can get it from his discord! Also check out his tebex link below.
https://discord.gg/QMyTtum
https://pablitointeriors.tebex.io/category/2066498
