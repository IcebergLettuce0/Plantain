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