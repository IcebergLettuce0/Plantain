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
  key = 'automaton',
  atlas = 'pl_atlas_w4',
  pos = { x = 1, y = 0 },

  config = { extra = { active = false, itsme = false } },

  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  discovered = true,

  rarity = 2,
  cost = 6,

  calculate = function (self, card, context)
    if context.cardarea then
      if context.individual and not context.blueprint then
        card.ability.extra.itsme = false
        if context.other_card:get_id() >= 11 and context.other_card:get_id() <= 13 then
          card.ability.extra.active = true
        else
          if card.ability.extra.active == true then
            card.ability.extra.itsme = true
            card.ability.extra.active = false
          end
        end
      elseif context.repetition and card.ability.extra.itsme then
        return {
          message = localize("k_again_ex"),
          repetitions = 2,
          card = card,
        }
      end
    end
    -- if context.cardarea == G.play and context.repetition then
    --   if context.other_card:get_id() >= 11 and context.other_card:get_id() <= 13 then
    --     card.ability.extra.active = true
    --   elseif card.ability.extra.active == true and not context.blueprint then
    --     card.ability.extra.active = false
    --     return 
    --     {
    --       message = localize("k_again_ex"),
    --       repetitions = 2,
    --       card = card, 
    --     }
    --   end
    -- end
  end
}

SMODS.Joker {
  key = 'lemonade_stand',
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
        card_eval_status_text(card, 'jokers', nil, nil, nil, {message = localize('pl_lemonade_stand_sold_out'), colour = G.C.MONEY})
      else
        card_eval_status_text(card, 'jokers', nil, nil, nil, {message = localize('pl_lemonade_stand_decrease'), colour = G.C.MONEY})
      end
    end
  end,
}

-- RARES

