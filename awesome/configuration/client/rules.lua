local awful = require('awful')
local gears = require('gears')
local client_keys = require('configuration.client.keys')
local client_buttons = require('configuration.client.buttons')


-- Rules
awful.rules.rules = {
  -- All clients will match this rule.
  {
    rule = {},
    properties = {
      focus = awful.client.focus.filter,
      raise = true,
      keys = client_keys,
      buttons = client_buttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_offscreen,
      floating = false,
      maximized = false,
      above = false,
      below = false,
      ontop = false,
      sticky = false,
      maximized_horizontal = false,
      maximized_vertical = true,
	  size_hints_honor = false
    }
  },
  { rule = { class = "firefox" },
	  except = { instance = "Navigator" },
	  properties = {floating = true},
  },
  { rule = { instance = "deadcells" },
	  properties = {floating = true},
  },
  { 
	rule = { instance = "slack" },
    properties = { tag = "4" } 
  },
  { 
	rule = { instance = "mailspring" },
    properties = { tag = "4" } 
  },
  { 
	rule = { instance = "firefox" },
    properties = { tag = "2" } 
  },
  { 
	rule = { instance = "spotify" },
    properties = { tag = "2" } 
  }
}
