return {
    descriptions = {
        --Back={},
        --Blind={},
        --Edition={},
        --Enhanced={},
        Joker = {
            j_pl_plantain = {
                name = 'Plantain',
                text = {
                    '{C:chips}+#1#{} Chips',
                    '{C:green}#2# in #3#{} chance this',
                    'card is destroyed',
                    'at end of round'
                }
            },
            j_pl_postcard = {
                name = 'Postcard',
                text = {
                    'Gains {X:mult,C:white}X1{} Mult for',
                    'each {C:attention}Postcard{}',
                    'sold this run',
                    '{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)',
                }
            },
            j_pl_mini_crossword = {
                name = 'Mini Crossword',
                text = {
                    'Gains {C:mult}+#1#{} Mult if played hand',
                    'has exactly {C:attention}#2#{} cards',
                    '{s:0.8}Chooses between 3, 4, or 5 every round',
                    '{C:inactive}(Currently {C:mult}+#3#{C:inactive} Mult)'
                }
            },
            j_pl_bingo_card = {
                name = 'Bingo Card',
                text = {
                    'Each played {C:attention}#1#{} and {C:attention}#2#{}',
                    'gives {C:chips}+#3#{} Chips and {C:mult}+#4#{} Mult',
                    'when scored, number cards',
                    'change every round'
                }
            },
            j_pl_apple_pie = {
                name = 'Apple Pie',
                text = {
                    'Earn {C:money}$#1#{} at',
                    'end of round, and',
                    'decrease by {C:money}$#2#{}'
                }
            },
            j_pl_grape_soda = {
                name = 'Grape Soda',
                text = {
                    'Selecting {C:attention}Skip Blind',
                    'gives the Skip Tag {C:attention}without',
                    'skipping the Blind, and',
                    'destroys this card'
                }
            },
            j_pl_matryoshka = {
                name = 'Matryoshka',
                text = {
                    'Retrigger all scoring',
                    'cards if played hand',
                    'contains a {C:attention}Straight'
                }
            },
            j_pl_jim = {
                name = 'Jim',
                text = {
                    'Retrigger all played',
                    'cards {C:attention}without',
                    'enhancements'
                }
            },
            j_pl_crystal_joker = {
                name = 'Crystal Joker',
                text = {
                    'If played hand contains',
                    'a {C:attention}Stone{} card, create',
                    'a random {C:tarot}Tarot{} card'
                }
            },
            j_pl_el_dorado = {
                name = 'El Dorado',
                text = {
                    'Earn {C:money}$#1#{} for each {C:attention}Wild',
                    'card in your {C:attention}full deck',
                    'at end of round',
                    '{C:inactive}(Currently {C:money}$#2#{C:inactive})'
                }
            },
            j_pl_black_cat = {
                name = 'Black Cat',
                text = {
                    'Gains {C:chips}+#1#{} Chips each',
                    'time a {C:attention}Lucky{} card',
                    '{C:attention}fails{} to trigger',
                    '{C:inactive}(Currently {C:chips}+#2# {C:inactive}Chips)'
                }
            },
            j_pl_mossy_joker = {
                name = 'Mossy Joker',
                text = {
                    'Convert a random card',
                    '{C:attention}held in hand{} into a',
                    'random {C:attention}scored{} card'
                }
            },
            j_pl_nametag = {
                name = 'Nametag',
                text = {
                    '{X:mult,C:white}X2{} Mult for every',
                    '{C:attention}Joker{} with \'Joker\'',
                    'in its name'
                }
            },
            j_pl_calculator = {
                name = 'Calculator',
                text = {
                    'Each played card with',
                    '{C:attention}#1#{} rank gives',
                    '{X:mult,C:white}X#3#{} Mult when scored',
                    '{s:0.8}Changes to #2# next round'
                }
            },
            j_pl_raw_meat = {
                name = 'Raw Meat',
                text = {
                    'After defeating {C:attention}Boss Blind{},',
                    'sell this Joker to',
                    'go back 1 {C:attention}Ante',
                    '{C:inactive}(#2#)'
                }
            },
        },
        --Other={},
        --Planet={},
        --Spectral={},
        --Stake={},
        --Tag={},
        --Tarot={},
        -- Voucher = {},
    },
    misc = {
        dictionary = {
            pl_plantain_cooked = 'Cooked!',
            pl_apple_pie_slice = 'Slice!',
            pl_apple_pie_sold_out = 'Sold Out!',
            pl_grape_soda_gulp = 'Gulp!',
            pl_raw_meat_ante_down = 'Ante Down!',
        }
    }
    --achievement_descriptions={},
    -- achievement_names={},
    --blind_states={},
    -- challenge_names={},
    -- collabs={},
    --dictionary={},
    --high_scores={},
    -- labels={},
    -- poker_hand_descriptions={},
    --  poker_hands={},
    --  quips={},
    --  ranks={},
    -- suits_plural={},
    -- suits_singular={},
    --  v_dictionary={},
    -- v_text={},
    --},
}
