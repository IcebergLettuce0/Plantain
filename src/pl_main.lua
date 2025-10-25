PL_UTIL = {}

SMODS.load_file("src/utilities/functions.lua")()
PL_UTIL.AddNametagJokerNames()

SMODS.Atlas {
  key = 'pl_atlas_w1',
  path = 'pl_atlas_w1.png',
  px = 71,
  py = 95
}

SMODS.Atlas {
  key = 'pl_atlas_w2',
  path = 'pl_atlas_w2.png',
  px = 71,
  py = 95
}

SMODS.Atlas {
  key = 'pl_atlas_w3',
  path = 'pl_atlas_w3.png',
  px = 71,
  py = 95
}
  
SMODS.Atlas{
  key = "pl_atlas_consumables",
  path = "pl_atlas_consumables.png",
  px = 65,
  py = 95
}

SMODS.Atlas{
  key = "pl_atlas_seals",
  path = "pl_atlas_seals.png",
  px = 71,
  py = 95
}

SMODS.Atlas{
  key = "pl_atlas_vouchers",
  path = "pl_atlas_vouchers.png",
  px = 71,
  py = 95
}

SMODS.Atlas{
  key = "modicon",
  path = "modicon.png",
  px = 34,
  py = 34
}

SMODS.current_mod.extra_tabs = function()
  local scale = 0.5
  return {
    label = "Credits",
    tab_definition_function = function()
    return {
      n = G.UIT.ROOT,
      config = {
      align = "cm",
      padding = 0.05,
      colour = G.C.CLEAR,
      },
      nodes = {
      {
        n = G.UIT.R,
        config = {
        padding = 0,
        align = "cm"
        },
        nodes = {
        {
          n = G.UIT.T,
          config = {
          text = "Programming: IcebergLettuce, NachitoSMO",
          shadow = false,
          scale = scale,
          colour = G.C.GREEN
          }
        }
        }
      },
      {
        n = G.UIT.R,
        config = {
        padding = 0,
        align = "cm"
        },
        nodes = {
        {
          n = G.UIT.T,
          config = {
          text = "Art: IcebergLettuce",
          shadow = false,
          scale = scale,
          colour = G.C.PURPLE
          }
        },
        }
      },
      {
        n = G.UIT.R,
        config = {
          padding = 0,
          align = "cm"
        },
        nodes = {
          {
          n = G.UIT.T,
          config = {
            text = "Idea Guys: AtomicLight, BurntFrenchToast, TomatoIcecream, SpadeALay",
            shadow = false,
            scale = scale,
            colour = G.C.MONEY
          }
          },
        }
      }
      }
    }
    end
  }
end

SMODS.load_file('src/additions/pl_jokers_w1.lua')()
SMODS.load_file('src/additions/pl_jokers_w2.lua')()
SMODS.load_file('src/additions/pl_jokers_w3.lua')()
SMODS.load_file('src/additions/pl_consumables.lua')()
SMODS.load_file('src/additions/pl_seals.lua')()
SMODS.load_file('src/additions/pl_vouchers.lua')()
