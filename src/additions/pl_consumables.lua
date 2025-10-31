if PL_UTIL.config.seals_enabled then
	SMODS.Consumable{
		set = 'Spectral',
		key = 'spec_aether', 
			atlas = 'pl_atlas_consumables',
		pos = { x = 0, y = 0 },
		
		config = {extra = {count = 4, cost = 8}},
		discovered = true,

		loc_vars = function(self, info_queue, card)
			info_queue[#info_queue + 1] =
			{ set = "Other", key = "pl_lavender_seal", specific_vars = {} }
			return {
				vars = { card.ability.max_highlighted }
			}
		end,
		use = function(self, card, area, copier)
			for i = 1, #G.hand.highlighted do
				local highlighted = G.hand.highlighted[i]
				-- G.E_MANAGER:add_event(Event({
				-- 	func = function()
				-- 		play_sound("tarot1")
				-- 		highlighted:juice_up(0.3, 0.5)
				-- 		return true
				-- 	end,
				-- }))
				-- G.E_MANAGER:add_event(Event({
				-- 	trigger = "after",
				-- 	delay = 0.1,
				-- 	func = function()
				-- 		if highlighted then
				-- 			highlighted:set_seal("pl_lavender")
				-- 		end
				-- 		return true
				-- 	end,
				-- }))
				-- delay(0.5)
				-- G.E_MANAGER:add_event(Event({
				-- 	trigger = "after",
				-- 	delay = 0.2,
				-- 	func = function()
				-- 		G.hand:unhighlight_all()
				-- 		return true
				-- 	end,
				-- }))

				G.E_MANAGER:add_event(Event({func = function()
					play_sound('tarot1')
					card:juice_up(0.3, 0.5)
					return true end }))
				
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
					highlighted:set_seal('pl_lavender', nil, true)
					return true end }))
				
				delay(0.5)
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
			end
		end,
		can_use = function(self, card, area)
			if G.hand and (#G.hand.highlighted == 1) and G.hand.highlighted[1] then
				return true
			else
				return false
			end
		end
	}
end

SMODS.Consumable{
	set = 'Spectral',
	key = 'spec_rebirth',
    atlas = 'pl_atlas_consumables',
	pos = { x = 1, y = 0 },

	config = {extra = {cost = 4}},
	discovered = true,

	can_use = function(self, card)
		if #G.hand.highlighted == 3 then
			return true
		else
			return false
		end
	end,

	use = function(self, card, area)

		local rightmost = G.hand.highlighted[3]
		local middle = G.hand.highlighted[2]
		local leftmost = G.hand.highlighted[1]
		local destroyed_cards = {}

		for i=1, #G.hand.highlighted do
			if G.hand.highlighted[i].T.x < math.max(rightmost.T.x, middle.T.x, leftmost.T.x) and G.hand.highlighted[i].T.x > math.min(rightmost.T.x, middle.T.x, leftmost.T.x) then
				middle = G.hand.highlighted[i]
			end
		end

		for i=1, #G.hand.highlighted do
			if (G.hand.highlighted[i] ~= middle) then
				local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
           		G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.5, func = function() 
					G.hand.highlighted[i]:flip();
					play_sound('tarot2', percent, 0.6);
					G.hand.highlighted[i]:juice_up(0.3, 0.3);
				return true end }))
			end
		end
		for i=1, #G.hand.highlighted do
			if (G.hand.highlighted[i] ~= middle) then
				
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.5,func = function()
					assert(SMODS.change_base(G.hand.highlighted[i], nil, middle.base.value));
					G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);
					G.hand.highlighted[i]:juice_up(0.3, 0.3);
					return true end }))
			end
		end

		destroyed_cards[#destroyed_cards+1] = middle

		SMODS.calculate_context({scoring_hand = destroyed_cards, remove_playing_cards = true, removed = destroyed_cards})

		G.E_MANAGER:add_event(Event({
            func = function()
                if middle.shattered then
                    middle:shatter()
                else
                    middle:start_dissolve()
                end
                return true
            end
        }))
		
	end,
}