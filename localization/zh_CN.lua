return {
  descriptions = {
    Back={
      b_pl_sponsored = {
        name = "赞助牌组",
        text = {
          '开局时拥有',
          '{C:attention,T:v_pl_ad_break}广告时段{}优惠券',
          '商店内卡牌槽位{C:attention}-1{}'
        }
      },
    },
    --Blind={},
    --Edition={},
    --Enhanced={},
    Joker = {
      j_pl_plantain = {
        name = '大蕉',
        text = {
          '{C:chips}+#1#{}筹码',
          '回合结束时',
          '有{C:green}#2#/#3#{}的几率',
          '摧毁此牌'
        }
      },
      j_pl_postcard = {
        name = '明信片',
        text = {
          '本赛局每售出',
          '一张{C:attention}明信片{}',
          '获得{X:mult,C:white}X1{}倍率',
          '{C:inactive}(当前为{X:mult,C:white}X#1#{C:inactive}倍率)',
        }
      },
      j_pl_mini_crossword = {
        name = '填字游戏',
        text = {
          '如果打出的牌',
          '正好是{C:attention}#2#{}张牌',
          '获得{C:mult}+#1#{}倍率',
          '{s:0.8}每个回合在3，4或5中选择',
          '{C:inactive}(当前为{C:mult}+#3#{C:inactive}倍率)',
        }
      },
      j_pl_bingo_card = {
        name = '宾果卡',
        text = {
          '每张打出的{C:attention}#1#{}和{C:attention}#2#{}',
          '在计分时给予',
          '{C:chips}+#3#{}筹码和{C:mult}+#4#{}倍率',
          '数字每个回合都会改变'
        }
      },
      j_pl_apple_pie = {
        name = '苹果派',
        text = {
          '回合结束时',
          '获得{C:money}$#1#{}',
          '然后降低{C:money}$#2#{}'
        }
      },
      j_pl_grape_soda = {
        name = '葡萄汽水',
        text = {
          '选择{C:attention}跳过盲注{}时',
          '获得标签奖励',
          '而{C:attention}不会{}跳过盲注',
          '之后摧毁此牌'
        }
      },
      j_pl_matryoshka = {
        name = '俄罗斯套娃',
        text = {
          '如果打出的牌中',
          '包含{C:attention}顺子',
          '重新触发所有记分牌'
        }
      },
      j_pl_jim = {
        name = '吉姆',
        text = {
          '重新触发所有',
          '{C:attention}不带有',
          '增强效果的记分牌'
        }
      },
      j_pl_crystal_joker = {
        name = '水晶小丑',
        text = {
          '如果打出的牌中',
          '包含{C:attention}石头牌{}',
          '生成一张随机的{C:tarot}塔罗牌{}'
        }
      },
      j_pl_el_dorado = {
        name = '黄金国',
        text = {
          '回合结束时',
          '你{C:attention}完整牌组{}中的每张{C:attention}万能牌',
          '使你获得{C:money}$#1#{}',
          '{C:inactive}(当前为{C:money}$#2#{C:inactive})'
        }
      },
      j_pl_black_cat = {
        name = '黑猫',
        text = {
          '每当一张{C:attention}幸运牌{}',
          '触发{C:attention}失败{}时',
          '获得{C:chips}+#1#{}筹码',
          '{C:inactive}(当前为{C:chips}+#2#{C:inactive}筹码)'
        }
      },
      j_pl_mossy_joker = {
        name = '苔藓小丑',
        text = {
          '出牌时',
          '将随机一张{C:attention}手牌{}',
          '变成',
          '随机一张{C:attention}记分牌{}'
        }
      },
      j_pl_nametag = {
        name = '姓名贴',
        text = {
          '每张名字中',
          '带有\'小丑\'的{C:attention}小丑牌{}',
          '会给予{X:mult,C:white}X2{}倍率'
        }
      },
      j_pl_calculator = {
        name = '计算器',
        text = {
          '打出的点数为{C:attention}#1#{}的牌',
          '在计分时给予{X:mult,C:white}X#3#{}倍率',
          '下一回合变成#2#'
        }
      },
      j_pl_raw_meat = {
        name = '生肉',
        text = {
          '击败{C:attention}Boss盲注{}后',
          '售出此牌可以',
          '回退一个{C:attention}底注',
          '{C:inactive}(#2#)'
        }
      },
      j_pl_croissant = {
        name = '羊角面包',
        text = {
          '重新触发接下来',
          '使用的{C:attention}#1#张{C:planet}星球牌{}'
        }
      },
      j_pl_pop_up_joker = {
        name = '弹出式小丑',
        text = {
          '{C:attention}重掷{}后商店有',
          '{C:green}#1#/#2#{}的几率上架一个',
          '随机的{C:attention}补充包'
        }
      },
      j_pl_lamp = {
        name = '提灯',
        text = {
          '每售出一张{C:attention}小丑牌{}',
          '获得{C:mult}+#2#{}倍率',
          '每回合{C:mult}-#3#{}倍率',
          '{C:inactive}(当前为{C:mult}+#1#{C:inactive}倍率)'
        }
      },
      j_pl_odd_sock = {
        name = '单只袜子',
        text = {
          '如果{C:attention}弃掉{}的牌中',
          '不包含{C:attention}对子',
          '获得{C:chips}+#1#{}筹码',
          '{C:inactive}(当前为{C:chips}+#2#{C:inactive}筹码)'
        }
      },
      j_pl_hot_air_balloon = {
        name = '热气球',
        text = {
          '回合结束时获得{C:money}$#1#{}',
          '每使用一张{C:tarot}塔罗牌{}',
          '这一金额提高{C:money}$#2#{}',
          '并且有{C:green}#3#/#4#{}的几率{C:attention}自毁'
        }
      },
      j_pl_three_body_problem = {
        name = '三体问题',
        text = {
          '如果打出的牌中',
          '包含{C:attention}三条{}',
          '升级上一次打出的牌型',
          '{C:inactive}(当前为{C:attention}#1#{C:inactive})'
        }
      },
      j_pl_loose_batteries = {
        name = '摇晃电池',
        text = {
          '重新触发所有打出的{C:attention}A牌',
          '且这些A牌有{C:green}#1#/#2#{}的几率',
          '被{C:attention}再一次{}重新触发'
        }
      },
      j_pl_painterly_joker = {
        name = '油彩小丑',
        text = {
          '每有一张牌改变花色',
          '获得{X:mult,C:white}X#1#{}倍率',
          '{C:inactive}(当前为{X:mult,C:white}X#2#{C:inactive}倍率)'
        }
      },
      j_pl_quarry = {
        name = '采石场',
        text = {
          '每有一张{C:attention}石头牌{}计分',
          '获得{X:mult,C:white}X#1#{}倍率',
          '摧毁所有计分的{C:attention}石头牌{}',
          '{C:inactive}(当前为{X:mult,C:white}X#2#{C:inactive}倍率)'
        }
      },
      j_pl_lasagna = {
        name = '千层面',
        text = {
          '{X:mult,C:white}X#1#{}倍率',
          '每{C:attention}售出{}一张牌',
          '失去{X:mult,C:white}X#2#{}倍率'
        }
      },
      j_pl_early_man = {
        name = '原始人',
        text = {
          '选择{C:attention}盲注{}时候',
          '生成一张',
          '{C:tarot}命运之轮'
        }
      },
      j_pl_archaeologist = {
        name = '考古学家',
        text = {
          '手牌中每张',
          '{V:1}#1#{}花色的牌',
          '给予{C:chips}+#2#{}筹码',
          '{s:0.8}回合结束时改变花色'
        }
      },
      j_pl_game_cartridge = {
        name = '游戏卡带',
        text = {
          '打出的第一张{C:attention}2{}，{C:attention}4{}，和{C:attention}8',
          '在计分时',
          '{C:attention}各自{}给予{X:mult,C:white}X#1#{}倍率'
        }
      },
      j_pl_dunce = {
        name = '劣等生',
        text = {
          '打出的牌在计分时',
          '给予{C:mult}+#1#{}',
          '{C:attention}减去牌的点数',
          '的倍率'
        }
      },
      j_pl_extraterrestrial_joker = {
        name = '天外来客',
        text = {
          '选择{C:attention}盲注{}时',
          '{C:attention}摧毁{}所有持有的{C:attention}消耗牌',
          '升级{C:attention}最常用{}的牌型等级',
          '{C:inactive}(当前为{C:attention}#1#{C:inactive})'
        }
      },
    },
    Other={
      pl_lavender_seal = {
        name = '薰衣草蜡封',
        text = {
            '如果{C:attention}弃掉{}的牌中',
            '包含此牌',
            '不消耗{C:attention}弃牌次数'
        }
      },
    },
    --Planet={},
    Spectral={
      c_pl_spec_aether = {
        name = '以太',
        text = {
          "给手牌中",
          "{C:attention}1{}张所选卡牌",
          "加上{C:lavender}薰衣草蜡封{}",
        },
      },
      c_pl_spec_rebirth = {
        name = '重生',
        text = {
          '选择{C:attention}3{}张牌，摧毁',
          '{C:attention}中间{}的牌，将它的点数',
          '赋予{C:attention}左右两侧{}的牌',
          '{C:inactive}(拖动来改变位置)'
        }
      },
    },
    --Stake={},
    --Tag={},
    --Tarot={},
    Voucher = {
      v_pl_ad_break = {
        name = '广告时段',
        text = {
          '商店可购买的',
          '卡包{C:attention}+1{}'
        }
      },
      v_pl_product_placement = {
        name = '产品植入',
        text = {
          '重掷时可以重掷',
          '所有{C:attention}未打开的{}卡包'
        }
      },
    },
  },
  misc = {
    dictionary = {
      pl_downgrade = 'Downgrade',
      pl_even = '偶数',
      pl_odd = '奇数',
      pl_inactive = '未激活',
      pl_active = '激活',
      pl_plantain_cooked = '烧焦了！',
      pl_apple_pie_slice = '切一块！',
      pl_apple_pie_sold_out = '已售罄！',
      pl_grape_soda_gulp = '咕咚！',
      pl_raw_meat_ante_down = '底注下降！',
      pl_pop_up_joker_winner_1 = '第100,000位访客！',
      pl_pop_up_joker_winner_2 = '恭喜！',
      pl_pop_up_joker_winner_3 = '你赢了！',
      pl_pop_up_joker_winner_4 = '免费杀毒软件！',
      pl_hot_air_balloon_pop = '砰！',
      pl_lasagna_mama_mia = '妈妈咪呀！',
    },
  --achievement_descriptions={},
  -- achievement_names={},
  --blind_states={},
  -- challenge_names={},
  -- collabs={},
  --dictionary={},
  --high_scores={},
    labels={
      pl_lavender_seal = "薰衣草蜡封",
    },
  -- poker_hand_descriptions={},
  --  poker_hands={},
  --  quips={},
  --  ranks={},
  -- suits_plural={},
  -- suits_singular={},
  --  v_dictionary={},
  -- v_text={},
  },
}
