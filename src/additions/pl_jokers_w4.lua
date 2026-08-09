-- COMMONS

SMODS.Joker {
  key = 'graffiti',
  atlas = 'pl_atlas_w4',
  pos = { x = 0, y = 0 },

  config = { extra = { mult = 15 } },
  loc_vars = function(self, info_queue, card)
    return {vars = { card.ability.extra.mult }}
  end,

  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  discovered = true,

  rarity = 1,
  cost = 5,

  calculate = function(self, card, context)
    if context.joker_main and context.cardarea == G.jokers then
      for _, v in ipairs(context.scoring_hand) do
        if next(SMODS.get_enhancements(v)) then
          return {
            mult_mod = card.ability.extra.mult,
            message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
          }
        end
      end
    end
  end
}

--UNCOMMONS

SMODS.Joker {
  key = 'lemonade',
  atlas = 'pl_atlas_w4',
  pos = { x = 2, y = 0 },

  config = { extra = { size = 3, decrease = 1 } },
  loc_vars = function(self, info_queue, card)
    return {vars = { card.ability.extra.size, card.ability.extra.decrease }}
  end,

  blueprint_compat = false,
  eternal_compat = false,
  perishable_compat = true,
  discovered = true,

  rarity = 2,
  cost = 6,

  add_to_deck = function(self, card, from_debuff)
    G.E_MANAGER:add_event(Event({
      func = function()
        change_shop_size(card.ability.extra.size)
        return true
      end
    }))
  end,

  remove_from_deck = function(self, card, from_debuff)
    G.GAME.shop.joker_max = G.GAME.shop.joker_max - card.ability.extra.size
  end,

  calculate = function (self, card, context)
    if context.ending_shop and not context.blueprint then
      card.ability.extra.size = card.ability.extra.size - card.ability.extra.decrease
      G.GAME.shop.joker_max = G.GAME.shop.joker_max - card.ability.extra.decrease
      if card.ability.extra.size == 0 then
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
        card_eval_status_text(card, 'jokers', nil, nil, nil, {message = localize('pl_lemonade_sold_out'), colour = G.C.MONEY})
      else
        card_eval_status_text(card, 'jokers', nil, nil, nil, {message = localize('pl_lemonade_decrease'), colour = G.C.MONEY})
      end
    end
  end,
}

SMODS.Joker {
  key = 'fun_house',
  atlas = 'pl_atlas_w4',
  pos = { x = 3, y = 0 },
  
  config = { extra = { xmult_mod = 0.5, xmult = 1 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult_mod, card.ability.extra.xmult } }
  end,
  attributes = {'xmult', 'scaling', 'hand_type'},

  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  discovered = true,

  rarity = 2,
  cost = 6,

  calculate = function(self, card, context)
    if context.before and G.GAME.current_round.hands_played == 0 and next(context.poker_hands['Full House']) and not context.blueprint then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'xmult',
        scalar_value = 'xmult_mod',
        message_colour = G.C.MULT
      })
      return true
    end
    if context.joker_main and card.ability.extra.xmult > 1 then
      return {
        xmult = card.ability.extra.xmult
      }
    end
  end
}

-- RARES

