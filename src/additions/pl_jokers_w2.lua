-- COMMONS

SMODS.Joker {
  key = 'croissant',
  atlas = 'pl_atlas_w2',
  pos = { x = 0, y = 0 },
  
  config = { extra = { upgrades_left = 4 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.upgrades_left } }
  end,

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
          G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('tarot1')
                card.T.r = -0.2
                card:juice_up(0.3, 0.4)
                card.states.drag.is = true
                card.children.center.pinch.x = true
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
              func = function()
                G.jokers:remove_card(self)
                card:remove()
                card = nil
              return true; end})) 
            return true
          end
          })) 
          return {
              message = localize('k_eaten_ex')
          }
        end
      end
    end
  end
}

SMODS.Joker {
  key = 'pop_up_joker',
  atlas = 'pl_atlas_w2',
  pos = { x = 1, y = 0 },
  soul_pos = { x = 0, y = 2},
  
  config = { extra = { chance = 2 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { (G.GAME.probabilities.normal or 1), card.ability.extra.chance} }
  end,

  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  discovered = true,

  rarity = 1,
  cost = 4,

  calculate = function(self, card, context)
    if context.reroll_shop then
      if #G.shop_booster.cards < G.GAME.starting_params.boosters_in_shop + (G.GAME.modifiers.extra_boosters or 0) then
        if pseudorandom('popup') < G.GAME.probabilities.normal/card.ability.extra.chance then
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

  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  discovered = true,

  rarity = 1,
  cost = 5,

  calculate = function (self, card, context)
    if context.pl_selling_joker and not context.blueprint then
      card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
      card_eval_status_text(card, 'jokers', nil, nil, nil, {message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult_gain}}})
    end
    
    if context.end_of_round and not context.blueprint and not context.repetition and not context.individual and card.ability.extra.mult > 0 then
      card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_loss
      card_eval_status_text(card, 'jokers', nil, nil, nil, {message = localize{type='variable',key='a_mult_minus',vars={card.ability.extra.mult_loss}}})
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
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.Chips,
          card = card
        }
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
    return { vars = { card.ability.extra.money, card.ability.extra.money_mod, (G.GAME.probabilities.normal or 1), card.ability.extra.chance } }
  end,

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
      if pseudorandom('balloon') < G.GAME.probabilities.normal/card.ability.extra.chance then
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('tarot1')
                card.T.r = -0.2
                card:juice_up(0.3, 0.4)
                card.states.drag.is = true
                card.children.center.pinch.x = true
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                    func = function()
                            G.jokers:remove_card(self)
                            card:remove()
                            card = nil
                        return true; end})) 
                return true
            end
        })) 
        return {
            message = localize('pl_hot_air_balloon_pop')
        }
      else
        card.ability.extra.money = card.ability.extra.money + card.ability.extra.money_mod
        return {
            message = localize('k_upgrade_ex')
        }
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
        -- card_eval_status_text(card, 'jokers', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.PURPLE})
        local text = card.ability.extra.last_hand
        local old_text = context.scoring_name
        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_level_up_ex')})
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(text, 'poker_hands'),chips = G.GAME.hands[text].chips, mult = G.GAME.hands[text].mult, level=G.GAME.hands[text].level})
        level_up_hand(context.blueprint_card or card, text, nil, 1)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(old_text, 'poker_hands'),chips = G.GAME.hands[old_text].chips, mult = G.GAME.hands[old_text].mult, level=G.GAME.hands[old_text].level})
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
    return { vars = { (G.GAME.probabilities.normal or 1), card.ability.extra.chance } }
  end,

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
        if pseudorandom('batteries') < G.GAME.probabilities.normal/card.ability.extra.chance then 
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
    if context.pl_suit_changed and not context.blueprint then
      card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
      card_eval_status_text(card, 'jokers', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.MULT})
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

  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  discovered = true,

  rarity = 3,
  cost = 6,

  calculate = function(self, card, context)
    if context.cardarea == G.play and context.other_card and context.other_card.ability.effect == 'Stone Card' and context.individual and not context.blueprint then
      card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
      return { message = localize('k_upgrade_ex'), focus = card, colour = G.C.MULT}
    end
    if context.destroying_card and context.destroying_card.ability.effect == 'Stone Card' and not context.blueprint then
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
      card.ability.extra.Xmult = card.ability.extra.Xmult - card.ability.extra.Xmult_loss
      if card.ability.extra.Xmult <= 1 then
        G.E_MANAGER:add_event(Event({
          func = function()
              play_sound('tarot1')
              card.T.r = -0.2
              card:juice_up(0.3, 0.4)
              card.states.drag.is = true
              card.children.center.pinch.x = true
              G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                  func = function()
                          G.jokers:remove_card(self)
                          card:remove()
                          card = nil
                      return true; end})) 
              return true
          end
        })) 
        return {
          message = localize('pl_lasagna_mama_mia')
        }
      else
        return {
          message = localize{type='variable',key='a_xmult_minus',vars={card.ability.extra.Xmult_loss}},
          colour = G.C.RED
        }
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
