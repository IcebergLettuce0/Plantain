-- COMMONS

SMODS.Joker {
  key = 'early_man',
  atlas = 'pl_atlas_w3',
  pos = { x = 0, y = 0 },

  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  discovered = true,

  rarity = 1,
  cost = 3,

  calculate = function (self, card, context)
    if context.setting_blind and not (context.blueprint_card or self).getting_sliced and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
      G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        G.E_MANAGER:add_event(Event({
          trigger = 'before',
          delay = 0.0,
          func = (function()
                  local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, 'c_wheel_of_fortune')
                  card:add_to_deck()
                  G.consumeables:emplace(card)
                  G.GAME.consumeable_buffer = 0
              return true
          end)}))
      return {
          message = localize('k_plus_tarot'),
          colour = G.C.SECONDARY_SET.Tarot,
          card = card
      }
    end
  end
}

SMODS.Joker {
  key = 'time_traveller',
  atlas = 'pl_atlas_w3',
  pos = { x = 1, y = 0 },

  config = { extra = { chips = 30 } },
  loc_vars = function(self, info_queue, card)
    return {vars = { localize(card.ability.extra.suit, 'suits_singular') , card.ability.extra.chips, colours = {G.C.SUITS[card.ability.extra.suit]}}}
  end,

  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  discovered = true,

  rarity = 1,
  cost = 5,

  set_ability = function(self, card, initial, delay_sprites)
    local suits = {'Diamonds', 'Clubs', 'Hearts', 'Spades'}
    local new_suit = pseudorandom_element(suits, pseudoseed('mandjtv'..G.GAME.round_resets.ante))
    card.ability.extra.suit = new_suit
	end,

  calculate = function (self, card, context)
    if context.cardarea == G.hand and not context.end_of_round and context.individual and not context.repetition and context.other_card:is_suit(card.ability.extra.suit) then
      return {
        chip_mod = card.ability.extra.chips,
        card = context.other_card,
        message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
      }
    end
    if context.end_of_round and not context.repetition and not context.individual then
      local suits = {'Diamonds', 'Clubs', 'Hearts', 'Spades'}
      for k, v in ipairs(suits) do
        if v == card.ability.extra.suit then
          suits[k] = nil
        end
      end
      local new_suit = pseudorandom_element(suits, pseudoseed('mandjtv'..G.GAME.round_resets.ante))
      card.ability.extra.suit = new_suit
    end
  end
}

--UNCOMMONS

SMODS.Joker {
  key = 'game_cartridge',
  atlas = 'pl_atlas_w3',
  pos = { x = 2, y = 0 },

  config = { extra = { xmult = 2 } },
  loc_vars = function(self, info_queue, card)
    return {vars = { card.ability.extra.xmult }}
  end,

  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  discovered = true,

  rarity = 2,
  cost = 5,

  calculate = function (self, card, context)
    if context.individual and context.cardarea == G.play then
      local first_2 = nil
      for i = 1, #context.scoring_hand do
        if context.scoring_hand[i]:get_id() == 2 then first_2 = context.scoring_hand[i]; break end
      end
      if context.other_card == first_2 then
        return { x_mult = 2, card = card }
      end

      local first_4 = nil
      for i = 1, #context.scoring_hand do
        if context.scoring_hand[i]:get_id() == 4 then first_4 = context.scoring_hand[i]; break end
      end
      if context.other_card == first_4 then
        return { x_mult = 2, card = card }
      end

      local first_8 = nil
      for i = 1, #context.scoring_hand do
        if context.scoring_hand[i]:get_id() == 8 then first_8 = context.scoring_hand[i]; break end
      end
      if context.other_card == first_8 then
        return { x_mult = 2, card = card }
      end
    end
  end
}
