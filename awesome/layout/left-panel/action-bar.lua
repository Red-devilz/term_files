local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')
local mat_icon = require('widget.material.icon')
local dpi = require('beautiful').xresources.apply_dpi
local icons = require('theme.icons')
local TagList = require('widget.tag-list')
local TaskList = require('widget.task-list')
local clickable_container = require('widget.material.clickable-container') 
local spotify_widget = require("widget.spotify")


local LayoutBox = function(s)
  local layoutBox = clickable_container(awful.widget.layoutbox(s))
  layoutBox:buttons(
    awful.util.table.join(
      awful.button(
        {},
        1,
        function()
          awful.layout.inc(1)
        end
      ),
      awful.button(
        {},
        3,
        function()
          awful.layout.inc(-1)
        end
      ),
      awful.button(
        {},
        4,
        function()
          awful.layout.inc(1)
        end
      ),
      awful.button(
        {},
        5,
        function()
          awful.layout.inc(-1)
        end
      )
    )
  )
  return layoutBox
end

return function(screen, panel, action_bar_width)

  -- mytextclock = awful.widget.textclock("%d %b\n%H:%M ", 60)
  mytextclock = wibox.widget.textclock("%H:%M ", 60)
  mytextclock.font = 'Roboto 10'


  cal_t = awful.tooltip { 
    objects        = { mytextclock }
  }
  mytextclock:connect_signal('mouse::enter', function()
		awful.spawn.easy_async_with_shell(command, function()
			awful.spawn.easy_async_with_shell("calcurse --next", function(out)
				cal_t.text = out
			end)
		end)
  end)

  local systray = wibox.widget.systray()
  systray:set_horizontal(false)
  systray:set_base_size(22)
  systray:set_forced_width(100)
  -- systray:set_forced_height(110)

  local menu_icon =
    wibox.widget {
    icon = icons.menu,
    size = dpi(20),
    widget = mat_icon
  }

  local home_button =
    wibox.widget {
    wibox.widget {
      menu_icon,
      widget = clickable_container
    },
    bg = beautiful.primary.hue_500,
    widget = wibox.container.background
  }

  spt_widget = spotify_widget()
  myclock_t = awful.tooltip { }
  myclock_t:add_to_object(spt_widget)
  spt_widget:connect_signal('mouse::enter', function()
	  myclock_t.text = spt_widget.current_song.markup
  end)

  home_button:buttons(
    gears.table.join(
      awful.button(
        {},
        1,
        nil,
        function()
          panel:toggle()
        end
      )
    )
  )

  panel:connect_signal(
    'opened',
    function()
      menu_icon.icon = icons.close
    end
  )

  panel:connect_signal(
    'closed',
    function()
      menu_icon.icon = icons.menu
    end
  )

  return wibox.widget {
    id = 'action_bar',
    layout = wibox.layout.align.vertical,
    forced_width = action_bar_width,
    {
      -- Left widgets
      layout = wibox.layout.fixed.vertical,
      home_button,
      -- Create a taglist widget
      TagList(screen)
    },
	{
	  layout = wibox.layout.fixed.vertical,
	  wibox.container.margin(TaskList(screen), dpi(6), dpi(6), dpi(100), dpi(20))
	},
	-- nil,
    {
      -- Right widgets
      layout = wibox.layout.fixed.vertical,
	  wibox.container.margin(spt_widget, dpi(15), dpi(15), dpi(10), dpi(10)),
	  wibox.container.margin(systray, dpi(14), dpi(14), dpi(0), dpi(5)),
	  -- clock_widget
	  -- LayoutBox(),
	  wibox.container.margin(mytextclock, 1, 1, 0, 8)
    }
  }
end
