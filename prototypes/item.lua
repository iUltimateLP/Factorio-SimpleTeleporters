data:extend({

  {
    type = "tool",
    name = "telelinker",
	subgroup = "SimpleTeleporters",
    icon = "__SimpleTeleporters__/graphics/wrench.png",
    flags = {"goes-to-quickbar"},
	order = "a[items]-z[telelinker]",
    damage = 1337,
    durability = 10000,
    speed = 5,
	place_result = "telelinker",
    stack_size = 32
  },
  {
    type = "container",
    name = "telelinker",
    icon = "__SimpleTeleporters__/graphics/empty.png",
    flags = {"placeable-neutral", "player-creation","placeable-off-grid"},
    max_health = 1337,
    inventory_size = 1,
    picture =
    {
      filename = "__SimpleTeleporters__/graphics/hitmarker.png",
      width = 32,
      height = 32,
      shift = {0, 0}
    }
  },
  {
	type = "fluid",
	name = "liquid-alien-artifacts",
	default_temperature = 50,
	heat_capacity = "1KJ",
    base_color = {r=0, g=0, b=0},
    flow_color = {r=1, g=0, b=1},
	max_temperature = 200,
	icon = "__SimpleTeleporters__/graphics/liquid-alien.png",
	pressure_to_speed_ratio = 0.4,
	flow_to_energy_ratio = 0.59,
	order = "a[fluid]-y[liquid-alien-artifacts]"
  },
  {
    type = "item",
	name = "TeleporterCore",
	subgroup = "SimpleTeleporters",
	icon = "__SimpleTeleporters__/graphics/teleporter-core.png",
	flags = { "goes-to-main-inventory" },
	order = "a[items]-c[TeleporterCore]",
	stack_size = 16
  },
  {
    type = "tool",
    name = "distance-tool",
	subgroup = "SimpleTeleporters",
    icon = "__SimpleTeleporters__/graphics/dist-tool-2.png",
    flags = {"goes-to-quickbar"},
	order = "a[items]-z[distance-tool]",
    damage = 1337,
    durability = 10000,
    speed = 5,
	place_result = "distance-tool",
    stack_size = 32
  },
  {
    type = "container",
    name = "distance-tool",
    icon = "__SimpleTeleporters__/graphics/empty.png",
    flags = {"placeable-neutral", "player-creation"},
    max_health = 1337,
    inventory_size = 1,
    picture =
    {
      filename = "__SimpleTeleporters__/graphics/hitmarker.png",
      width = 32,
      height = 32,
      shift = {0, 0}
    }
  },
  {
    type = "tool",
    name = "gui-tool",
	subgroup = "SimpleTeleporters",
    icon = "__SimpleTeleporters__/graphics/gui-tool.png",
    flags = {"goes-to-quickbar"},
	order = "a[items]-z[gui-tool]",
    damage = 1337,
    durability = 10000,
    speed = 5,
	place_result = "gui-tool",
    stack_size = 32
  },
  {
    type = "container",
    name = "gui-tool",
    icon = "__SimpleTeleporters__/graphics/empty.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    max_health = 1337,
    inventory_size = 1,
    picture =
    {
      filename = "__SimpleTeleporters__/graphics/hitmarker.png",
      width = 32,
      height = 32,
      shift = {0, 0}
    }
  },
})