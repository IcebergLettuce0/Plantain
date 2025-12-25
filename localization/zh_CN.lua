-- 译者注：对于涉及数字的描述文本，一般使用占位符（如#1#、#2#等）以便于动态替换具体数值。如果在代码里用了固定数值，可考虑替换为中文数字（一、二、三等）。
return {
    translator = {
        "mleaf233",
        "brookling"
    },
    descriptions = {
        --Blind={},
        --Edition={},
        --Enhanced={},
        Joker = {
            j_pl_plantain = {
                name = "大蕉",
                text = {
                    "{C:chips}+#1#{}筹码",
                    "在回合结束时有{C:green}#2#/#3#{}概率",
                    "摧毁此牌"
                }
            },
            j_pl_postcard = {
                name = "明信片",
                text = {
                    "本局内每售出一张{C:attention}明信片{}",
                    "这张小丑牌获得{X:mult,C:white}X1{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）"
                }
            },
            j_pl_mini_crossword = {
                name = "迷你填字游戏",
                text = {
                    "如果打出的牌正好有{C:attention}#2#{}张牌",
                    "获得{C:mult}+#1#{}倍率",
                    "{s:0.8}每回合会在3、4或5之间随机选择",
                    "{C:inactive}（当前为{C:mult}+#3#{C:inactive}倍率）"
                }
            },
            j_pl_bingo_card = {
                name = "宾果卡",
                text = {
                    "每张打出的{C:attention}#1#{}或{C:attention}#2#{}时",
                    "在计分时给予{C:chips}+#3#{}筹码和{C:mult}+#4#{}倍率",
                    "数字每个回合都会改变"
                }
            },
            j_pl_apple_pie = {
                name = "苹果派",
                text = {
                    "回合结束时获得{C:money}$#1#{}",
                    "之后每回合减少{C:money}$#2#{}"
                }
            },
            j_pl_grape_soda = {
                name = "葡萄汽水",
                text = {
                    "选择{C:attention}跳过盲注{}时",
                    "获得跳过的标签奖励{C:attention}",
                    "但不会跳过盲注{}",
                    "随后{S:1.1,C:red,E:2}自毁{}"
                }
            },
            j_pl_matryoshka = {
                name = "套娃",
                text = {
                    "如果打出的牌中",
                    "包含{C:attention}顺子{}",
                    "则重新触发所有计分牌"
                }
            },
            j_pl_jim = {
                name = "吉姆",
                text = {
                    "重新触发所有打出",
                    "且{C:attention}未被增强{}的计分牌"
                }
            },
            j_pl_crystal_joker = {
                name = "水晶小丑",
                text = {
                    "如果打出的牌中",
                    "包含{C:attention}石头牌{}",
                    "生成一张随机{C:tarot}塔罗牌{}"
                }
            },
            j_pl_el_dorado = {
                name = "黄金国",
                text = {
                    "回合结束时",
                    "你{C:attention}完整牌组{}中的每张{C:attention}万能牌",
                    "使你获得{C:money}$#1#{}",
                    "{C:inactive}（当前为{C:money}$#2#{C:inactive}）"
                }
            },
            j_pl_black_cat = {
                name = "黑猫",
                text = {
                    "每有一张{C:attention}幸运牌{}",
                    "概率判定失败时",
                    "这张小丑牌获得{C:chips}+#1#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码）"
                }
            },
            j_pl_mossy_joker = {
                name = "苔藓小丑",
                text = {
                    "出牌时随机将一张{C:attention}手牌{}",
                    "转化为随机一张{C:attention}计分牌{}"
                }
            },
            j_pl_nametag = {
                name = "名牌",
                text = {
                    "每张名字中含有“{C:attention}joker{}”的",
                    "{C:attention}小丑牌{}都会给予{X:mult,C:white}X2{}倍率",
                    "{C:inactive}（以英文名称为准）"
                }
            },
            j_pl_calculator = {
                name = "计算器",
                text = {
                    "打出点数为{C:attention}#1#{}的牌",
                    "在计分时给予{X:mult,C:white}X#3#{}倍率",
                    "{s:0.8}下一回合变成#2#"
                }
            },
            j_pl_raw_meat = {
                name = "生肉",
                text = {
                    "击败{C:attention}Boss盲注{}后",
                    "售出此小丑牌",
                    "{C:attention}#1#{C:attention}底注",
                    "{C:inactive}(#2#)"
                }
            },
            j_pl_croissant = {
                name = "羊角面包",
                text = {
                    "重新触发接下来",
                    "使用的{C:attention}#1#{}张{C:planet}星球牌{}",
                }
            },
            j_pl_pop_up_joker = {
                name = "弹窗小丑",
                text = {
                    "每次{C:attention}重掷{}有",
                    "{C:green}#1#/#2#{}概率",
                    "在商店中填充一{C:attention}补充包{}"
                }
            },
            j_pl_lamp = {
                name = "提灯",
                text = {
                    "每售出一张{C:attention}小丑牌{}",
                    "获得{C:mult}+#2#{}倍率",
                    "每回合{C:mult}-#3#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）"
                }
            },
            j_pl_odd_sock = {
                name = "单只袜子",
                text = {
                    "如果{C:attention}被弃掉的牌{}中",
                    "不包含{C:attention}对子{}",
                    "则获得{C:chips}+#1#{}筹码",
                    "{C:inactive}（当前为{C:chips}+#2#{C:inactive}筹码）"
                }
            },
            j_pl_hot_air_balloon = {
                name = "热气球",
                text = {
                    "回合结束时获得{C:money}$#1#{}",
                    "每使用一张{C:tarot}塔罗牌{}",
                    "这一数值提高{C:money}$#2#{}",
                    "有{C:green}#3#/#4#{}概率摧毁此牌"
                }
            },
            j_pl_three_body_problem = {
                name = "三体问题",
                text = {
                    "如果打出的牌型是{C:attention}三条{}",
                    "则升级上一手打出的牌型",
                    "{C:inactive}（当前为{C:attention}#1#{C:inactive}）"
                }
            },
            j_pl_loose_batteries = {
                name = "摇晃电池",
                text = {
                    "重新触发所有打出的{C:attention}A{}",
                    "并有{C:green}#1#/#2#{}概率再次重新触发"
                }
            },
            j_pl_painterly_joker = {
                name = "画家小丑",
                text = {
                    "每当一张牌改变花色时",
                    "这张小丑牌获得{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）"
                }
            },
            j_pl_quarry = {
                name = "采石场",
                text = {
                    "每当{C:attention}石头牌{}计分时",
                    "这张小丑牌获得{X:mult,C:white}X#1#{}倍率",
                    "并摧毁所有打出的{C:attention}石头牌{}",
                    "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）"
                }
            },
            j_pl_lasagna = {
                name = "千层面",
                text = {
                    "{X:mult,C:white}X#1#{}倍率",
                    "每售出一张牌失去{X:mult,C:white}X#2#{}倍率"
                }
            },
            j_pl_early_man = {
                name = "原始人",
                text = {
                    "选择{C:attention}盲注{}时",
                    "生成一张{C:tarot}命运之轮{}"
                }
            },
            j_pl_archaeologist = {
                name = "考古学家",
                text = {
                    "手牌中每张",
                    "{V:1}#1#{}花色的牌",
                    "给予{C:chips}+#2#{}筹码",
                    "{s:0.8}回合结束时改变花色"
                }
            },
            j_pl_game_cartridge = {
                name = "游戏卡带",
                text = {
                    "打出的第一张{C:attention}2{}、{C:attention}4{}和{C:attention}8{}",
                    "在计分时给予{X:mult,C:white}X#1#{}倍率"
                }
            },
            j_pl_dunce = {
                name = "笨学生",
                text = {
                    "打出的牌在计分时",
                    "给予{C:mult}+#1#{}倍率",
                    "并扣除其点数的倍率"
                }
            },
            j_pl_extraterrestrial_joker = {
                name = "天外来客",
                text = {
                    "选择{C:attention}盲注{}时",
                    "摧毁所有持有{C:attention}消耗牌{}",
                    "并升级{C:attention}最常用{}的牌型等级",
                    "{C:inactive}（当前为{C:attention}#1#{C:inactive}）"
                }
            },
        },
        Other = {
            pl_lavender_seal = {
                name = "薰衣草蜡封",
                text = {
                    "如果{C:attention}被弃掉的牌{}中",
                    "包含此牌",
                    "则不会消耗{C:attention}弃牌次数"
                }
            },
        },
        --Planet={},
        Spectral = {
            c_pl_spec_aether = {
                name = "以太",
                text = {
                    "为{C:attention}1{}张选中的牌",
                    "添加{C:lavender}薰衣草蜡封{}"
                }
            },
            c_pl_spec_rebirth = {
                name = "重生",
                text = {
                    "选择{C:attention}3{}张牌",
                    "摧毁中间的牌并将其点数",
                    "赋予左侧与右侧的牌",
                    "{C:inactive}（可拖拽调整顺序）"
                }
            },
        },
        --Stake={},
        --Tag={},
        --Tarot={},
        Voucher = {
            v_pl_ad_break = {
                name = "广告时段",
                text = {
                    "商店中可额外出现",
                    "{C:attention}+1{}个补充包"
                }
            },
            v_pl_product_placement = {
                name = "产品植入",
                text = {
                    "重掷时重新随机化所有",
                    "未开启的{C:attention}补充包{}"
                }
            },
        },
    },
    misc = {
        dictionary = {
            pl_downgrade = "降级",
            pl_even = "偶数",
            pl_odd = "奇数",
            pl_inactive = "未激活",
            pl_active = "激活",
            pl_plantain_cooked = "烤好了！",
            pl_apple_pie_slice = "切片！",
            pl_apple_pie_sold_out = "卖完啦！",
            pl_grape_soda_gulp = "咕嘟！",
            pl_raw_meat_ante_down = "底注下降！",
            pl_pop_up_joker_winner_1 = "第100,000位访客！",
            pl_pop_up_joker_winner_2 = "恭喜！",
            pl_pop_up_joker_winner_3 = "你赢了！",
            pl_pop_up_joker_winner_4 = "免费杀毒软件！",
            pl_hot_air_balloon_pop = "砰！",
            pl_lasagna_mama_mia = "妈呀！",
            pl_config_decks = "启用牌组",
            pl_config_seals = "启用蜡封",
            pl_config_spectral_cards = "启用幻灵牌",
            pl_config_vouchers = "启用优惠券",
            pl_credits_programming = "开发：IcebergLettuce, NachitoSMO",
            pl_credits_art = "美术：IcebergLettuce",
            pl_credits_idea = "想法：AtomicLight, BurntFrenchToast, TomatoIcecream, SpadeALay",

        },
        labels = {
            pl_lavender_seal = "薰衣草蜡封",
        },
    },
}
