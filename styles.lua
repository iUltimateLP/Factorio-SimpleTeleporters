data.raw["gui-style"].default["teleporter-button"] = {
	type = "button_style",
	parent = "button_style",
	font = "teleporter-font",
	width = 100,
	height = 40
}

data.raw["gui-style"].default["teleporter-tier-button"] = {
	type = "button_style",
	parent = "button_style",
	font = "teleporter-font",
	width = 75,
	height = 36
}

data.raw["gui-style"].default["teleporter-button-small"] = {
	type = "button_style",
	parent = "slot_button_style",
	font = "teleporter-font-small",
	width = 60,
	height = 30,
	align = "center"
}

data.raw["gui-style"].default["teleporter-label-1"] = {
	type = "label_style",
	parent = "label_style",
	font = "default",
	width = 110
}

data.raw["gui-style"].default["teleporter-label-2"] = {
	type = "label_style",
	parent = "label_style",
	font = "default",
	width = 50
}

data.raw["gui-style"].default["teleporter-label-3"] = {
	type = "label_style",
	parent = "label_style",
	font = "default",
	width = 35
}

data.raw["gui-style"].default["teleporter-button-deactive"] = {
    type = "button_style",
    parent = "teleporter-button",

    default_font_color={r=0.5, g=0.5, b=0.5},
    hovered_font_color={r=0.5, g=0.5, b=0.5},
    hovered_graphical_set =
    {
      type = "composition",
      filename = "__core__/graphics/gui.png",
      priority = "extra-high-no-scale",
      corner_size = {3, 3},
      position = {0, 0}
    },
    clicked_font_color={r=0.5, g=0.5, b=0.5},
    clicked_graphical_set =
    {
      type = "composition",
      filename = "__core__/graphics/gui.png",
      priority = "extra-high-no-scale",
      corner_size = {3, 3},
      position = {0, 0}
	}
}

data.raw["gui-style"].default["teleporter-progress-bar"] = {
	type = "progressbar_style",
	parent = "progressbar_style",
	smooth_color = {r=1,b=1},
	top_padding = 10
}

data.raw["gui-style"].default["teleporter-dropdown"] = {
	type = "frame_style",
	parent = "frame_style",
	font = "teleporter-font",
	title_top_padding = 0,
	title_left_padding = 0,
	title_bottom_padding = 0,
	title_right_padding = 0,
	top_padding  = 0,
	right_padding = 0,
	bottom_padding = 0,
	left_padding = 0,
	flow_style=
	{
		horizontal_spacing = 0,
		vertical_spacing = 0
	}
}

data.raw["gui-style"].default["teleporter-name-textfield"] = {
	type = "textfield_style",
	parent = "textfield_style",
    minimal_width = 90,	
}

data.raw["gui-style"].default["teleporter-link-frame"] = {
	type = "frame_style",
	parent = "frame_style",
	font = "teleporter-font-small",
	title_top_padding = 0,
	title_left_padding = 0,
	title_bottom_padding = 0,
	title_right_padding = 0,
	top_padding  = 0,
	right_padding = 0,
	bottom_padding = 0,
	left_padding = 0,
	flow_style=
	{
		horizontal_spacing = 0,
		vertical_spacing = 0
	}
}

data.raw["gui-style"].default["teleporter-dropdown-selected"] = {
    type = "frame_style",
	parent = "teleporter-dropdown",
    graphical_set =
    {
      type = "composition",
      filename = "__core__/graphics/arrows/hint-orange-box.png",
      priority = "extra-high-no-scale",
      corner_size = {13, 13},
      position = {0, 0}
    },
	title_top_padding = 0,
	title_left_padding = 0,
	title_bottom_padding = 0,
	title_right_padding = 0,
	top_padding  = 0,
	right_padding = 0,
	bottom_padding = 0,
	left_padding = 0,
}

data.raw["gui-style"].default["teleporter-flow"] = {
    type = "flow_style",
    horizontal_spacing = 2,
    vertical_spacing = 2,
    max_on_row = 0,
    resize_row_to_width = false,
    resize_to_row_height = false
}

data:extend(
{
  {
    type = "font",
    name = "teleporter-font",
    from = "default-bold",
    size = 18
  },
  {
    type = "font",
    name = "teleporter-font-small",
    from = "default-bold",
    size = 16
  }
}
)