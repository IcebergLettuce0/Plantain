if PL_UTIL.config.vouchers_enabled then
  SMODS.Back {
    key = 'sponsored',
    atlas = 'pl_atlas_decks',
    pos = { x = 0, y = 0 },
    discovered = true,
    config = {
        vouchers = {
          'v_pl_ad_break'
        },
      },

    apply = function(self, back)
      change_shop_size(-1)
    end
  }
end

SMODS.Back {
  key = 'honeycomb',
  atlas = 'pl_atlas_decks',
  pos = { x = 1, y = 0 },
  discovered = true,
  config = { extra_discards = 0, extra_hand_bonus = 0 },
  loc_vars = function(self, info_queue, card)
    return { vars = { self.config.extra_discards} }
  end,

  apply = function(self, back)
    G.GAME.honeycomb_discards = 0
  end,

  calculate = function(self, back, context)
      if context.end_of_round then
        G.GAME.honeycomb_discards = G.GAME.current_round.hands_left
      elseif context.setting_blind then
        if G.GAME.honeycomb_discards ~= 0 then
          ease_discard(G.GAME.honeycomb_discards)
          return {
            message = localize {
              type = 'variable',
              key = 'pl_a_discards',
              vars = { G.GAME.honeycomb_discards }
            },
            colour = G.C.MULT,
            card = card
          }
        end
      end
    end
}