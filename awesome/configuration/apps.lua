local filesystem = require('gears.filesystem')
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'st',
    firefox = 'firefox',
    editor = 'nvim',
    rofi = 'rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi',
    lock = 'betterlockscreen --lock blur'
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'compton --config ' .. filesystem.get_configuration_dir() .. 'configuration/compton.conf',
    'xfce4-power-manager', -- Power manager
	'xss-lock -q -- betterlockscreen --lock blur',
	'mailspring',
    'rescuetime',
    'google-calendar',
    '~/.dropbox-dist/dropboxd'
  }
}
