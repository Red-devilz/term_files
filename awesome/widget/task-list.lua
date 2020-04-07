local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local dpi = require('beautiful').xresources.apply_dpi
local capi = {button = _G.button}
local gears = require('gears')
local clickable_container = require('widget.material.clickable-container')
--- Common method to create buttons.
-- @tab buttons
-- @param object
-- @treturn table
local function create_buttons(buttons, object)
  if buttons then
    local btns = {}
    for _, b in ipairs(buttons) do
      -- Create a proxy button object: it will receive the real
      -- press and release events, and will propagate them to the
      -- button object the user provided, but with the object as
      -- argument.
      local btn = capi.button {modifiers = b.modifiers, button = b.button}
      btn:connect_signal(
        'press',
        function()
          b:emit_signal('press', object)
        end
      )
      btn:connect_signal(
        'release',
        function()
          b:emit_signal('release', object)
        end
      )
      btns[#btns + 1] = btn
    end

    return btns
  end
end

local function list_update(w, buttons, label, data, objects)
  -- update the widgets, creating them if needed
  w:reset()
  for i, o in ipairs(objects) do
    local cache = data[o]
    local ib, cb, tb, cbm, bgb, tbm, ibm, tt, l, ll, bg_clickable


    if cache then
      ib = cache.ib
      tb = cache.tb
      bgb = cache.bgb
      tbm = cache.tbm
      ibm = cache.ibm

    else
	  ib = wibox.widget.imagebox()
	  tb = wibox.widget.textbox()

      bg_clickable = clickable_container()
	  bgb = wibox.container.background()
      tbm = wibox.container.margin(tb, dpi(4), dpi(4))
      ibm = wibox.container.margin(ib, dpi(9), dpi(9), dpi(9), dpi(9))
      l = wibox.layout.fixed.horizontal()

      -- All of this is added in a fixed widget
      l:fill_space(true)
      l:add(ibm)
      l:add(tbm)

      bg_clickable:set_widget(l)
      -- And all of this gets a background
	  bgb:set_widget(bg_clickable)
	  l:buttons(create_buttons(buttons, o))

      -- Tooltip to display whole title, if it was truncated
      tt = awful.tooltip({
        objects = {tb},
        mode = 'outside',
        align = 'bottom',
        delay_show = 1,
      })

      data[o] = {
        ib = ib,
        tb = tb,
        bgb = bgb,
        tbm = tbm,
        ibm = ibm,
      }
    end

    local text, bg, bg_image, icon, args = label(o, tb)
    args = args or {}

    -- The text might be invalid, so use pcall.
    if text == nil or text == '' then
      tbm:set_margins(0)
    else
      -- truncate when title is too long
      local textOnly = text:match('>(.-)<')
      if (textOnly:len() > 8) then
        text = text:gsub('>(.-)<', '>' .. textOnly:sub(1, 8) .. '...<')
      end
      if not tb:set_markup_silently(text) then
        tb:set_markup('<i>&lt;Invalid text&gt;</i>')
      end
    end
	bgb:set_bg(bg)

	if o.class == "st-256color" then
		icon = gears.surface("/usr/share/icons/Paper/24x24/apps/terminal.png")
	end
	if o.class == "Slack" then
		icon = gears.surface("/usr/share/icons/Papirus/24x24/apps/slack.svg")
	end
	if o.class == "Spotify" then
		icon = gears.surface("/usr/share/icons/Paper/24x24/apps/spotify.png")
	end
	if o.class == "feh" then
		icon = gears.surface("/usr/share/feh/images/feh.png")
	end
	if o.class == "Surf" then
		icon = gears.surface("/usr/share/icons/la-capitaine/apps/scalable/browser.svg")
	end
	if o.instance == "tabbed-surf" then
		icon = gears.surface("/usr/share/icons/la-capitaine/apps/scalable/browser.svg")
	end
	if o.class == "deadcells" then
		icon = gears.surface("/usr/share/icons/la-capitaine/apps/scalable/steam.svg")
	end

    if icon then
	  ib.image = icon
    else
	  -- icon = capi3.image("/home/rahul/.local/share/icons/extra/slack.png")
	  -- ib.image = icon
	  ibm:set_margins(0)
    end

    bgb.shape = args.shape
    bgb.shape_border_width = args.shape_border_width
    bgb.shape_border_color = args.shape_border_color
    w:add(bgb)
  end
end
local tasklist_buttons =
  awful.util.table.join(
  awful.button(
    {},
    1,
    function(c)
      if c == _G.client.focus then
        c.minimized = true
      else
        -- Without this, the following
        -- :isvisible() makes no sense
        c.minimized = false
        if not c:isvisible() and c.first_tag then
          c.first_tag:view_only()
        end
        -- This will also un-minimize
        -- the client, if needed
        _G.client.focus = c
        c:raise()
      end
    end
  ),
  awful.button(
    {},
    2,
    function(c)
      c.kill(c)
    end
  ),
  awful.button(
    {},
    4,
    function()
      awful.client.focus.byidx(1)
    end
  ),
  awful.button(
    {},
    5,
    function()
      awful.client.focus.byidx(-1)
    end
  )
)

local TaskList = function(s)
  return awful.widget.tasklist(
    s,
    awful.widget.tasklist.filter.currenttags,
    tasklist_buttons,
    -- {},
	{ shape = gears.shape.rounded_rect,
	},
	list_update,
	wibox.layout.fixed.vertical()
	-- layout   = {
		-- spacing = 1,
		-- layout = wibox.layout.grid.vertical
	-- },
	-- placement = awful.placement.centered
  )
end

return TaskList
