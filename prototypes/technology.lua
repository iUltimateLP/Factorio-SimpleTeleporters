data:extend({
  {
      type = "technology",
      name = "Teleportation",
      icon = "__SimpleTeleporters__/graphics/technology_icon.png",
	  effects =
	  {
	    {
		  type = "unlock-recipe",
		  recipe = "Teleporter_Tier01"
		},
		{
		  type = "unlock-recipe",
		  recipe = "TeleporterCore"
		},
		{
		  type = "unlock-recipe",
		  recipe = "telelinker"
		},
		{
		  type = "unlock-recipe",
		  recipe = "liquid-alien-artifacts"
		},
		{
		  type = "unlock-recipe",
		  recipe = "gui-tool"
		}
	  },
      prerequisites = {"automation-3", "electronics", "circuit-network"},
      unit =
      {
        count = 100,
        ingredients =
        {
          {"science-pack-1", 20},
          {"science-pack-2", 10},
          {"science-pack-3", 8},
		  {"alien-science-pack", 5}
        },
        time = 20
      }
  },
  
  {
      type = "technology",
      name = "Teleportation2",
      icon = "__SimpleTeleporters__/graphics/technology_icon.png",
	  effects =
	  {
	    {
		  type = "unlock-recipe",
		  recipe = "Teleporter_Upgrade_02"
		}
	  },
      prerequisites = {"Teleportation"},
      unit =
      {
        count = 50,
        ingredients =
        {
          {"science-pack-2", 7},
          {"science-pack-3", 5},
          {"alien-science-pack", 3}
        },
        time = 12
      }
  },
  
   {
      type = "technology",
      name = "Teleportation3",
      icon = "__SimpleTeleporters__/graphics/technology_icon.png",
	  effects =
	  {
	    {
		  type = "unlock-recipe",
		  recipe = "Teleporter_Upgrade_03"
		}
	  },
      prerequisites = {"Teleportation2"},
      unit =
      {
        count = 50,
        ingredients =
        {
          {"science-pack-2", 8},
          {"science-pack-3", 6},
          {"alien-science-pack", 3}
        },
        time = 13
      }
	},	
  
	{
      type = "technology",
      name = "Teleportation4",
      icon = "__SimpleTeleporters__/graphics/technology_icon.png",
	  effects =
	  {
	    {
		  type = "unlock-recipe",
		  recipe = "Teleporter_Upgrade_04"
		}
	  },
      prerequisites = {"Teleportation3"},
      unit =
      {
        count = 50,
        ingredients =
        {
          {"science-pack-2", 8},
          {"science-pack-3", 6},
          {"alien-science-pack", 4}
        },
        time = 14
      }
	},

	{
      type = "technology",
      name = "Teleportation5",
      icon = "__SimpleTeleporters__/graphics/technology_icon.png",
	  effects =
	  {
	    {
		  type = "unlock-recipe",
		  recipe = "Teleporter_Upgrade_05"
		}
	  },
      prerequisites = {"Teleportation4"},
      unit =
      {
        count = 50,
        ingredients =
        {
          {"science-pack-2", 8},
          {"science-pack-3", 7},
          {"alien-science-pack", 4}
        },
        time = 15
      }
	},
	
	{
      type = "technology",
      name = "Teleportation6",
      icon = "__SimpleTeleporters__/graphics/technology_icon.png",
	  effects =
	  {
	    {
		  type = "unlock-recipe",
		  recipe = "Teleporter_Upgrade_06"
		}
	  },
      prerequisites = {"Teleportation5"},
      unit =
      {
        count = 50,
        ingredients =
        {
          {"science-pack-2", 9},
          {"science-pack-3", 7},
          {"alien-science-pack", 5}
        },
        time = 16
      }
	},
	
	{
      type = "technology",
      name = "Teleportation7",
      icon = "__SimpleTeleporters__/graphics/technology_icon.png",
	  effects =
	  {
	    {
		  type = "unlock-recipe",
		  recipe = "Teleporter_Upgrade_07"
		}
	  },
      prerequisites = {"Teleportation6"},
      unit =
      {
        count = 50,
        ingredients =
        {
          {"science-pack-2", 9},
          {"science-pack-3", 8},
          {"alien-science-pack", 5}
        },
        time = 17
      }
	},
	
	{
      type = "technology",
      name = "Teleportation8",
      icon = "__SimpleTeleporters__/graphics/technology_icon.png",
	  effects =
	  {
	    {
		  type = "unlock-recipe",
		  recipe = "Teleporter_Upgrade_08"
		}
	  },
      prerequisites = {"Teleportation7"},
      unit =
      {
        count = 50,
        ingredients =
        {
          {"science-pack-2", 9},
          {"science-pack-3", 9},
          {"alien-science-pack", 5}
        },
        time = 18
      }
	},
	
	{
      type = "technology",
      name = "Teleportation9",
      icon = "__SimpleTeleporters__/graphics/technology_icon.png",
	  effects =
	  {
	    {
		  type = "unlock-recipe",
		  recipe = "Teleporter_Upgrade_09"
		}
	  },
      prerequisites = {"Teleportation8"},
      unit =
      {
        count = 50,
        ingredients =
        {
          {"science-pack-2", 9},
          {"science-pack-3", 10},
          {"alien-science-pack", 5}
        },
        time = 19
      }
	},
	
	{
      type = "technology",
      name = "Teleportation10",
      icon = "__SimpleTeleporters__/graphics/technology_icon.png",
	  effects =
	  {
	    {
		  type = "unlock-recipe",
		  recipe = "Teleporter_Upgrade_10"
		}
	  },
      prerequisites = {"Teleportation9"},
      unit =
      {
        count = 50,
        ingredients =
        {
          {"science-pack-2", 9},
          {"science-pack-3", 11},
          {"alien-science-pack", 5}
        },
        time = 20
      }
	}

})