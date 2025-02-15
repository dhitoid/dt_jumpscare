fx_version 'cerulean'
game 'gta5'

author 'DT SCRIPT ID'
description 'Jumpscare player script with images BY DT SCRIPT ID'
version '1.0.0'

shared_script {
    '@ox_lib/init.lua',
    'config.lua'
}

server_scripts {
    'server.lua'
}

client_scripts {
    'client.lua'
}

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

ui_page 'html/index.html'

lua54 'yes'
