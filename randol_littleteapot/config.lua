Config = {}

Config.Blip = vector3(-510.55, -30.93, 45.72) -- Blip, don't touch.

Config.DeliveryTime = 25000 -- 25 seconds to deliver package outside.

Config.IngredientsPrice = 1500 -- Price to get a box containing 30x of each ingredient in the Config.BoxIngredients table below.

Config.SweetPrice = 75 -- Price for sweet treats. (cookie, donut, croissant)

HungerFill = { -- How much they fill your hunger
    ["baconegg"] = math.random(35, 45),
    ["pancakesbb"] = math.random(35, 45),
    ["pancakesmaple"] = math.random(35, 45),
    ["bltsandwich"] = math.random(35, 45),
    ["ltdonut"] = math.random(20, 35),
    ["ltcookies"] = math.random(20, 35),
    ["ltcroissant"] = math.random(20, 35),
}

ThirstFill = { -- How much they fill your thirst.
    ["teapotorange"] = math.random(25, 35),
    ["teapotcoffee"] = math.random(25, 35),
    ["teapottea"] = math.random(25, 35),
    ["smoothieor"] = math.random(25, 35),
    ["smoothiera"] = math.random(25, 35),
    ["smoothiest"] = math.random(25, 35),
    ["smoothiema"] = math.random(25, 35),
}

Config.BoxIngredients = {
    'ltmuffin',
    'ltbacon',
    'ltcheese',
    'lteggs',
    'pancakemix',
    'maplesyrup',
    'blueberries',
    'oranges',
    'coffeebeans',
    'ltbuns',
    'ltlettuce',
    'lttomato',
    'ltteabags',
    'ltraspberry',
    'ltstrawberry',
    'ltmango',
}--