data:extend({
	{
		type = "recipe",
		name = "Teleporter_Tier01",
		ingredients =
		{
			{"steel-plate", 100},
			{"copper-plate", 100},
			{"advanced-circuit", 100},
			{"TeleporterCore",1}
		},
		result = "Teleporter_Tier01",
		enabled = "false"	
	},
	
	{
		type = "recipe",
		name = "Teleporter_Upgrade_02",
		category = "crafting-with-fluid",
		ingredients =
		{			
			--{type="item", name="Teleporter", amount = 1},
			{type="item", name="steel-plate", amount = 25},
			{type="item", name="copper-plate", amount = 25},
			{type="item", name="processing-unit", amount = 10},
			{type="fluid", name="liquid-alien-artifacts", amount = 2}
		},
		result = "Teleporter_Upgrade_02",
		enabled = "false"	
	},
	
	{
		type = "recipe",
		name = "Teleporter_Upgrade_03",
		category = "crafting-with-fluid",
		ingredients =
		{
			{type="item", name="Teleporter_Upgrade_02", amount = 1},
			{type="item", name="steel-plate", amount = 25},
			{type="item", name="copper-plate", amount = 25},
			{type="item", name="processing-unit", amount = 10},
			{type="fluid", name="liquid-alien-artifacts", amount = 2}
		},
		result = "Teleporter_Upgrade_03",
		enabled = "false"	
	},
		
	{
		type = "recipe",
		name = "Teleporter_Upgrade_04",
		category = "crafting-with-fluid",
		ingredients =
		{	
			{type="item", name="Teleporter_Upgrade_03", amount = 1},
			{type="item", name="steel-plate", amount = 25},
			{type="item", name="copper-plate", amount = 25},
			{type="item", name="processing-unit", amount = 10},
			{type="fluid", name="liquid-alien-artifacts", amount = 2}
		},
		result = "Teleporter_Upgrade_04",
		enabled = "false"	
	},
	
		
	{
		type = "recipe",
		name = "Teleporter_Upgrade_05",
		category = "crafting-with-fluid",
		ingredients =
		{
			{type="item", name="Teleporter_Upgrade_04", amount = 1},
			{type="item", name="steel-plate", amount = 25},
			{type="item", name="copper-plate", amount = 25},
			{type="item", name="processing-unit", amount = 10},
			{type="fluid", name="liquid-alien-artifacts", amount = 2}
		},
		result = "Teleporter_Upgrade_05",
		enabled = "false"	
	},
	
		
	{
		type = "recipe",
		name = "Teleporter_Upgrade_06",
		category = "crafting-with-fluid",
		ingredients =
		{
			{type="item", name="Teleporter_Upgrade_05", amount = 1},
			{type="item", name="steel-plate", amount = 25},
			{type="item", name="copper-plate", amount = 25},
			{type="item", name="processing-unit", amount = 10},
			{type="fluid", name="liquid-alien-artifacts", amount = 2}
		},
		result = "Teleporter_Upgrade_06",
		enabled = "false"	
	},
		
	{
		type = "recipe",
		name = "Teleporter_Upgrade_07",
		category = "crafting-with-fluid",
		ingredients =
		{
			{type="item", name="Teleporter_Upgrade_06", amount = 1},
			{type="item", name="steel-plate", amount = 25},
			{type="item", name="copper-plate", amount = 25},
			{type="item", name="processing-unit", amount = 10},
			{type="fluid", name="liquid-alien-artifacts", amount = 2}
		},
		result = "Teleporter_Upgrade_07",
		enabled = "false"	
	},
			
	{
		type = "recipe",
		name = "Teleporter_Upgrade_08",
		category = "crafting-with-fluid",
		ingredients =
		{
			{type="item", name="Teleporter_Upgrade_07", amount = 1},
			{type="item", name="steel-plate", amount = 25},
			{type="item", name="copper-plate", amount = 25},
			{type="item", name="processing-unit", amount = 10},
			{type="fluid", name="liquid-alien-artifacts", amount = 2}
		},
		result = "Teleporter_Upgrade_08",
		enabled = "false"	
	},
			
	{
		type = "recipe",
		name = "Teleporter_Upgrade_09",
		category = "crafting-with-fluid",
		ingredients =
		{
			{type="item", name="Teleporter_Upgrade_08", amount = 1},
			{type="item", name="steel-plate", amount = 25},
			{type="item", name="copper-plate", amount = 25},
			{type="item", name="processing-unit", amount = 10},
			{type="fluid", name="liquid-alien-artifacts", amount = 2}
		},
		result = "Teleporter_Upgrade_09",
		enabled = "false"	
	},
			
	{
		type = "recipe",
		name = "Teleporter_Upgrade_10",
		category = "crafting-with-fluid",
		ingredients =
		{
			{type="item", name="Teleporter_Upgrade_09", amount = 1},
			{type="item", name="steel-plate", amount = 25},
			{type="item", name="copper-plate", amount = 25},
			{type="item", name="processing-unit", amount = 10},
			{type="fluid", name="liquid-alien-artifacts", amount = 2}
		},
		result = "Teleporter_Upgrade_10",
		enabled = "false"	
	},
	
    {
		type = "recipe",
		name = "liquid-alien-artifacts",
		category = "chemistry",
		energy_required = 1,
		ingredients =
		{
			{type="item", name="alien-artifact", amount=25},
			{type="fluid", name="light-oil", amount=10}
		},
		results=
		{
			{type="fluid", name="liquid-alien-artifacts", amount=1}
		},
		subgroup = "fluid-recipes",
		enabled = "false"
    },
	{
		type = "recipe",
		name = "TeleporterCore",
		category = "crafting-with-fluid",
		ingredients =
		{	
			{type="fluid", name = "liquid-alien-artifacts", amount = 10}
		},
		result = "TeleporterCore",
		enabled = "false"
	},
	{
		type = "recipe",
		name = "telelinker",
		ingredients =
		{
			{"plastic-bar", 10},
			{"electronic-circuit", 1},
			{"copper-cable", 10}
		},
		result = "telelinker",
		enabled = "false"	
	},
	{
		type = "recipe",
		name = "distance-tool",
		ingredients =
		{
			{"iron-plate", 8},
			{"iron-gear-wheel", 1}	
		},
		result = "distance-tool",
		enabled = "true"	
	},
	{
		type = "recipe",
		name = "gui-tool",
		ingredients = 
		{
			{"plastic-bar", 6},
			{"electronic-circuit", 2},
			{"copper-cable", 5},
			{"steel-plate", 2}
		},
		result = "gui-tool",
		enabled = "false"
	}
})