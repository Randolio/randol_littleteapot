fx_version 'cerulean'
game 'gta5'

description 'Little Teapot Job'
author 'Randolio'

shared_scripts {
    'config.lua'
}

client_scripts {
    '@PolyZone/client.lua', -- Added Polyzone files here incase I decided to used them.
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
	'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

lua54 'yes'
