SMODS.Voucher {
  key = 'ad_break',
  atlas = 'pl_atlas_vouchers',
  pos = { x = 0, y = 0 },
  discovered = true,

  redeem = function(self, card)

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

  redeem = function(self, card)

  end,
}
