data:extend({
	--[[{
		type = "decorative",
		name = "TeleporterEntity",
		icon = "__SimpleTeleporters__/graphics/icon.png",
		flags = {"placeable-neutral", "placeable-player", "player-creation"},
		minable = {hardness = 0.5, mining_time = 0.5, result = "Teleporter"},
		max_health = 250,
		corpse = "big-remnants",
		collision_box = {{-2,-2}, {2,2}},
		selection_box = {{-2,-2}, {2,2}},
		pictures = 
		{
			filename = "__SimpleTeleporters__/graphics/teleporter_spritesheet.png",
			priority = "high",
			width = 128,
			height = 128,
			frame_count = 16,
			line_length = 16,
			shift = {0,0}
		}
	},]]--
  {
    type = "explosion",
    name = "teleport-sound",
    animation_speed = 5,
    animations =
    {
      {
        filename = "__SimpleTeleporters__/graphics/empty.png",
        priority = "extra-high",
        width = 33,
        height = 32,
        frame_count = 1,
        line_length = 1,
        shift = {0, 0}
      }
    },
    light = {intensity = 1, size = 20, color={r=0,g=0.3,b=1} },
    smoke = "smoke",
    smoke_count = 1,
    smoke_slow_down_factor = 1,
    sound =
    {
      {
        filename = "__SimpleTeleporters__/sounds/teleport.wav",
        volume = 1.3
      }
    }
  }
})