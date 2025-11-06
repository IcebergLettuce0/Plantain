function PL_UTIL.wild_card_count()
  local count = 0
  if G.playing_cards then
    for k, v in pairs(G.playing_cards) do
      if v.config.center == G.P_CENTERS.m_wild then count = count + 1 end
    end
  end
  return count
end

function PL_UTIL.add_booster_pack()
  if not G.shop then return end
  local pack = SMODS.create_card({ set = 'Booster', key_append = 'pl_popup'..G.GAME.round_resets.ante })
  pack.T.w = G.CARD_W * 1.27
  pack.T.h = G.CARD_H * 1.27
  
  G.shop_booster:emplace(pack)

  create_shop_card_ui(pack, 'Booster', G.shop_booster)
  pack:start_materialize()
  pack:set_card_area(G.shop_booster)
  pack:juice_up()
end

function PL_UTIL.reroll_booster_packs()
  if not G.shop then return end

  local pack_count = #G.shop_booster.cards

  if pack_count <= 0 then return end

  for i=1, pack_count do
  
    local booster_to_replace = G.shop_booster.cards[i]

    local pack = SMODS.create_card({ set = 'Booster', key_append = 'pl_booster_reroll'..G.GAME.round_resets.ante })
    pack.T.w = G.CARD_W * 1.27
    pack.T.h = G.CARD_H * 1.27

    table.insert(G.shop_booster.cards, i, pack)

    create_shop_card_ui(pack, 'Booster', G.shop_booster)
    pack:start_materialize()
    pack:set_card_area(G.shop_booster)
    pack:juice_up()

    local c = G.shop_booster:remove_card(booster_to_replace)
    c:remove()
    c = nil

  end

end

NametagCompatible = {}

function PL_UTIL.AddNametagJokerNames()
  NametagCompatible = {}

  for _, mod in ipairs(SMODS.mod_list) do
    if mod.can_load and NFS.getInfo(mod.path .. 'localization/en-us.lua') then
      local loc_file = assert(loadstring(NFS.read(mod.path .. 'localization/en-us.lua'))())
      if loc_file and loc_file.descriptions and loc_file.descriptions.Joker then
        for k, v in pairs(loc_file.descriptions.Joker) do
          if v.name then
            if string.find(v.name, "Joker") or string.find(v.name, "joker") then
              NametagCompatible[k] = k
            end
          end
        end
      end
    end
  end

  local vanilla_loc_file = assert(loadstring(love.filesystem.read('localization/en-us.lua'))())
  if vanilla_loc_file and vanilla_loc_file.descriptions and vanilla_loc_file.descriptions.Joker then
    for k, v in pairs(vanilla_loc_file.descriptions.Joker) do
      if v.name then
        if string.find(v.name, "Joker") or string.find(v.name, "joker") then
          NametagCompatible[k] = k
        end
      end
    end
  end
end