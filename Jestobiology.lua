--- STEAMODDED HEADER
--- MOD_NAME: Jestobiology
--- MOD_ID: Jestobiology
--- MOD_AUTHOR: [Lyman]
--- MOD_DESCRIPTION: Mod Compatibility Pack for Fusion Jokers
--- PRIORITY: 13379001

----------------------------------------------
------------MOD CODE -------------------------

-- #### Check for Loaded Mods ####
-- Fusion Jokers
is_fusionJokers = not (SMODS.INIT.FusionJokers == nil)
-- Jank Jonklers
is_jankJonklers = not (SMODS.INIT.JankJonklersMod == nil)
-- Myst Jokers
is_mystJokers = not (SMODS.INIT.MystJokers == nil)
-- MoreFluff
is_moreFluff = not (SMODS.INIT.MoreFluff == nil)
-- AutumnCircus
is_autumnCircus = not (SMODS.INIT.TheAutumnCircus == nil)
-- SDM_0's Stuff
is_SDM = not (SMODS.INIT.sdm_0s_stuff == nil)
-- Codex Arcanum
is_codexArcanum = not (SMODS.INIT.CodexArcanum == nil)
-- Bunco
is_bunco = not (SMODS.INIT.Bunco == nil)

local config = {
    j_f_big_loser = true,
    j_f_tightrope = true,
    j_f_published_study = true,
    j_f_commercial_chemist = true,
    j_f_monday_menace = true,
    j_f_typography = true,
    j_f_party_animal = true,
    j_f_fishclown = true,
    j_f_electric_chair = true,
    j_f_original_character = true,
}


local function init_joker(joker, no_sprite)
    no_sprite = no_sprite or false

    local joker = SMODS.Joker:new(
        joker.ability_name,
        joker.slug,
        joker.ability,
        { x = 0, y = 0 },
        joker.loc,
        joker.rarity,
        joker.cost,
        joker.unlocked,
        joker.discovered,
        joker.blueprint_compat,
        joker.eternal_compat,
        joker.effect,
        joker.atlas,
        joker.soul_pos
    )
    joker:register()
    if not no_sprite then
        local sprite = SMODS.Sprite:new(
            joker.slug,
            SMODS.findModByID("Jestobiology").path,
            joker.slug .. ".png",
            71,
            95,
            "asset_atli"
        )
        sprite:register()
    end
end

function SMODS.INIT.Jestobiology()

    -- Big Loser
    if config.j_f_big_loser and is_jankJonklers then
        -- Create Joker
        local big_loser = {
            loc = {
                name = "Big Loser",
                text = {
                    "Gain {C:attention}$4{} and {X:mult,C:white}X3{} Mult if",
                    "{C:attention}poker hand{} is a {C:attention}#1#{},",
                    "poker hand changes on",
                    "every matching hand",
                    "{s:0.7}(Impractical Joker + To-Do List){}"
                }
            },
            ability_name = "Big Loser",
            slug = "f_big_loser",
            ability = {
                extra = { 
                    x_mult = 3,
                    dollars = 4,
                    poker_hand = "High Card", }
            },
            rarity = 5,
            cost = 10,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true
        }
        -- Initialize Joker
        init_joker(big_loser)
        -- Set local variables
        function SMODS.Jokers.j_f_big_loser.loc_def(card)
            return { card.ability.extra.poker_hand }
        end
        -- Calculate
        SMODS.Jokers.j_f_big_loser.calculate = function(self, context)
            if context.joker_main and context.cardarea == G.jokers then
                if context.scoring_name == self.ability.extra.poker_hand then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local _poker_hands = {}
                            for k, v in pairs(G.GAME.hands) do
                                if v.visible and k ~= self.ability.to_do_poker_hand then _poker_hands[#_poker_hands+1] = k end
                            end
                            self.ability.extra.poker_hand = pseudorandom_element(_poker_hands, pseudoseed('to_do'))
                            return true
                        end
                    }))
                    ease_dollars(self.ability.extra.dollars) 
                    return {
                        message = localize { type = 'variable', key = 'a_xmult', vars = { self.ability.extra.x_mult } },
                        Xmult_mod = self.ability.extra.x_mult
                    }
                end
            end
        end
    end

    -- Tightrope
    if config.j_f_tightrope and is_jankJonklers then
        -- Create Joker
        local tightrope = {
            loc = {
                name = "Tight Rope",
                text = {
                    "{X:red,C:white} X#1# {} Mult on {C:attention}final hand{}",
                    "of round. This Joker gains",
                    "{X:red,C:white} X0.75{} Mult when {C:attention}final{}",
                    "{C:attention}hand{} is played",
                    "{s:0.7}(Acrobat + Chalk Outline){}"
                }
            },
            ability_name = "Tight Rope",
            slug = "f_tightrope",
            ability = {
                extra = {
                    x_mult = 3,
                }
            },
            rarity = 5,
            cost = 10,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true
        }
        -- Initialize Joker
        init_joker(tightrope)
        -- Set local variables
        function SMODS.Jokers.j_f_tightrope.loc_def(card)
            return { card.ability.extra.x_mult }
        end
        -- Calculate
        SMODS.Jokers.j_f_tightrope.calculate = function(self, context)
            if context.joker_main and context.cardarea == G.jokers then
                if G.GAME.current_round.hands_left == 0 then
                    self.ability.extra.x_mult = self.ability.extra.x_mult + 0.75
                    G.E_MANAGER:add_event(Event({
                        func = function() card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')}); return true
                        end}))
                    return {
                        message = localize { type = 'variable', key = 'a_xmult', vars = { self.ability.extra.x_mult } },
                        Xmult_mod = self.ability.extra.x_mult
                    }
                end
            end
        end
    end

-- Commercial Chemist
    if config.j_f_commercial_chemist and is_codexArcanum and is_jankJonklers then
        -- Create Joker
        local commercial_chemist = {
            loc = {
                name = "Commercial Chemist",
                text = {
                    "{C:green}#1# in #2#{} chance to create",
                    "an {C:alchemical}Alchemical{} card when you",
                    "{C:attention}sell{} a non-{C:alchemical}Alchemical{} card",
                    "{s:0.7}(Studious Joker + Pawn Joker){}"
                }
            },
            ability_name = "Commercial Chemist",
            slug = "f_commercial_chemist",
            ability = {
                extra = {
                    odds = 2,
                    dollars = 3
                }
            },
            rarity = 5,
            cost = 8,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true
        }
        -- Initialize Joker
        init_joker(commercial_chemist)
        -- Set local variables
        function SMODS.Jokers.j_f_commercial_chemist.loc_def(card)
            return { G.GAME.probabilities.normal, card.ability.extra.odds}
        end
        -- Calculate
        SMODS.Jokers.j_f_commercial_chemist.calculate = function(self, context)
            if context.selling_card and context.card.ability.set ~= 'Alchemical' then
                if pseudorandom('heisenberg') < G.GAME.probabilities.normal / self.ability.extra.odds then
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        add_random_alchemical(self)
                        card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize('p_plus_alchemical'), colour = G.C.SECONDARY_SET.Alchemy})
                    end
                end
            end
        end
    end

    -- Published Study
    if config.j_f_published_study and is_codexArcanum then
        -- Create Joker
        local published_study = {
            loc = {
                name = "Published Study",
                text = {
                    "Create an {C:alchemical}Alchemical{} card when {C:attention}Blind{} is selected.",
                    "Create a {C:dark_edition}Negative{} {C:tarot}Tarot{} card after using",
                    "your first {C:alchemical}Alchemical{} card each round",
                    "{C:inactive,s:0.7}(Must have room){}",
                    "{s:0.7}(Cartomancer + Chain Reaction){}"
                }
            },
            ability_name = "Published Study",
            slug = "f_published_study",
            ability = {
                extra = {
                    used = false,
                }
            },
            rarity = 5,
            cost = 10,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true
        }
        -- Initialize Joker
        init_joker(published_study)
        -- Set local variables
        function SMODS.Jokers.j_f_published_study.loc_def(card)
            return { card.ability.extra.used }
        end
        -- Calculate
        SMODS.Jokers.j_f_published_study.calculate = function(self, context)
            if context.setting_blind and not self.getting_sliced then
                self.ability.extra.used = false
                if not context.blueprint and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    add_random_alchemical(self)
                    card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize('p_plus_alchemical'), colour = G.C.SECONDARY_SET.Alchemy})
                end
            end
            if context.using_consumeable and not context.consumeable.config.in_booster then
                if context.consumeable.ability.set == 'Alchemical' and self.ability.extra.used == false then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            G.E_MANAGER:add_event(Event({
                                func = function() 
                                    local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'car')
                                    card:set_edition({negative = true})
                                    card:add_to_deck()
                                    G.consumeables:emplace(card)
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end}))   
                                card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})                       
                            return true
                        end)}))
                    self.ability.extra.used = true
                end
            end
        end
    end


    -- Monday Menace
    if config.j_f_monday_menace and is_moreFluff and is_jankJonklers then
        -- Create Joker
        local monday_menace = {
            loc = {
                name = "Monday Menace",
                text = {
                    "{C:dark_edition}+1{} Joker Slot",
                    "Create a random {C:planet}Planet{} or {C:tarot}Tarot{}",
                    "card per 2 {C:attention}rerolls{} in the shop",
                    "{C:inactive,s:0.7}({C:green,s:0.7}#1#{}{C:inactive,s:0.7} rerolls left){}",
                    "{C:inactive,s:0.7}(Must have room){}",
                    "{s:0.7}(Sunday Funnies + Philosophical Joker){}",
                }
            },
            ability_name = "Monday Menace",
            slug = "f_monday_menace",
            ability = {
                extra = {
                    counter = 2
                }
            },
            rarity = 5,
            cost = 16,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true
        }
        -- Initialize Joker
        init_joker(monday_menace)
        -- Set local variables
        function SMODS.Jokers.j_f_monday_menace.loc_def(card)
            return { card.ability.extra.counter }
        end
        -- Calculate
        SMODS.Jokers.j_f_monday_menace.calculate = function(self, context)
            if context.reroll_shop and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                if self.ability.extra.counter == 1 then
                    local tarot_or_planet = pseudorandom_element({1, 2}, pseudoseed('monday_menace'))
                    if tarot_or_planet == 1 then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = (function()
                                G.E_MANAGER:add_event(Event({
                                    func = function() 
                                        local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'car')
                                        card:add_to_deck()
                                        G.consumeables:emplace(card)
                                        G.GAME.consumeable_buffer = 0
                                        return true
                                    end}))   
                                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})                       
                                return true
                            end)}))
                    end
                    if tarot_or_planet == 2 then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = (function()
                                G.E_MANAGER:add_event(Event({
                                    func = function() 
                                        local card = create_card('Planet',G.consumeables, nil, nil, nil, nil, nil, '8ba')
                                        card:add_to_deck()
                                        G.consumeables:emplace(card)
                                        G.GAME.consumeable_buffer = 0
                                        return true
                                    end}))   
                                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet})                       
                                return true
                            end)}))
                    end
                    self.ability.extra.counter = 2
                else
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                        play_sound('tarot1')
                        self:juice_up(0.3, 0.5)
                        return true end }))
                    self.ability.extra.counter = self.ability.extra.counter - 1
                end
            end
        end
    end


    -- Typography Joker
    if config.j_f_typography and is_moreFluff and is_jankJonklers then
        -- Create Joker
        local typography = {
            loc = {
                name = "Typography Joker",
                text = {
                    "Other {C:blue}Common{} and {C:attention}Fusion{} Jokers",
                    "each give {C:mult}+10{} Mult if played hand",
                    "contains no {C:attention}face cards{}",
                    "{s:0.7}(Minimalist Joker + Simplified Joker){}"
                }
            },
            ability_name = "Typography Joker",
            slug = "f_typography",
            ability = {
                extra = {
                    mult = 10
                }
            },
            rarity = 5,
            cost = 8,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true
        }
        -- Initialize Joker
        init_joker(typography)
        -- Set local variables
        function SMODS.Jokers.j_f_typography.loc_def(card)
            return { card.ability.extra.mult }
        end
        -- Calculate
        SMODS.Jokers.j_f_typography.calculate = function(self, context)
            if context.other_joker and (context.other_joker.config.center.rarity == 1 or context.other_joker.config.center.rarity == 5) and self ~= context.other_joker then
                local CheckForFaces = true
                for k, v in ipairs(context.full_hand) do
                    CheckForFaces = CheckForFaces and not v:is_face()
                end
                if not CheckForFaces then
                    return nil
                end
                G.E_MANAGER:add_event(Event({
                    func = function()
                        context.other_joker:juice_up(0.5, 0.5)
                        return true
                    end
                })) 
                return {
                    message = localize{type='variable',key='a_mult',vars={self.ability.extra.mult}},
                    mult_mod = self.ability.extra.mult
                }
            end
        end
    end

    -- Party Animal
    if config.j_f_party_animal and is_bunco and is_jankJonklers then
        -- Create Joker
        local party_animal = {
            loc = {
                name = "Party Animal",
                text = {
                    "This Joker gains {C:chips}+16{} Chips",
                    "when played hand is a",
                    "{C:attention}High Card{} or {C:attention}Pair{}",
                    "{C:inactive,s:0.7}(Currently {}{C:chips,s:0.7}+#1#{}{C:inactive,s:0.7} Chips){}",
                    "{s:0.7}(Pitiful Joker + Shepherd Joker)"
                }
            },
            ability_name = "Party Animal",
            slug = "f_party_animal",
            ability = {
                extra = {
                    chips = 0
                }
            },
            rarity = 5,
            cost = 8,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true
        }
        -- Initialize Joker
        init_joker(party_animal)
        -- Set local variables
        function SMODS.Jokers.j_f_party_animal.loc_def(card)
            return { card.ability.extra.chips }
        end
        -- Calculate
        SMODS.Jokers.j_f_party_animal.calculate = function(self, context)
            if context.joker_main and context.cardarea == G.jokers then
                if (context.scoring_name == "High Card" or context.scoring_name == "Pair") then
                    self.ability.extra.chips = self.ability.extra.chips + 16
                    G.E_MANAGER:add_event(Event({
                        func = function() card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')}); return true
                        end}))
                end
                return {
                    message = localize{type='variable',key='a_chips',vars={self.ability.extra.chips}},
                    chip_mod = self.ability.extra.chips,
                    colour = G.C.CHIPS
                }
            end
        end
    end

    -- Fishclown
    if config.j_f_fishclown and is_jankJonklers and is_moreFluff then
        -- Create Joker
        local fishclown = {
            loc = {
                name = "Fishclown",
                text = {
                    "{C:attention}Enhanced Cards{} gives",
                    "{X:mult,C:white}X1.5{} Mult when scored",
                    "{s:0.7}(Expanded Art Joker + Clownfish){}"
                }
            },
            ability_name = "Fishclown",
            slug = "f_fishclown",
            ability = {
                extra = {
                    x_mult = 1.5
                }
            },
            rarity = 5,
            cost = 8,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true
        }
        -- Initialize Joker
        init_joker(fishclown)
        -- Set local variables
        function SMODS.Jokers.j_f_fishclown.loc_def(card)
            return { card.ability.extra.x_mult }
        end
        -- Calculate
        SMODS.Jokers.j_f_fishclown.calculate = function(self, context)
            if context.individual and context.cardarea == G.play and context.other_card.ability.set == 'Enhanced' then
                return {
                    message = localize { type = 'variable', key = 'a_xmult', vars = { self.ability.extra.x_mult } },
                    Xmult_mod = self.ability.extra.x_mult,
                    card = self
                }
            end
        end
    end

    
    -- Electric Chair
    if config.j_f_electric_chair and is_codexArcanum then
        -- Create Joker
        local electric_chair = {
            loc = {
                name = "Electric Chair",
                text = {
                    "{C:green}#1# in #2#{} chance to get an",
                    "{C:alchemical}Alchemical{} card when you discard",
                    "an {C:attention}Enhanced{} or {C:attention}face{} card",
                    "{C:inactive}(Must have room){}",
                    "{s:0.7}(Faceless Joker + Shock Humor){}"
                }
            },
            ability_name = "Electric Chair",
            slug = "f_electric_chair",
            ability = {
                extra = {
                    odds = 3
                }
            },
            rarity = 5,
            cost = 10,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true
        }
        -- Initialize Joker
        init_joker(electric_chair)
        -- Set local variables
        function SMODS.Jokers.j_f_electric_chair.loc_def(card)
            return {''..(G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds}
        end
        -- Calculate
        SMODS.Jokers.j_f_electric_chair.calculate = function(self, context)
            if context.discard and not context.other_card.debuff then
                if (context.other_card.ability.set == 'Enhanced' or context.other_card:is_face()) then
                    if pseudorandom('electric_chair') < G.GAME.probabilities.normal/card.ability.extra.odds then
                        add_random_alchemical(card)
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('p_plus_alchemical'), colour = G.C.SECONDARY_SET.Alchemy})
                    end
                end
            end
        end
    end


    -- Original Character
    if config.j_f_original_character and is_mystJokers then
        -- Create Joker
        local original_character = {
            loc = {
                name = "Original Character",
                text = {
                    "{C:dark_edition}+1{} Joker Slot",
                    "{C:mult}+12{} Mult for each",
                    "empty {C:attention}Joker{} slot",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
                    "{s:0.7}(Joker Stencil + Autism Creature){}"
                }
            },
            ability_name = "Original Character",
            slug = "f_original_character",
            ability = {
                extra = {
                    mult = 0
                }
            },
            rarity = 5,
            cost = 10,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true
        }
        -- Initialize Joker
        init_joker(original_character)
        -- Set local variables
        function SMODS.Jokers.j_f_original_character.loc_def(card)
            return { card.ability.extra.mult }
        end
        -- Calculate
        SMODS.Jokers.j_f_original_character.calculate = function(self, context)
            if context.joker_main and context.cardarea == G.jokers and self.ability.extra.mult >= 0 then
                return {
                    message = localize { type = 'variable', key = 'a_mult', vars = { self.ability.extra } },
                    mult_mod = self.ability.extra,
                }
            end
        end
    end


    -- register fusions
    if is_codexArcanum then
        FusionJokers.fusions:add_fusion("j_cartomancer", nil, false, "j_chain_reaction", nil, false, "j_f_published_study", 10)
        FusionJokers.fusions:add_fusion("j_shock_humor", nil, false, "j_faceless", nil, false, "j_f_electric_chair", 10)
    end
    if is_jankJonklers then
        FusionJokers.fusions:add_fusion("j_todo_list", nil, false, "j_impractical", nil, false, "j_f_big_loser", 10)
        FusionJokers.fusions:add_fusion("j_acrobat", nil, false, "j_chalk_outline", nil, false, "j_f_tightrope", 10)
    end
    if is_codexArcanum and is_jankJonklers then
        FusionJokers.fusions:add_fusion("j_studious_joker", nil, false, "j_pawn", nil, false, "j_f_commercial_chemist", 8)
    end
    if is_jankJonklers and is_moreFluff then
        FusionJokers.fusions:add_fusion("j_sunday_funnies", nil, false, "j_mf_pipe", nil, false, "j_f_monday_menace", 16)
        FusionJokers.fusions:add_fusion("j_mf_simplified", nil, false, "j_minimalist", nil, false, "j_f_typography", 8)
        FusionJokers.fusions:add_fusion("j_expanded_art", nil, false, "j_mf_clownfish", nil, false, "j_f_fishclown", 8)
    end
    if is_bunco and is_jankJonklers then
        FusionJokers.fusions:add_fusion("j_shepherd", "chips", false, "j_pitiful", nil, false, "j_f_party_animal", 8)
    end
    if is_mystJokers then
        FusionJokers.fusions:add_fusion("j_stencil", nil, false, "j_autism_creature", nil, false, "j_f_original_character", 18)
    end
end


--injections

local Card_add_to_deck_ref = Card.add_to_deck 
function Card.add_to_deck(self, from_debuff)
    if not self.added_to_deck then
        if self.ability.name == "Monday Menace" then
            if G.jokers then 
                G.jokers.config.card_limit = G.jokers.config.card_limit + 1
            end
        end
        if self.ability.name == "Original Character" then
            if G.jokers then 
                G.jokers.config.card_limit = G.jokers.config.card_limit + 1
            end
        end
    end
    Card_add_to_deck_ref(self, from_debuff)
end

local Card_remove_from_deck_ref = Card.remove_from_deck 
function Card.remove_from_deck(self, from_debuff)
    if self.added_to_deck then
        if self.ability.name == "Monday Menace" then
            if G.jokers then 
                G.jokers.config.card_limit = G.jokers.config.card_limit - 1
            end
        end
        if self.ability.name == "Original Character" then
            if G.jokers then 
                G.jokers.config.card_limit = G.jokers.config.card_limit - 1
            end
        end
    end
    Card_remove_from_deck_ref(self, from_debuff)
end

-- Card updates
local card_updateref = Card.update
function Card.update(self, dt)
    if G.STAGE == G.STAGES.RUN then
        if self.config.center.key == "j_f_original_character" then
            self.ability.extra.mult = (G.jokers.config.card_limit - #G.jokers.cards) * 12
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].ability.name == 'Joker Stencil' then self.ability.extra = self.ability.extra + 6 end
            end
        end
    end
    card_updateref(self, dt)
end
----------------------------------------------
------------MOD CODE END----------------------