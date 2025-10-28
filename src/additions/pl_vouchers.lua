SMODS.Voucher {
  key = 'ad_break',
  atlas = 'pl_atlas_vouchers',
  pos = { x = 0, y = 0 },
  discovered = true,

  redeem = function(self, card)
    SMODS.change_booster_limit(1)
  end,
}

SMODS.Voucher {
  key = 'product_placement',
  atlas = 'pl_atlas_vouchers',
  pos = { x = 1, y = 0 },
  discovered = true,
  requires = {
    'v_pl_ad_break'
  },

  calculate = function(self, card, context)
    if context.reroll_shop then
      for i=1, #G.shop_booster.cards do
        PL_UTIL.reroll_booster_pack(i)
      end
    end
  end,
}
