require("config")

DIVIDER = 60

data:extend({
  {
    type = "accumulator",
    name = "Teleporter_Tier01",
    icon = "__SimpleTeleporters__/graphics/icon.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "Teleporter_Tier01"},
    max_health = 150,
    corpse = "medium-remnants",
    collision_box = {{-2, -2}, {2,2}},
    collision_mask = {"water-tile", "item-layer", "object-layer"},
    selection_box = {{-2, -2}, {2, 2}},
	render_layer = decorative,
    energy_source =
    {
      type = "electric",
      buffer_capacity = TIER_01_BUFFER_CAPACITY.."MJ",
      usage_priority = "terciary",
      input_flow_limit = TIER_01_FLOW_LIMIT.."MW",
      output_flow_limit = "0W"
    },
    picture =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/orange/spritesheet.png",
      priority = "extra-high",
      width = 128,
      height = 128,
	  line_length = 16,
	  frame_count = 16,
      shift = {0, 0}
    },
    charge_animation =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/orange/spritesheet.png",
      width = 128,
      height = 128,
      line_length = 16,
      frame_count = 16,
      shift = {0, 0},
      animation_speed = 0.5
    },
    charge_cooldown = 30,
    charge_light = {intensity = 0.3, size = 7},
    discharge_animation =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/orange/spritesheet.png",
      width = 128,
      height = 128,
      line_length = 16,
      frame_count = 16,
      shift = {0, 0},
      animation_speed = 0.5
    },
    discharge_cooldown = 60,
    discharge_light = {intensity = 0.7, size = 7},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/accumulator-working.ogg",
        volume = 1
      },
      idle_sound = {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 5
    },
  },
  
  {
    type = "accumulator",
    name = "Teleporter_Tier02",
    icon = "__SimpleTeleporters__/graphics/icon.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "Teleporter_Tier02"},
    max_health = 150,
    corpse = "medium-remnants",
    collision_box = {{-2, -2}, {2,2}},
    collision_mask = {"water-tile", "item-layer", "object-layer"},
    selection_box = {{-2, -2}, {2, 2}},
	render_layer = decorative,
    energy_source =
    {
      type = "electric",
      buffer_capacity = TIER_02_BUFFER_CAPACITY.."MJ",
      usage_priority = "terciary",
      input_flow_limit = TIER_02_FLOW_LIMIT.."MW",
      output_flow_limit = "0W"
    },
    picture =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/red/spritesheet.png",
      priority = "extra-high",
      width = 128,
      height = 128,
	  line_length = 16,
	  frame_count = 16,
      shift = {0, 0}
    },
    charge_animation =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/red/spritesheet.png",
      width = 128,
      height = 128,
      line_length = 16,
      frame_count = 16,
      shift = {0, 0},
      animation_speed = 0.5
    },
    charge_cooldown = 30,
    charge_light = {intensity = 0.3, size = 7},
    discharge_animation =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/red/spritesheet.png",
      width = 128,
      height = 128,
      line_length = 16,
      frame_count = 16,
      shift = {0, 0},
      animation_speed = 0.5
    },
    discharge_cooldown = 60,
    discharge_light = {intensity = 0.7, size = 7},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/accumulator-working.ogg",
        volume = 1
      },
      idle_sound = {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 5
    },
  },
  
  {
    type = "accumulator",
    name = "Teleporter_Tier03",
    icon = "__SimpleTeleporters__/graphics/icon.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "Teleporter_Tier03"},
    max_health = 150,
    corpse = "medium-remnants",
    collision_box = {{-2, -2}, {2,2}},
    collision_mask = {"water-tile", "item-layer", "object-layer"},
    selection_box = {{-2, -2}, {2, 2}},
	render_layer = decorative,
    energy_source =
    {
      type = "electric",
      buffer_capacity = TIER_03_BUFFER_CAPACITY.."MJ",
      usage_priority = "terciary",
      input_flow_limit = TIER_03_FLOW_LIMIT.."MW",
      output_flow_limit = "0W"
    },
    picture =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/lime/spritesheet.png",
      priority = "extra-high",
      width = 128,
      height = 128,
	  line_length = 16,
	  frame_count = 16,
      shift = {0, 0}
    },
    charge_animation =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/lime/spritesheet.png",
      width = 128,
      height = 128,
      line_length = 16,
      frame_count = 16,
      shift = {0, 0},
      animation_speed = 0.5
    },
    charge_cooldown = 30,
    charge_light = {intensity = 0.3, size = 7},
    discharge_animation =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/lime/spritesheet.png",
      width = 128,
      height = 128,
      line_length = 16,
      frame_count = 16,
      shift = {0, 0},
      animation_speed = 0.5
    },
    discharge_cooldown = 60,
    discharge_light = {intensity = 0.7, size = 7},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/accumulator-working.ogg",
        volume = 1
      },
      idle_sound = {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 5
    },
  },
  
  {
    type = "accumulator",
    name = "Teleporter_Tier04",
    icon = "__SimpleTeleporters__/graphics/icon.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "Teleporter_Tier04"},
    max_health = 150,
    corpse = "medium-remnants",
    collision_box = {{-2, -2}, {2,2}},
    collision_mask = {"water-tile", "item-layer", "object-layer"},
    selection_box = {{-2, -2}, {2, 2}},
	render_layer = decorative,
    energy_source =
    {
      type = "electric",
      buffer_capacity = TIER_04_BUFFER_CAPACITY.."MJ",
      usage_priority = "terciary",
      input_flow_limit = TIER_04_FLOW_LIMIT.."MW",
      output_flow_limit = "0W"
    },
    picture =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/green/spritesheet.png",
      priority = "extra-high",
      width = 128,
      height = 128,
	  line_length = 16,
	  frame_count = 16,
      shift = {0, 0}
    },
    charge_animation =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/green/spritesheet.png",
      width = 128,
      height = 128,
      line_length = 16,
      frame_count = 16,
      shift = {0, 0},
      animation_speed = 0.5
    },
    charge_cooldown = 30,
    charge_light = {intensity = 0.3, size = 7},
    discharge_animation =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/green/spritesheet.png",
      width = 128,
      height = 128,
      line_length = 16,
      frame_count = 16,
      shift = {0, 0},
      animation_speed = 0.5
    },
    discharge_cooldown = 60,
    discharge_light = {intensity = 0.7, size = 7},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/accumulator-working.ogg",
        volume = 1
      },
      idle_sound = {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 5
    },
  },
  
  {
    type = "accumulator",
    name = "Teleporter_Tier05",
    icon = "__SimpleTeleporters__/graphics/icon.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "Teleporter_Tier05"},
    max_health = 150,
    corpse = "medium-remnants",
    collision_box = {{-2, -2}, {2,2}},
    collision_mask = {"water-tile", "item-layer", "object-layer"},
    selection_box = {{-2, -2}, {2, 2}},
	render_layer = decorative,
    energy_source =
    {
      type = "electric",
      buffer_capacity = TIER_05_BUFFER_CAPACITY.."MJ",
      usage_priority = "terciary",
      input_flow_limit = TIER_05_FLOW_LIMIT.."MW",
      output_flow_limit = "0W"
    },
    picture =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/mint/spritesheet.png",
      priority = "extra-high",
      width = 128,
      height = 128,
	  line_length = 16,
	  frame_count = 16,
      shift = {0, 0}
    },
    charge_animation =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/mint/spritesheet.png",
      width = 128,
      height = 128,
      line_length = 16,
      frame_count = 16,
      shift = {0, 0},
      animation_speed = 0.5
    },
    charge_cooldown = 30,
    charge_light = {intensity = 0.3, size = 7},
    discharge_animation =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/mint/spritesheet.png",
      width = 128,
      height = 128,
      line_length = 16,
      frame_count = 16,
      shift = {0, 0},
      animation_speed = 0.5
    },
    discharge_cooldown = 60,
    discharge_light = {intensity = 0.7, size = 7},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/accumulator-working.ogg",
        volume = 1
      },
      idle_sound = {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 5
    },
  },
  
  {
    type = "accumulator",
    name = "Teleporter_Tier06",
    icon = "__SimpleTeleporters__/graphics/icon.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "Teleporter_Tier06"},
    max_health = 150,
    corpse = "medium-remnants",
    collision_box = {{-2, -2}, {2,2}},
    collision_mask = {"water-tile", "item-layer", "object-layer"},
    selection_box = {{-2, -2}, {2, 2}},
	render_layer = decorative,
    energy_source =
    {
      type = "electric",
      buffer_capacity = TIER_06_BUFFER_CAPACITY.."MJ",
      usage_priority = "terciary",
      input_flow_limit = TIER_06_FLOW_LIMIT.."MW",
      output_flow_limit = "0W"
    },
    picture =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/pink/spritesheet.png",
      priority = "extra-high",
      width = 128,
      height = 128,
	  line_length = 16,
	  frame_count = 16,
      shift = {0, 0}
    },
    charge_animation =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/pink/spritesheet.png",
      width = 128,
      height = 128,
      line_length = 16,
      frame_count = 16,
      shift = {0, 0},
      animation_speed = 0.5
    },
    charge_cooldown = 30,
    charge_light = {intensity = 0.3, size = 7},
    discharge_animation =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/pink/spritesheet.png",
      width = 128,
      height = 128,
      line_length = 16,
      frame_count = 16,
      shift = {0, 0},
      animation_speed = 0.5
    },
    discharge_cooldown = 60,
    discharge_light = {intensity = 0.7, size = 7},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/accumulator-working.ogg",
        volume = 1
      },
      idle_sound = {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 5
    },
  },
  
  {
    type = "accumulator",
    name = "Teleporter_Tier07",
    icon = "__SimpleTeleporters__/graphics/icon.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "Teleporter_Tier07"},
    max_health = 150,
    corpse = "medium-remnants",
    collision_box = {{-2, -2}, {2,2}},
    collision_mask = {"water-tile", "item-layer", "object-layer"},
    selection_box = {{-2, -2}, {2, 2}},
	render_layer = decorative,
    energy_source =
    {
      type = "electric",
      buffer_capacity = TIER_07_BUFFER_CAPACITY.."MJ",
      usage_priority = "terciary",
      input_flow_limit = TIER_07_FLOW_LIMIT.."MW",
      output_flow_limit = "0W"
    },
    picture =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/purple/spritesheet.png",
      priority = "extra-high",
      width = 128,
      height = 128,
	  line_length = 16,
	  frame_count = 16,
      shift = {0, 0}
    },
    charge_animation =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/purple/spritesheet.png",
      width = 128,
      height = 128,
      line_length = 16,
      frame_count = 16,
      shift = {0, 0},
      animation_speed = 0.5
    },
    charge_cooldown = 30,
    charge_light = {intensity = 0.3, size = 7},
    discharge_animation =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/purple/spritesheet.png",
      width = 128,
      height = 128,
      line_length = 16,
      frame_count = 16,
      shift = {0, 0},
      animation_speed = 0.5
    },
    discharge_cooldown = 60,
    discharge_light = {intensity = 0.7, size = 7},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/accumulator-working.ogg",
        volume = 1
      },
      idle_sound = {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 5
    },
  },
  
  {
    type = "accumulator",
    name = "Teleporter_Tier08",
    icon = "__SimpleTeleporters__/graphics/icon.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "Teleporter_Tier08"},
    max_health = 150,
    corpse = "medium-remnants",
    collision_box = {{-2, -2}, {2,2}},
    collision_mask = {"water-tile", "item-layer", "object-layer"},
    selection_box = {{-2, -2}, {2, 2}},
	render_layer = decorative,
    energy_source =
    {
      type = "electric",
      buffer_capacity = TIER_08_BUFFER_CAPACITY.."MJ",
      usage_priority = "terciary",
      input_flow_limit = TIER_08_FLOW_LIMIT.."MW",
      output_flow_limit = "0W"
    },
    picture =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/cyan/spritesheet.png",
      priority = "extra-high",
      width = 128,
      height = 128,
	  line_length = 16,
	  frame_count = 16,
      shift = {0, 0}
    },
    charge_animation =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/cyan/spritesheet.png",
      width = 128,
      height = 128,
      line_length = 16,
      frame_count = 16,
      shift = {0, 0},
      animation_speed = 0.5
    },
    charge_cooldown = 30,
    charge_light = {intensity = 0.3, size = 7},
    discharge_animation =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/cyan/spritesheet.png",
      width = 128,
      height = 128,
      line_length = 16,
      frame_count = 16,
      shift = {0, 0},
      animation_speed = 0.5
    },
    discharge_cooldown = 60,
    discharge_light = {intensity = 0.7, size = 7},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/accumulator-working.ogg",
        volume = 1
      },
      idle_sound = {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 5
    },
  },
  
  {
    type = "accumulator",
    name = "Teleporter_Tier09",
    icon = "__SimpleTeleporters__/graphics/icon.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "Teleporter_Tier09"},
    max_health = 150,
    corpse = "medium-remnants",
    collision_box = {{-2, -2}, {2,2}},
    collision_mask = {"water-tile", "item-layer", "object-layer"},
    selection_box = {{-2, -2}, {2, 2}},
	render_layer = decorative,
    energy_source =
    {
      type = "electric",
      buffer_capacity = TIER_09_BUFFER_CAPACITY.."MJ",
      usage_priority = "terciary",
      input_flow_limit = TIER_09_FLOW_LIMIT.."MW",
      output_flow_limit = "0W"
    },
    picture =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/light-blue/spritesheet.png",
      priority = "extra-high",
      width = 128,
      height = 128,
	  line_length = 16,
	  frame_count = 16,
      shift = {0, 0}
    },
    charge_animation =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/light-blue/spritesheet.png",
      width = 128,
      height = 128,
      line_length = 16,
      frame_count = 16,
      shift = {0, 0},
      animation_speed = 0.5
    },
    charge_cooldown = 30,
    charge_light = {intensity = 0.3, size = 7},
    discharge_animation =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/light-blue/spritesheet.png",
      width = 128,
      height = 128,
      line_length = 16,
      frame_count = 16,
      shift = {0, 0},
      animation_speed = 0.5
    },
    discharge_cooldown = 60,
    discharge_light = {intensity = 0.7, size = 7},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/accumulator-working.ogg",
        volume = 1
      },
      idle_sound = {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 5
    },
  },
  
  {
    type = "accumulator",
    name = "Teleporter_Tier10",
    icon = "__SimpleTeleporters__/graphics/icon.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "Teleporter_Tier10"},
    max_health = 150,
    corpse = "medium-remnants",
    collision_box = {{-2, -2}, {2,2}},
    collision_mask = {"water-tile", "item-layer", "object-layer"},
    selection_box = {{-2, -2}, {2, 2}},
	render_layer = decorative,
    energy_source =
    {
      type = "electric",
      buffer_capacity = TIER_10_BUFFER_CAPACITY.."MJ",
      usage_priority = "terciary",
      input_flow_limit = TIER_10_FLOW_LIMIT.."MW",
      output_flow_limit = "0W"
    },
    picture =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/dark-blue/spritesheet.png",
      priority = "extra-high",
      width = 128,
      height = 128,
	  line_length = 16,
	  frame_count = 16,
      shift = {0, 0}
    },
    charge_animation =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/dark-blue/spritesheet.png",
      width = 128,
      height = 128,
      line_length = 16,
      frame_count = 16,
      shift = {0, 0},
      animation_speed = 0.5
    },
    charge_cooldown = 30,
    charge_light = {intensity = 0.3, size = 7},
    discharge_animation =
    {
      filename = "__SimpleTeleporters__/graphics/tiers/dark-blue/spritesheet.png",
      width = 128,
      height = 128,
      line_length = 16,
      frame_count = 16,
      shift = {0, 0},
      animation_speed = 0.5
    },
    discharge_cooldown = 60,
    discharge_light = {intensity = 0.7, size = 7},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/accumulator-working.ogg",
        volume = 1
      },
      idle_sound = {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 5
    },
  },
})