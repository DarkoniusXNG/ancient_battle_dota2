
ENABLE_HERO_RESPAWN = true              -- Should the heroes automatically respawn on a timer or stay dead until manually respawned
UNIVERSAL_SHOP_MODE = false             -- Should the main shop contain Secret Shop items as well as regular items
ALLOW_SAME_HERO_SELECTION = false       -- Should we let people select the same hero as each other

CUSTOM_GAME_SETUP_TIME = 20.0           -- How long should custom game setup last?
HERO_SELECTION_TIME = 60.0              -- How long should we let people select their hero? Should be at least 5 seconds.
HERO_SELECTION_PENALTY_TIME = 30.0      -- How long should the penalty time for not picking a hero last? During this time player loses gold.
BANNING_PHASE_TIME = 20.0               -- How long should the banning phase last? This will work only if "EnablePickRules" is "1" in 'addoninfo.txt'
STRATEGY_TIME = 15.0                    -- How long should strategy time last? !!! You can buy items during strategy time and gold will not be spent!
SHOWCASE_TIME = 12.0                    -- How long should show case time be?
PRE_GAME_TIME = 90.0                    -- How long after loading heroes into the map should the horn blow and the game start?
POST_GAME_TIME = 60.0                   -- How long should we let people look at the scoreboard before closing the server automatically?
TREE_REGROW_TIME = 60.0                 -- How long should it take individual trees to respawn after being cut down/destroyed?

GOLD_PER_TICK = 1                       -- How much gold should players get per tick?
GOLD_TICK_TIME = 0.7                    -- How long should we wait in seconds between gold ticks?
NORMAL_START_GOLD = 600                 -- Starting Gold if picked normally

RECOMMENDED_BUILDS_DISABLED = false     -- Should we disable the recommended builds for heroes
CAMERA_DISTANCE_OVERRIDE = 1134.0       -- How far out should we allow the camera to go?  1134 is the default in Dota

CUSTOM_BUYBACK_COST_ENABLED = false     -- Should we use a custom buyback cost setting?
CUSTOM_BUYBACK_COOLDOWN_ENABLED = false -- Should we use a custom buyback time?
BUYBACK_ENABLED = true                 	-- Should we allow people to buyback when they die?
BUYBACK_COOLDOWN_TIME = 360.0

DISABLE_FOG_OF_WAR_ENTIRELY = false     -- Should we disable fog of war entirely for both teams?
USE_UNSEEN_FOG_OF_WAR = false           -- Should we make unseen and fogged areas of the map completely black until uncovered by each team? 
-- Note: DISABLE_FOG_OF_WAR_ENTIRELY must be false for USE_UNSEEN_FOG_OF_WAR to work
USE_STANDARD_DOTA_BOT_THINKING = false  -- Should we have bots act like they would in Dota? (This requires 3 lanes, normal items, etc)

USE_CUSTOM_HERO_GOLD_BOUNTY = true      -- Should the gold for hero kills be modified (true) or same as in default Dota (false)?
HERO_KILL_GOLD_BASE = 110               -- Hero gold bounty base value
HERO_KILL_GOLD_PER_LEVEL = 10           -- Hero gold bounty increase per level
HERO_KILL_GOLD_PER_STREAK = 60          -- Hero gold bounty per his streak (Killing Spree: +HERO_KILL_GOLD_PER_STREAK gold; Ultrakill: +2xHERO_KILL_GOLD_PER_STREAK gold ...)

USE_CUSTOM_HERO_LEVELS = false          -- Should the heroes give a custom amount of XP when killed?

USE_CUSTOM_TOP_BAR_VALUES = true        -- Should we do customized top bar values or use the default kill count per team?
TOP_BAR_VISIBLE = true                  -- Should we display the top bar score/count at all?
SHOW_KILLS_ON_TOPBAR = true             -- Should we display kills only on the top bar? (No denies, suicides, kills by neutrals)  Requires USE_CUSTOM_TOP_BAR_VALUES

ENABLE_TOWER_BACKDOOR_PROTECTION = true -- Should we enable backdoor protection for our towers?
DISABLE_GOLD_SOUNDS = false             -- Should we disable the gold sound when players get gold?

END_GAME_ON_KILLS = false               -- Should the game end after a certain number of kills?

USE_CUSTOM_XP_VALUES = true             -- Should we use custom XP values to level up heroes, or the default Dota numbers?
MAX_LEVEL = 35                          -- What level should we let heroes get to?
-- NOTE: MAX_LEVEL and XP_PER_LEVEL_TABLE will not work if USE_CUSTOM_XP_VALUES is false or nil.

-- Fill this table up with the required XP per level if you want to change it
XP_PER_LEVEL_TABLE = {}
XP_PER_LEVEL_TABLE[1] = 0
XP_PER_LEVEL_TABLE[2] = 200
XP_PER_LEVEL_TABLE[3] = 600
XP_PER_LEVEL_TABLE[4] = 1000
XP_PER_LEVEL_TABLE[5] = 1600
XP_PER_LEVEL_TABLE[6] = 2200
XP_PER_LEVEL_TABLE[7] = 2600
XP_PER_LEVEL_TABLE[8] = 3100
XP_PER_LEVEL_TABLE[9] = 3800
XP_PER_LEVEL_TABLE[10] = 4500
XP_PER_LEVEL_TABLE[11] = 5100
XP_PER_LEVEL_TABLE[12] = 6000
XP_PER_LEVEL_TABLE[13] = 7000
XP_PER_LEVEL_TABLE[14] = 8100
XP_PER_LEVEL_TABLE[15] = 9200
XP_PER_LEVEL_TABLE[16] = 9400
XP_PER_LEVEL_TABLE[17] = 9800
XP_PER_LEVEL_TABLE[18] = 11000
XP_PER_LEVEL_TABLE[19] = 12400
XP_PER_LEVEL_TABLE[20] = 13900
XP_PER_LEVEL_TABLE[21] = 15400
XP_PER_LEVEL_TABLE[22] = 16150
XP_PER_LEVEL_TABLE[23] = 18150
XP_PER_LEVEL_TABLE[24] = 20400
XP_PER_LEVEL_TABLE[25] = 22000
for i = 26, MAX_LEVEL do
  XP_PER_LEVEL_TABLE[i] = XP_PER_LEVEL_TABLE[i-1] + i*100
end

ENABLE_FIRST_BLOOD = true               -- Should we enable first blood for the first kill in this game?
HIDE_KILL_BANNERS = false               -- Should we hide the kill banners that show when a player is killed?
LOSE_GOLD_ON_DEATH = false              -- Should we have players lose the normal amount of dota gold on death?
SHOW_ONLY_PLAYER_INVENTORY = false      -- Should we only allow players to see their own inventory even when selecting other units?
DISABLE_STASH_PURCHASING = false        -- Should we prevent players from being able to buy items into their stash when not at a shop?
DISABLE_ANNOUNCER = false               -- Should we disable the announcer from working in the game?
FORCE_PICKED_HERO = nil                 -- What hero should we force all players to spawn as? (e.g. "npc_dota_hero_axe").  Use nil to allow players to pick their own hero.

FIXED_RESPAWN_TIME = -1                 -- What time should we use for a fixed respawn timer?  Use -1 to keep the default dota behavior.
MAX_RESPAWN_TIME = 40.0					-- Default Dota doesn't have a limit. Fast game modes have 20.0 seconds
USE_CUSTOM_RESPAWN_TIMES = true			-- Should we use custom respawn times?

-- Fill this table with respawn times on each level if USE_CUSTOM_RESPAWN_TIMES is true.
CUSTOM_RESPAWN_TIME = {}
CUSTOM_RESPAWN_TIME[1] = 5
CUSTOM_RESPAWN_TIME[2] = 7
CUSTOM_RESPAWN_TIME[3] = 9
CUSTOM_RESPAWN_TIME[4] = 13
CUSTOM_RESPAWN_TIME[5] = 16
CUSTOM_RESPAWN_TIME[6] = 26
CUSTOM_RESPAWN_TIME[7] = 28
CUSTOM_RESPAWN_TIME[8] = 30
CUSTOM_RESPAWN_TIME[9] = 32
CUSTOM_RESPAWN_TIME[10] = 34
CUSTOM_RESPAWN_TIME[11] = 36
CUSTOM_RESPAWN_TIME[12] = 44
CUSTOM_RESPAWN_TIME[13] = 46
CUSTOM_RESPAWN_TIME[14] = 48
CUSTOM_RESPAWN_TIME[15] = 50
CUSTOM_RESPAWN_TIME[16] = 52
CUSTOM_RESPAWN_TIME[17] = 54
CUSTOM_RESPAWN_TIME[18] = 65
CUSTOM_RESPAWN_TIME[19] = 70
CUSTOM_RESPAWN_TIME[20] = 75
CUSTOM_RESPAWN_TIME[21] = 80
CUSTOM_RESPAWN_TIME[22] = 85
CUSTOM_RESPAWN_TIME[23] = 90
CUSTOM_RESPAWN_TIME[24] = 95
CUSTOM_RESPAWN_TIME[25] = 100

if MAX_LEVEL > 25 then
	for i = 26, MAX_LEVEL do
		CUSTOM_RESPAWN_TIME[i] = CUSTOM_RESPAWN_TIME[i-1] + 5
	end
end

FOUNTAIN_CONSTANT_MANA_REGEN = -1       -- What should we use for the constant fountain mana regen?  Use -1 to keep the default dota behavior.
FOUNTAIN_PERCENTAGE_MANA_REGEN = -1     -- What should we use for the percentage fountain mana regen?  Use -1 to keep the default dota behavior.
FOUNTAIN_PERCENTAGE_HEALTH_REGEN = -1   -- What should we use for the percentage fountain health regen?  Use -1 to keep the default dota behavior.
MAXIMUM_ATTACK_SPEED = 800              -- What should we use for the maximum attack speed?
MINIMUM_ATTACK_SPEED = 10               -- What should we use for the minimum attack speed?

DISABLE_DAY_NIGHT_CYCLE = false         -- Should we disable the day night cycle from naturally occurring? (Manual adjustment still possible)
DISABLE_KILLING_SPREE_ANNOUNCER = false -- Shuold we disable the killing spree announcer?
DISABLE_STICKY_ITEM = false             -- Should we disable the sticky item button in the quick buy area?
CUSTOM_GLYPH_COOLDOWN = 300
CUSTOM_SCAN_COOLDOWN = 210

USE_DEFAULT_RUNE_SYSTEM = true			-- Use default dota rune spawn timings and the same runes as dota have?
BOUNTY_RUNE_SPAWN_INTERVAL = 300		-- How long in seconds should we wait between bounty rune spawns? BUGGED! WORKS FOR POWERUPS TOO!
POWER_RUNE_SPAWN_INTERVAL = 120			-- How long in seconds should we wait between power-up runes spawns? BUGGED! WORKS FOR BOUNTIES TOO!

ENABLED_RUNES = {}                      -- Which runes should be enabled to spawn in our game mode?
ENABLED_RUNES[DOTA_RUNE_DOUBLEDAMAGE] = true
ENABLED_RUNES[DOTA_RUNE_HASTE] = true
ENABLED_RUNES[DOTA_RUNE_ILLUSION] = true
ENABLED_RUNES[DOTA_RUNE_INVISIBILITY] = true
ENABLED_RUNES[DOTA_RUNE_REGENERATION] = true
ENABLED_RUNES[DOTA_RUNE_BOUNTY] = false
ENABLED_RUNES[DOTA_RUNE_ARCANE] = true	-- BUGGED! NEVER SPAWNS!

MAX_NUMBER_OF_TEAMS = 2                			-- How many potential teams can be in this game mode?
USE_CUSTOM_TEAM_COLORS = false          		-- Should we use custom team colors?
USE_CUSTOM_TEAM_COLORS_FOR_PLAYERS = false      -- Should we use custom team colors to color the players/minimap?

TEAM_COLORS = {}                        -- If USE_CUSTOM_TEAM_COLORS is set, use these colors.
TEAM_COLORS[DOTA_TEAM_GOODGUYS] = { 0, 255, 0 }  	--    Teal  61, 210, 150
TEAM_COLORS[DOTA_TEAM_BADGUYS]  = { 255, 0, 0 }   	--    Yellow 243, 201, 9
TEAM_COLORS[DOTA_TEAM_CUSTOM_1] = { 197, 77, 168 }  --    Pink
TEAM_COLORS[DOTA_TEAM_CUSTOM_2] = { 255, 108, 0 }   --    Orange
TEAM_COLORS[DOTA_TEAM_CUSTOM_3] = { 52, 85, 255 }   --    Blue
TEAM_COLORS[DOTA_TEAM_CUSTOM_4] = { 101, 212, 19 }  --    Green
TEAM_COLORS[DOTA_TEAM_CUSTOM_5] = { 129, 83, 54 }   --    Brown
TEAM_COLORS[DOTA_TEAM_CUSTOM_6] = { 27, 192, 216 }  --    Cyan
TEAM_COLORS[DOTA_TEAM_CUSTOM_7] = { 199, 228, 13 }  --    Olive
TEAM_COLORS[DOTA_TEAM_CUSTOM_8] = { 140, 42, 244 }  --    Purple

USE_AUTOMATIC_PLAYERS_PER_TEAM = true  -- Should we set the number of players to 10 / MAX_NUMBER_OF_TEAMS?

CUSTOM_TEAM_PLAYER_COUNT = {}	-- If we're not automatically setting the number of players per team, use this table

DEFAULT_DOTA_COURIER = true

if GetMapName() == "two_vs_two" then
	UNIVERSAL_SHOP_MODE = true
	ALLOW_SAME_HERO_SELECTION = true
	STRATEGY_TIME = 0.0
	PRE_GAME_TIME = 30.0
	POST_GAME_TIME = 30.0
	GOLD_PER_TICK = 6
	END_GAME_ON_KILLS = true
	KILLS_TO_END_GAME_FOR_TEAM = 20			-- How many kills for a team should signify an end of game?
	LOSE_GOLD_ON_DEATH = false
	USE_AUTOMATIC_PLAYERS_PER_TEAM = false 	-- Should we set the number of players to 10 / MAX_NUMBER_OF_TEAMS?
	CUSTOM_BUYBACK_COOLDOWN_ENABLED = true	-- Should we use a custom buyback time?
	BUYBACK_COOLDOWN_TIME = 0.0
	MAX_RESPAWN_TIME = 15.0
	FOUNTAIN_CONSTANT_MANA_REGEN = 1
	FOUNTAIN_PERCENTAGE_MANA_REGEN = 1
	FOUNTAIN_PERCENTAGE_HEALTH_REGEN = 1
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_GOODGUYS] = 2
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_BADGUYS]  = 2
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_1] = 0
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_2] = 0
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_3] = 0
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_4] = 0
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_5] = 0
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_6] = 0
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_7] = 0
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_8] = 0
	CUSTOM_GLYPH_COOLDOWN = 300
	CUSTOM_SCAN_COOLDOWN = 60
	DEFAULT_DOTA_COURIER = false
end

if GetMapName() == "holdout" then
	UNIVERSAL_SHOP_MODE = true
	STRATEGY_TIME = 0.0
	SHOWCASE_TIME = 0.0
	PRE_GAME_TIME = 60.0
	POST_GAME_TIME = 30.0
	GOLD_PER_TICK = 1
	GOLD_TICK_TIME = 0.7
	NORMAL_START_GOLD = 800
	ENABLE_TOWER_BACKDOOR_PROTECTION = false
	LOSE_GOLD_ON_DEATH = false
	USE_AUTOMATIC_PLAYERS_PER_TEAM = false
	CUSTOM_BUYBACK_COOLDOWN_ENABLED = true
	BUYBACK_COOLDOWN_TIME = 0.0
	MAX_RESPAWN_TIME = 15.0
	FOUNTAIN_CONSTANT_MANA_REGEN = 1
	FOUNTAIN_PERCENTAGE_MANA_REGEN = 1
	FOUNTAIN_PERCENTAGE_HEALTH_REGEN = 1
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_GOODGUYS] = 4
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_BADGUYS]  = 0
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_1] = 0
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_2] = 0
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_3] = 0
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_4] = 0
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_5] = 0
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_6] = 0
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_7] = 0
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_8] = 0
	DEFAULT_DOTA_COURIER = false
end

if GetMapName() == "3vs3" then
	UNIVERSAL_SHOP_MODE = true
	ALLOW_SAME_HERO_SELECTION = true
	STRATEGY_TIME = 0.0
	PRE_GAME_TIME = 60.0
	POST_GAME_TIME = 30.0
	GOLD_PER_TICK = 5
	END_GAME_ON_KILLS = true
	KILLS_TO_END_GAME_FOR_TEAM = 30			-- How many kills for a team should signify an end of game?
	LOSE_GOLD_ON_DEATH = false
	USE_AUTOMATIC_PLAYERS_PER_TEAM = false 	-- Should we set the number of players to 10 / MAX_NUMBER_OF_TEAMS?
	CUSTOM_BUYBACK_COOLDOWN_ENABLED = true	-- Should we use a custom buyback time?
	BUYBACK_COOLDOWN_TIME = 0.0
	MAX_RESPAWN_TIME = 30.0
	FOUNTAIN_CONSTANT_MANA_REGEN = 1
	FOUNTAIN_PERCENTAGE_MANA_REGEN = 1
	FOUNTAIN_PERCENTAGE_HEALTH_REGEN = 1
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_GOODGUYS] = 3
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_BADGUYS]  = 3
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_1] = 0
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_2] = 0
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_3] = 0
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_4] = 0
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_5] = 0
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_6] = 0
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_7] = 0
	CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_8] = 0
	CUSTOM_GLYPH_COOLDOWN = 300
	CUSTOM_SCAN_COOLDOWN = 180
	DEFAULT_DOTA_COURIER = false
end
