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
  local pack_watch = {}
  for k, v in pairs(G.P_CENTERS) do
    if v.set == 'Booster' then
      table.insert(pack_watch, k)
    end
  end
  local pack_chosen = pseudorandom_element(pack_watch, pseudoseed('pl_pop_up'))
  local pack = Card(
    G.shop_booster.T.x + G.shop_booster.T.w / 2,
    G.shop_booster.T.y,
    G.CARD_W * 1.27, G.CARD_H * 1.27,
    G.P_CARDS.empty,
    G.P_CENTERS[pack_chosen],
    { bypass_discovery_center = true, bypass_discovery_ui = true }
  )
  if price then
    pack.cost = price
  end
  create_shop_card_ui(pack, 'Booster', G.shop_booster)
  pack:start_materialize()
  G.shop_booster:emplace(pack)
end

function PL_UTIL.reroll_booster_pack(position)
  if not G.shop then return end
  if #G.shop_booster.cards <= 0 then return end
  
  local booster_to_replace = G.shop_booster.cards[position]

  local pack_watch = {}
  for k, v in pairs(G.P_CENTERS) do
    if v.set == 'Booster' then
      table.insert(pack_watch, k)
    end
  end

  local pack_chosen = pseudorandom_element(pack_watch, pseudoseed(('pl_booster_reroll')..G.GAME.round_resets.ante))

  local pack = Card(
    G.shop_booster.T.x + G.shop_booster.T.w / 2,
    G.shop_booster.T.y,
    G.CARD_W * 1.27, G.CARD_H * 1.27,
    G.P_CARDS.empty,
    G.P_CENTERS[pack_chosen],
    { bypass_discovery_center = true, bypass_discovery_ui = true }
  )

  if price then
    pack.cost = price
  end

  create_shop_card_ui(pack, 'Booster', G.shop_booster)
  pack:start_materialize()

  local pack_pos = 1
  for k, v in ipairs(G.shop_booster.cards) do
    if v == booster_to_replace then
      pack_pos = k
    end
  end

  table.insert(G.shop_booster.cards, pack_pos, pack)
  pack:set_card_area(G.shop_booster)
  pack:juice_up()

  local c = G.shop_booster:remove_card(booster_to_replace)
  c:remove()
  c = nil

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