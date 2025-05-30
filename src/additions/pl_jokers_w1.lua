SMODS.Joker {
  key = 'plantain',
  config = { 
    extra = {chips = 80, chance = 4} },
  rarity = 1,
  atlas = 'pl_atlas_w1',
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = true,
  pos = { x = 0, y = 0 },
  cost = 4,
  discovered = true,
  pools = {
    Food = true
  },
  loc_vars = function(self, info_queue, card)
    return { vars = { (card.ability.extra.real_chips or G.GAME.pl_plantain_chips or card.ability.extra.chips),
      (G.GAME.probabilities.normal or 1),
      (card.ability.extra.real_chance or G.GAME.pl_plantain_chance or card.ability.extra.chance),  } }
  end,
  add_to_deck = function(self,card,context)
    if G.GAME.pl_plantain_chips == nil then
      card.ability.extra.real_chips = card.ability.extra.chips
    else
      card.ability.extra.real_chips = G.GAME.pl_plantain_chips
    end
    if G.GAME.pl_plantain_chance == nil then
      card.ability.extra.real_chance = card.ability.extra.chance
    else
      card.ability.extra.real_chance = G.GAME.pl_plantain_chance
    end
  end,
  calculate = function(self, card, context)
    if context.end_of_round and not context.blueprint and not context.repetition and not context.individual then
      if pseudorandom('plantain') < G.GAME.probabilities.normal/card.ability.extra.real_chance then 
        G.GAME.pl_plantain_chips = (G.GAME.pl_plantain_chips or card.ability.extra.chips) + card.ability.extra.chips
        G.GAME.pl_plantain_chance = (G.GAME.pl_plantain_chance or card.ability.extra.chance) + card.ability.extra.chance
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
            message = localize('pl_plantain_cooked')
        }
      else
        return {
            message = localize('k_safe_ex')
        }
      end
    end
    if context.joker_main and context.cardarea == G.jokers then
      return 
      {
        chip_mod = card.ability.extra.real_chips,
        message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.real_chips } }
      }
    end
  end
}

SMODS.Joker {
  key = 'postcard',
  rarity = 1,
  atlas = 'pl_atlas_w1',
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = true,
  pos = { x = 1, y = 0 },
  cost = 2,
  discovered = true,
  config = { extra = { Xmult = 1 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xmult + (G.GAME.pl_postcards_sold or 0) } }
  end,
  calculate = function(self, card, context)
    if context.selling_self then
      G.GAME.pl_postcards_sold = (G.GAME.pl_postcards_sold or 0) + 1
    end
    if context.joker_main and context.cardarea == G.jokers then
      if G.GAME.pl_postcards_sold ~= nil then
        return {
          Xmult_mod = card.ability.extra.Xmult + G.GAME.pl_postcards_sold,
          message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult + G.GAME.pl_postcards_sold } }
        }
      end
    end
  end
}

SMODS.Joker {
  key = 'mini_crossword',
  rarity = 1,
  atlas = 'pl_atlas_w1',
  cost = 5,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pos = { x = 2, y = 0 },
  config = { extra = { mult_mod = 1, cw_size = 1 , mult = 0} },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult_mod, card.ability.extra.cw_size, card.ability.extra.mult} }
  end,
  set_ability = function(self, card, initial, delay_sprites)
    local valid_cw_size = {3, 4, 5}
    card.ability.extra.cw_size = pseudorandom_element(valid_cw_size, pseudoseed('crossword'..G.GAME.round_resets.ante)) 
	end,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.before and #context.full_hand == card.ability.extra.cw_size and not context.blueprint then
      card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
      return { message = localize('k_upgrade_ex'), focus = card, colour = G.C.MULT}
    end
    if context.joker_main and context.cardarea == G.jokers then
      if card.ability.extra.mult > 0 then
        return {
          mult_mod = card.ability.extra.mult,
          message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
        }
      end
    end
    if context.end_of_round and not context.repetition and not context.individual then
      local valid_cw_size = {3, 4, 5}
      table.remove(valid_cw_size, card.ability.extra.cw_size - 2)
      card.ability.extra.cw_size = pseudorandom_element(valid_cw_size, pseudoseed('crossword'..G.GAME.round_resets.ante)) 
    end
  end
}

SMODS.Joker {
  key = 'bingo_card',
  rarity = 1,
  atlas = 'pl_atlas_w1',
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  pos = { x = 3, y = 0 },
  cost = 5,
  discovered = true,
  config = { extra = { mult = 5, chips = 25, bingo1 = 3, bingo2 = 7 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.bingo1, card.ability.extra.bingo2, card.ability.extra.chips, card.ability.extra.mult } }
  end,
  set_ability = function(self, card, initial, delay_sprites)
    local numbers = {2, 3, 4, 5, 6, 7, 8, 9, 10}
    local bingo1 = pseudorandom_element(numbers, pseudoseed('bingo'..G.GAME.round_resets.ante))
    table.remove(numbers, bingo1 - 1)
    local bingo2 = pseudorandom_element(numbers, pseudoseed('bango'..G.GAME.round_resets.ante))
    if bingo1 > bingo2 then
      bingo1, bingo2 = bingo2, bingo1
    end
    card.ability.extra.bingo1 = bingo1
    card.ability.extra.bingo2 = bingo2
	end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:get_id() == card.ability.extra.bingo1 or context.other_card:get_id() == card.ability.extra.bingo2 then
        return {
          chips = card.ability.extra.chips,
          mult = card.ability.extra.mult,
          card = card
        }
      end
    end
    if context.end_of_round and not context.repetition and not context.individual then
      local numbers = {2, 3, 4, 5, 6, 7, 8, 9, 10}
      local bingo1 = pseudorandom_element(numbers, pseudoseed('bingo'..G.GAME.round_resets.ante))
      table.remove(numbers, bingo1 - 1)
      local bingo2 = pseudorandom_element(numbers, pseudoseed('bango'..G.GAME.round_resets.ante))
      if bingo1 > bingo2 then
        bingo1, bingo2 = bingo2, bingo1
      end
      card.ability.extra.bingo1 = bingo1
      card.ability.extra.bingo2 = bingo2
    end
  end
}

SMODS.Joker {
  key = 'apple_pie',
  config = { extra = { money = 6, money_loss = 1 } },
  rarity = 1,
  atlas = 'pl_atlas_w1',
  blueprint_compat = false,
  eternal_compat = false,
  perishable_compat = true,
  pos = { x = 4, y = 0 },
  cost = 5,
  discovered = true,
  pools = {
    Food = true
  },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.money, card.ability.extra.money_loss } }
  end,

  calc_dollar_bonus = function(self, card)
    local bonus = card.ability.extra.money
    if bonus > 0 then return bonus end
  end,

  calculate = function(self, card, context)
    if context.pl_cash_out and not context.blueprint then
      card.ability.extra.money = card.ability.extra.money - card.ability.extra.money_loss
      if card.ability.extra.money == 0 then
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
        card_eval_status_text(card, 'jokers', nil, nil, nil, {message = localize('pl_apple_pie_sold_out'), colour = G.C.MONEY})
      else
        card_eval_status_text(card, 'jokers', nil, nil, nil, {message = localize('pl_apple_pie_slice'), colour = G.C.MONEY})
     end
    end
  end
}

SMODS.Joker {
  key = 'grape_soda',
  rarity = 2,
  atlas = 'pl_atlas_w1',
  config = { extra = { should_destroy = true } },
  discovered = true,
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.should_destroy } }
  end,
  blueprint_compat = false,
  eternal_compat = false,
  perishable_compat = true,
  pos = { x = 0, y = 1 },
  cost = 6,
  pools = {
    Food = true
  },
  calculate = function(self, card, context)
    if context.skip_blind and not context.blueprint then
      G.E_MANAGER:add_event(Event({
        func = function()
          for i=1, #G.jokers.cards do
            other_soda = G.jokers.cards[i]
            if other_soda.ability.name == card.ability.name and other_soda ~= card and card.ability.extra.should_destroy then
              other_soda.ability.extra.should_destroy = false
            end
          end
          if card.ability.extra.should_destroy then
            card_eval_status_text(card, 'jokers', nil, nil, nil, {message = localize('pl_grape_soda_gulp'), colour = G.C.RED})
            card:start_dissolve({G.C.RED}, card)
            play_sound('whoosh2')
            G.E_MANAGER:add_event(Event({delay = 0.2,
              func = function()
                G.GAME.pl_grape_used = G.GAME.blind_on_deck
                save_run()
              return true
            end}))
          end
        return true
      end}))
    end
    if context.setting_blind then
      card.ability.extra.should_destroy = true
    end
  end
}

SMODS.Joker {
  key = 'matryoshka',
  config = { extra = { repetitions = 1 } },
  rarity = 2,
  atlas = 'pl_atlas_w1',
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  pos = { x = 1, y = 1 },
  cost = 6,
  discovered = true,
  calculate = function(self, card, context)
    if context.cardarea == G.play and context.repetition and not context.repetition_only then
      if next(context.poker_hands['Straight']) then
        return {
          message = localize("k_again_ex"),
          repetitions = card.ability.extra.repetitions,
          card = card,
        }
      end
    end
  end
}

SMODS.Joker {
  key = 'jim',
  config = { extra = { repetitions = 1 } },
  rarity = 2,
  atlas = 'pl_atlas_w1',
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  pos = { x = 2, y = 1 },
  cost = 6,
  discovered = true,
  calculate = function(self, card, context)
    if context.cardarea == G.play and context.repetition then
      if context.other_card.ability.set ~= 'Enhanced' then
        return 
        {
          message = localize("k_again_ex"),
          repetitions = card.ability.extra.repetitions,
          card = card, 
        }
      end
    end
  end
}

SMODS.Joker {
  key = 'crystal_joker',
  rarity = 2,
  atlas = 'pl_atlas_w1',
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  pos = { x = 3, y = 1 },
  cost = 6,
  enhancement_gate = 'm_stone',
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
  end,
  calculate = function(self, card, context)
    if context.after and context.cardarea == G.jokers then
      local stone = false
      for i = 1, #context.scoring_hand do
        if context.scoring_hand[i].ability.effect == "Stone Card" then stone = true
      end
    end
      if stone and (#G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit) then
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        G.E_MANAGER:add_event(Event({
          trigger = 'before',
          delay = 0.0,
          func = (function()
                  local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'sup')
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
  end
}

SMODS.Joker {
  key = 'el_dorado',
  config = { extra = { money_mod = 3 } },
  rarity = 2,
  discovered = true,
  atlas = 'pl_atlas_w1',
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  pos = { x = 4, y = 1 },
  cost = 7,
  enhancement_gate = 'm_wild',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.money_mod, PL_UTIL.wild_card_count() * card.ability.extra.money_mod } }
  end,

  calc_dollar_bonus = function(self, card)
    local bonus = PL_UTIL.wild_card_count() * card.ability.extra.money_mod
    if bonus > 0 then return bonus end
  end
}

SMODS.Joker {
  key = 'black_cat',
  rarity = 2,
  atlas = 'pl_atlas_w1',
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  config = { extra = { chips_mod = 13, chips = 0 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
    return { vars = { card.ability.extra.chips_mod , card.ability.extra.chips } }
  end,
  pos = { x = 0, y = 2 },
  cost = 6,
  enhancement_gate = 'm_lucky',

  calculate = function(self, card, context)
    if context.cardarea == G.play and context.individual and not context.blueprint then
      if SMODS.has_enhancement(context.other_card, 'm_lucky') and not context.other_card.lucky_trigger then
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod
        return { message = localize('k_upgrade_ex'), focus = card}
      end
    end

    if context.joker_main and context.cardarea == G.jokers then
      if card.ability.extra.chips > 0 then
        return 
        {
          chip_mod = card.ability.extra.chips,
          message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
        }
      end
    end
  end
}


SMODS.Joker {
  key = 'mossy_joker',
  rarity = 3,
  atlas = 'pl_atlas_w1',
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  pos = { x = 1, y = 2 },
  cost = 8,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.before and #G.hand.cards > 0 then
      local removed_card = pseudorandom_element(G.hand.cards, pseudoseed('mossy_joker'))
      local copied_card = pseudorandom_element(context.scoring_hand, pseudoseed('mossy_joker'))
      removed_card:flip()
      copy_card(copied_card, removed_card)
      G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() play_sound('tarot1');removed_card:juice_up(0.3, 0.3);return true end }))
      delay(0.3)
      G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() removed_card:flip();removed_card:juice_up(0.3, 0.3);return true end }))
      delay(0.5)
      return {
            message = localize('k_copied_ex'),
            colour = G.C.GREEN,
            card = card,
          }
    end
  end
}

SMODS.Joker {
  key = 'nametag',
  rarity = 3,
  atlas = 'pl_atlas_w1',
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  pos = { x = 2, y = 2 },
  cost = 8,
  discovered = true,
  config = { extra = { Xmult = 2 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xmult } }
  end,
  calculate = function(self, card, context)

    local give_xmult = false

    if context.other_joker then
      if NametagCompatible[context.other_joker.config.center.key] or (context.other_joker.config.center.loc_txt and context.other_joker.config.center.loc_txt.name
      and (string.find(context.other_joker.config.center.loc_txt.name, 'Joker') or string.find(context.other_joker.config.center.loc_txt.name, 'joker'))) then
        give_xmult = true
      end
    end

    if (give_xmult) then
      G.E_MANAGER:add_event(Event({
        func = function()
          context.other_joker:juice_up(0.5, 0.5)
          return true
        end
      }))
      return {
        message = localize{type = 'variable',key = 'a_xmult', vars = { card.ability.extra.Xmult } },
        Xmult_mod = card.ability.extra.Xmult,
        focus = context.other_joker
      }
    end
  end
}

SMODS.Joker {
  key = 'calculator',
  rarity = 3,
  atlas = 'pl_atlas_w1',
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  pos = { x = 3, y = 2 },
  cost = 7,
  discovered = true,
  config = { extra = { is_odd = 'pl_even', next_round = 'pl_odd', Xmult = 1.5} },
  loc_vars = function(self, info_queue, card)
    return { vars = { localize(card.ability.extra.is_odd), localize(card.ability.extra.next_round), card.ability.extra.Xmult} }
  end,
  calculate = function(self, card, context)
    if context.end_of_round and not context.repetition and not context.individual and not context.blueprint then
      card.ability.extra.is_odd, card.ability.extra.next_round = card.ability.extra.next_round, card.ability.extra.is_odd
    end

    if context.cardarea == G.play and context.individual then
      if card.ability.extra.is_odd == 'pl_odd' then
        if ((context.other_card:get_id() <= 10 and context.other_card:get_id() >= 0
        and context.other_card:get_id()%2 == 1) or (context.other_card:get_id() == 14)) then
          return {
            Xmult = card.ability.extra.Xmult,
            card = card
          }
        end
      else
        if context.other_card:get_id() <= 10 and context.other_card:get_id() >= 0
        and context.other_card:get_id()%2 == 0 then
          return {
            Xmult = card.ability.extra.Xmult,
            card = card
          }
        end
      end
    end
  end
}

SMODS.Joker {
  key = 'raw_meat',
  rarity = 3,
  atlas = 'pl_atlas_w1',
  blueprint_compat = false,
  eternal_compat = false,
  perishable_compat = true,
  config = { extra = { minus_ante = -1, reduce_ante = "pl_inactive" } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.minus_ante, localize(card.ability.extra.reduce_ante) } }
  end,
  pos = { x = 4, y = 2 },
  cost = 9,
  discovered = true,
  pools = {
    Food = true
  },
  calculate = function(self, card, context)
    if context.end_of_round and G.GAME.blind.boss and not context.repetition and not context.individual and not context.blueprint then
      card.ability.extra.reduce_ante = "pl_active"
      local eval = function(card) return not card.REMOVED end
      juice_card_until(card, eval, true)
      return {
        message = localize('k_active_ex'),
        colour = G.C.FILTER
      }
    end
    if context.selling_self and not context.blueprint and card.ability.extra.reduce_ante == "pl_active" then
      ease_ante(card.ability.extra.minus_ante)
      card_eval_status_text(card, 'jokers', nil, nil, nil, {message = localize('pl_raw_meat_ante_down'), colour = G.C.BLACK})
    end
  end
}
