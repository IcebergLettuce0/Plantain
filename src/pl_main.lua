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
  key = "pl_atlas_decks",
  path = "pl_atlas_decks.png",
  px = 71,
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

PL_UTIL.config = SMODS.current_mod.config

SMODS.current_mod.config_tab = function()
  return {
    n = G.UIT.ROOT,
    config = { align = 'cm', padding = 0.05, colour = G.C.CLEAR },
    nodes = {
      {
        n = G.UIT.R,
        config = { align = 'cm' },
        nodes = {
          {
            n = G.UIT.R,
            nodes = {
              create_toggle {
                label = "Enable decks",
                ref_table = PL_UTIL.config,
                ref_value = 'decks_enabled'
              },
              create_toggle {
                label = "Enable seals",
                ref_table = PL_UTIL.config,
                ref_value = 'seals_enabled',
              },
              create_toggle {
                label = "Enable Spectral cards",
                ref_table = PL_UTIL.config,
                ref_value = 'spectral_cards_enabled',
              },
              create_toggle {
                label = "Enable Vouchers",
                ref_table = PL_UTIL.config,
                ref_value = 'vouchers_enabled'
              },
            }
          }
        }
      }
    }
  }
end

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
          colour = G.C.CHIPS
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

if PL_UTIL.config.decks_enabled then
  SMODS.load_file('src/additions/pl_decks.lua')()
end

if PL_UTIL.config.seals_enabled then
  SMODS.load_file('src/additions/pl_seals.lua')()
end

if PL_UTIL.config.spectral_cards_enabled then
  SMODS.load_file('src/additions/pl_consumables.lua')()
end

if PL_UTIL.config.vouchers_enabled then
  SMODS.load_file('src/additions/pl_vouchers.lua')()
end
