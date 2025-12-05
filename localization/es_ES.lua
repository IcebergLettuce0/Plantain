return {
  descriptions = {
    --Back={},
    --Blind={},
    --Edition={},
    --Enhanced={},
    Joker = {
      j_pl_plantain = {
        name = 'Plátano',
        text = {
          '{C:chips}+#1#{} Fichas',
          'prob. de {C:green}#2# en #3#{} de',
          'destruirse al final',
          'de la ronda'
        }
      },
      j_pl_postcard = {
        name = 'Postal',
        text = {
          'Gana {X:mult,C:white}X1{} Multi cada vez',
          'que vendes otra {C:attention}Postal{}',
          '{C:inactive,0.8}(Actualmente {X:mult,C:white,0.8} X#1# {C:inactive,0.8} Multi)',
        }
      },
      j_pl_mini_crossword = {
        name = 'Crucigrama',
        text = {
          'Gana {C:mult}+#1#{} Multi si la mano jugada',
          'contiene exactamente {C:attention}#2#{} cartas',
          '{s:0.7}Escoge entre 3, 4, o 5 cada ronda',
          '{C:inactive}(Actualmente {C:mult}+#3#{C:inactive} Multi)'
        }
      },
      j_pl_bingo_card = {
        name = 'Cartón de Bingo',
        text = {
          'Cada {C:attention}#1#{} y {C:attention}#2#{} anotados',
          'otorgan {C:chips}+#3#{} Fichas y {C:mult}+#4#{} Multi,',
          'los números cambian cada ronda',
        }
      },
      j_pl_apple_pie = {
        name = 'Pie de Manzana',
        text = {
          'Ganas {C:money}$#1#{} al final de la',
          'ronda y se reduce {C:money}$#2#{}',
          'cada ronda'
        }
      },
      j_pl_grape_soda = {
        name = 'Refresco de Uva',
        text = {
          'Cuando {C:attention}Omites{} la ciega',
          'obtienes la {C:attention}etiqueta{}',
          'sin saltar la ciega y se {C:red}destruye',
        }
      },
      j_pl_matryoshka = {
        name = 'Matrioshka',
        text = {
          'Reactiva todas las cartas',
          'si tu mano contiene',
          'una {C:attention}Escalera'
        }
      },
      j_pl_jim = {
        name = 'Jim',
        text = {
          '{C:attention}Reactiva{} todas las',
          'cartas sin {C:attention}mejoras',
        }
      },
      j_pl_crystal_joker = {
        name = 'Comodín de Cristal',
        text = {
          'Si la mano contiene una',
          '{C:attention}Carta de Piedra{} crea',
          'una carta del {C:tarot}Tarot{}'
        }
      },
      j_pl_el_dorado = {
        name = 'El Dorado',
        text = {
          'Ganas {C:money}$#1#{} por cada carta',
          '{C:attention}Versátil{} en tu {C:attention}Baraja',
          'al final de la ronda',
          '{C:inactive}(Actualmente {C:money}$#2#{C:inactive})'
        }
      },
      j_pl_black_cat = {
        name = 'Gato Negro',
        text = {
          'Gana {C:chips}+#1#{} Fichas cada vez',
          'que una carta de la {C:attention}suerte{}',
          'no {C:attention}activa{} sus efectos',
          '{C:inactive}(Actualmente {C:chips}+#2# {C:inactive}Fichas)'
        }
      },
      j_pl_mossy_joker = {
        name = 'Comodín Mohoso',
        text = {
          'Convierte una Carta en {C:attention}mano{}',
          'en una carta {C:attention}anotada{}',
        }
      },
      j_pl_nametag = {
        name = 'Credencial',
        text = {
          '{X:mult,C:white}X2{} Multi por cada',
          '{C:attention}Comodín{} con la',
          'palabra \'Comodín\''
        }
      },
      j_pl_calculator = {
        name = 'Calculadora',
        text = {
          'Cada carta que sea',
          'de categoría {C:attention}#1#{} otorga',
          '{X:mult,C:white}X#3#{} Multi al anotar',
          '{s:0.8}Cambia a #2# en la siguiente ronda'
        }
      },
      j_pl_raw_meat = {
        name = 'Carne Cruda',
        text = {
          'Después de derrotar la {C:attention}Ciega Jefe{},',
          'vende este comodín para',
          'retroceder 1 {C:attention}Apuesta',
          '{C:inactive}(#2#)'
        }
      },
      j_pl_croissant = {
        name = 'Croissant',
        text = {
          '{C:attention}Reactiva{} las proximas {C:attention}#1#{}',
          'Cartas de {C:planet}Planeta'
        }
      },
      j_pl_pop_up_joker = {
        name = 'Comodín Pop-Up',
        text = {
          'Prob. de {C:green}#1# en #2#{} de agregar un',
          '{C:attention}Paquete Potenciador{} cada',
          'vez que {C:green}renuevas{} la tienda'
        }
      },
      j_pl_lamp = {
        name = 'Lámpara',
        text = {
          '{C:mult}+#2#{} Multi cuando {C:money}vendes',
          'un {C:attention}Comodín{} y pierde',
          '{C:mult}-#3#{} Multi en cada ronda',
          '{C:inactive}(Actualmente {C:mult}+#1#{C:inactive} Multi)'
        }
      },
      j_pl_odd_sock = {
        name = 'Otra Media Inpar',
        text = {
          'Gana {C:chips}+#1#{} Fichas si tu',
          'mano {C:attention}descartada{} no',
          'contiene {C:attention}Pares',
          '{C:inactive}(Actualmente {C:chips}+#2# {C:inactive}Fichas)'
        }
      },
      j_pl_hot_air_balloon = {
        name = 'Globo Aerostático',
        text = {
          'Ganas {C:money}$#1#{} al final de la ronda.',
          'Aumenta en {C:money}$#2#{} cada vez que una',
          'carta del {C:tarot}Tarot{} es usada con una',
          'prob. de {C:green}#3# en #4#{} de {C:red}destruirse'
        }
      },
      j_pl_three_body_problem = {
        name = '{s:0.9}El Problema de los 3 Cuerpos',
        text = {
          'Si tu mano jugada es una {C:attention}Tercia{}',
          'subes de {C:planet}nivel{} la última',
          'mano jugada',
          '{C:inactive}(Actualmente {C:attention}#1#{C:inactive})'
        }
      },
      j_pl_loose_batteries = {
        name = 'Baterias Sueltas',
        text = {
          'Reactiva los {C:attention}Ases{} jugados y',
          'tiene una prob. de {C:green}#1# en #2#{} de',
          '{C:attention}reactivarlos{} de nuevo'
        }
      },
      j_pl_painterly_joker = {
        name = 'Comodín Pintado',
        text = {
          'Gana {X:mult,C:white}X#1#{} Multi cada vez',
          'que una carta cambia de {C:attention}Palo',
          '{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive} Multi)'
        }
      },
      j_pl_quarry = {
        name = 'Cantera',
        text = {
          'Gana {X:mult,C:white}X#1#{} Multi cada vez',
          'que una Carta de {C:attention}Piedra{} anota,',
          '{C:red}destruye{} las Cartas de {C:attention}Piedra{}',
          "que juegas",
          '{C:inactive}(Actualmente {X:mult,C:white}X#2#{C:inactive} Multi)'
        }
      },
      j_pl_lasagna = {
        name = 'Lasaña',
        text = {
          '{X:mult,C:white}X#1#{} Multi.',
          'Pierde {X:mult,C:white}X#2#{} Multi',
          'cuando {C:money}vendes{} cartas'
        }
      },
    },
    Other={
      pl_lavender_seal = {
        name = 'Sello Lavanda',
        text = {
            'Si tu {C:red}descarte{}',
            'contiene esta carta',
            'no consume'
        }
      },
    },
    --Planet={},
    Spectral={
      c_pl_spec_aether = {
        name = 'Éter',
        text = {
          "Agrega un {C:lavender}Sello Lavanda{}",
          "a {C:attention}1{} carta seleccionada",
        },
      },
      c_pl_spec_rebirth = {
        name = 'Renacimiento',
        text = {
          'Selecciona {C:attention}3{} cartas, {C:red}destruye',
          'la carta del {C:attention}medio{} otorga su categoría',
          'a las cartas {C:attention}adyacentes{}',
          '{C:inactive}(Arrastra para reordenar)'
        }
      },
    },
    --Stake={},
    --Tag={},
    --Tarot={},
    -- Voucher = {},
  },
  misc = {
    dictionary = {
      pl_downgrade = 'Downgrade',
      pl_even = 'Par',
      pl_odd = 'Inpar',
      pl_inactive = 'Inactivo',
      pl_active = 'Activo',
      pl_plantain_cooked = '¡Cocinado!',
      pl_apple_pie_slice = '¡Tajada!',
      pl_apple_pie_sold_out = '¡Vendido!',
      pl_grape_soda_gulp = '¡Gulp!',
      pl_raw_meat_ante_down = '¡-1 Apuesta!',
      pl_pop_up_joker_winner_1 = '¡Visitante 100,000!',
      pl_pop_up_joker_winner_2 = '¡Felicidades!',
      pl_pop_up_joker_winner_3 = '¡Tu Ganas!',
      pl_pop_up_joker_winner_4 = '¡Antivirus Gratis!',
      pl_hot_air_balloon_pop = '¡Pop!',
      pl_lasagna_mama_mia = '¡Mama Mia!',
    },
  --achievement_descriptions={},
  -- achievement_names={},
  --blind_states={},
  -- challenge_names={},
  -- collabs={},
  --dictionary={},
  --high_scores={},
    labels={
      pl_lavender_seal = "Sello Lavanda",
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
