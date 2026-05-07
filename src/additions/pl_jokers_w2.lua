-- COMMONS

SMODS.Joker {
  key = 'croissant',
  atlas = 'pl_atlas_w2',
  pos = { x = 0, y = 0 },
  
  config = { extra = { upgrades_left = 4 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.upgrades_left } }
  end,
  attributes = {'retrigger', 'planet', 'food'},

  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = true,
  discovered = true,

  rarity = 1,
  cost = 4,

  pools = {
    Food = true
  },

  calculate = function(self, card, context)
    if context.using_consumeable and (context.consumeable.ability.set == "Planet") then
      card_eval_status_text(context.blueprint_card or card, 'jokers', nil, nil, nil, {message = localize('k_again_ex'), colour = G.C.PLANET})
      context.consumeable:use_consumeable(context.consumeable.area)
      if not context.blueprint then
        card.ability.extra.upgrades_left = card.ability.extra.upgrades_left - 1
        if card.ability.extra.upgrades_left <= 0 then
          SMODS.destroy_cards(card, nil, nil, true)
          return {
              message = localize('k_eaten_ex')
          }
        end
      end
    end
  end
}

SMODS.Attribute {key = 'booster'}
SMODS.Joker {
  key = 'pop_up_joker',
  atlas = 'pl_atlas_w2',
  pos = { x = 1, y = 0 },
  soul_pos = { x = 0, y = 2},
  
  config = { extra = { chance = 2 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { SMODS.get_probability_vars(card, 1, card.ability.extra.chance, 'popup') } }
  end,
  attributes = {'chance', 'reroll', 'generation', 'booster', 'shop'},

  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  discovered = true,

  rarity = 1,
  cost = 4,

  calculate = function(self, card, context)
    if context.reroll_shop then
      if #G.shop_booster.cards < G.GAME.starting_params.boosters_in_shop + (G.GAME.modifiers.extra_boosters or 0) then
        if SMODS.pseudorandom_probability(card, 'popup', 1, card.ability.extra.chance) then
          G.E_MANAGER:add_event(Event {
            func = function()
              PL_UTIL.add_booster_pack()
              return true
            end
          })

          local pop_up_options = {
            'pl_pop_up_joker_winner_1',
            'pl_pop_up_joker_winner_2',
            'pl_pop_up_joker_winner_3',
            'pl_pop_up_joker_winner_4',
          }

          local pop_up_message = pop_up_options[ math.random( #pop_up_options ) ]
    
          return {
            message = localize(pop_up_message),
          }
        end
      end
    end
  end
}

SMODS.Joker {
  key = 'lamp',
  atlas = 'pl_atlas_w2',
  pos = { x = 2, y = 0 },
  
  config = { extra = { mult = 3, mult_gain = 3, mult_loss = 1 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain, card.ability.extra.mult_loss } }
  end,
  attributes = {'mult', 'scaling', 'on_sell'},

  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  discovered = true,

  rarity = 1,
  cost = 5,

  calculate = function (self, card, context)
    if context.selling_card and context.card.ability.set == 'Joker' and not context.blueprint then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'mult',
        scalar_value = 'mult_gain',
        message_key = 'a_mult'
      })
      return nil, true
    end
    
    if context.end_of_round and not context.blueprint and not context.repetition and not context.individual and card.ability.extra.mult > 0 then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'mult',
        scalar_value = 'mult_loss',
        operation = '-',
        message_key = 'a_mult_minus'
      })
      return nil, true
    end

    if context.joker_main and context.cardarea == G.jokers then
      if card.ability.extra.mult > 0 then
        return {
          mult_mod = card.ability.extra.mult,
          message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
        }
      end
    end
  end
}

--UNCOMMONS

SMODS.Joker {
  key = 'odd_sock',
  atlas = 'pl_atlas_w2',
  pos = { x = 3, y = 0 },
  
  config = { extra = { chips_mod = 5, chips = 0 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips_mod, card.ability.extra.chips } }
  end,
  attributes = {'chips', 'scaling', 'discard', 'hand_type'},

  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  discovered = true,

  rarity = 2,
  cost = 5,

  calculate = function(self, card, context)
    if context.pre_discard and not context.blueprint then
      local pair = false
      for k, v in ipairs(context.full_hand) do
        local first_card = v:get_id()
        local matches = 0
        for l, w in ipairs(context.full_hand) do
          if w:get_id() == first_card then matches = matches + 1 end
        end
        if matches > 1 then pair = true end
      end
      if not pair then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'chips',
          scalar_value = 'chips_mod',
          message_colour = G.C.CHIPS
        })
        return nil, true
      end
    end

    if context.joker_main and context.cardarea == G.jokers then
      if card.ability.extra.chips > 0 then
        return {
          chip_mod = card.ability.extra.chips,
          message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
        }
      end
    end
  end
}

SMODS.Joker {
  key = 'hot_air_balloon',
  atlas = 'pl_atlas_w2',
  pos = { x = 4, y = 0 },
  
  config = { extra = { money = 1, money_mod = 1, chance = 15 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.money, card.ability.extra.money_mod, SMODS.get_probability_vars(card, 1, card.ability.extra.chance, 'balloon') } }
  end,
  attributes = {'economy', 'tarot', 'chance'},

  blueprint_compat = false,
  eternal_compat = false,
  perishable_compat = false,
  discovered = true,

  rarity = 2,
  cost = 6,

  calc_dollar_bonus = function(self, card)
    local bonus = card.ability.extra.money
    if bonus > 0 then return bonus end
  end,

  calculate = function(self, card, context)
    if context.using_consumeable and not context.blueprint and not context.repetition and not context.individual and (context.consumeable.ability.set == "Tarot") then
      if SMODS.pseudorandom_probability(card, 'balloon', 1, card.ability.extra.chance) then
        SMODS.destroy_cards(card, nil, nil, true)
        return {
            message = localize('pl_hot_air_balloon_pop')
        }
      else
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'money',
          scalar_value = 'money_mod'
        })
        return nil, true
      end
    end
  end
}

SMODS.Joker {
  key = 'three_body_problem',
  atlas = 'pl_atlas_w2',
  pos = { x = 0, y = 1 },
  
  config = { extra = { last_hand = 'none' } },
  loc_vars = function(self, info_queue, card)
    if G.GAME.last_hand_played then
      return { vars = { localize(G.GAME.last_hand_played, 'poker_hands') } }
    else
      return { vars = { localize('k_none') } }
    end
  end,
  attributes = {'hand_type', 'hand_level'},

  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  discovered = true,

  rarity = 2,
  cost = 6,

  add_to_deck = function(self,card,context)
    if not (G.GAME.last_hand_played == nil) then
      card.ability.extra.last_hand = G.GAME.last_hand_played
    end
  end,

  calculate = function(self, card, context)
    if context.before and context.cardarea == G.jokers then
      if (context.scoring_name == 'Three of a Kind') and not (card.ability.extra.last_hand == 'none') then
        return {
          message = localize('k_level_up_ex'),
          level_up = 1,
          level_up_hand = card.ability.extra.last_hand
        }
      end
    end
    if context.cardarea == G.jokers and context.joker_main then
      card.ability.extra.last_hand = context.scoring_name
    end
  end
}

SMODS.Joker {
  key = 'loose_batteries',
  atlas = 'pl_atlas_w2',
  pos = { x = 1, y = 1 },
  
  config = { extra = { chance = 2 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { SMODS.get_probability_vars(card, 1, card.ability.extra.chance, 'batteries') } }
  end,
  attributes = {'retrigger', 'chance', 'rank', 'ace'},

  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  discovered = true,

  rarity = 2,
  cost = 6,

  calculate = function(self, card, context)
    if context.cardarea == G.play and context.repetition then
      if context.other_card:get_id() == 14 then
        local retriggers = 1
        if SMODS.pseudorandom_probability(card, 'batteries', 1, card.ability.extra.chance) then 
          retriggers = 2
        end
        return 
        {
          message = localize("k_again_ex"),
          repetitions = retriggers,
          card = card, 
        }
      end
    end
  end
}

SMODS.Joker {
  key = 'painterly_joker',
  atlas = 'pl_atlas_w2',
  pos = { x = 2, y = 1 },
  
  config = { extra = { xmult_mod = 0.1, xmult = 1 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult_mod, card.ability.extra.xmult } }
  end,
  attributes = {'xmult', 'scaling', 'suit'},

  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  discovered = true,

  rarity = 2,
  cost = 5,

  calculate = function(self, card, context)
    if context.joker_main and context.cardarea == G.jokers then
      if card.ability.extra.xmult > 1 then
        return 
          {
            Xmult_mod = card.ability.extra.xmult,
            message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } }
          }
      end
    end
    if context.change_suit and not context.blueprint then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'xmult',
        scalar_value = 'xmult_mod',
        message_colour = G.C.MULT
      })
      return nil, true
    end
  end
}

--RARES

SMODS.Joker {
  key = 'quarry',
  atlas = 'pl_atlas_w2',
  pos = { x = 3, y = 1 },
  
  config = { extra = { xmult_mod = 0.5, xmult = 1 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
    return { vars = { card.ability.extra.xmult_mod, card.ability.extra.xmult } }
  end,
  attributes = {'xmult', 'scaling', 'enhancements', 'destroy_card'},

  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  discovered = true,

  rarity = 3,
  cost = 6,

  calculate = function(self, card, context)
    if context.cardarea == G.play and context.other_card and SMODS.has_enhancement(context.other_card, 'm_stone') and context.individual and not context.blueprint then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'xmult',
        scalar_value = 'xmult_mod',
        no_message = true
      })
      return { message = localize('k_upgrade_ex'), focus = card, colour = G.C.MULT }
    end
    if context.destroying_card and SMODS.has_enhancement(context.destroying_card, 'm_stone') and not context.blueprint then
      return true
    end
    if context.joker_main and context.cardarea == G.jokers and card.ability.extra.xmult > 1 then
      return {
        Xmult_mod = card.ability.extra.xmult,
        message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } }
      }
    end
  end
}

SMODS.Joker {
  key = 'lasagna',
  atlas = 'pl_atlas_w2',
  pos = { x = 4, y = 1 },
  
  config = { extra = { Xmult = 3, Xmult_loss = 0.5 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xmult, card.ability.extra.Xmult_loss } }
  end,
  attributes = {'xmult', 'scaling', 'food'},

  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = true,
  discovered = true,

  rarity = 3,
  cost = 8,

  pools = {
    Food = true
  },

  calculate = function (self, card, context)
    if context.selling_card and not context.blueprint then
      if card.ability.extra.Xmult - card.ability.extra.Xmult_loss <= 1 then
        SMODS.destroy_cards(card, nil, nil, true)
        return {
          message = localize('pl_lasagna_mama_mia')
        }
      else
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'Xmult',
          scalar_value = 'Xmult_loss',
          operation = '-',
          message_key = 'a_xmult_minus',
          message_colour = G.C.MULT
        })
        return nil, true
      end
    end

    if context.joker_main and context.cardarea == G.jokers then
      return {
        Xmult_mod = card.ability.extra.Xmult,
        message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } }
      }
    end
  end
}
