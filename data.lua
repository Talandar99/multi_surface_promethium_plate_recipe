local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_effects = require("__space-age__.prototypes.item-effects")
local item_tints = require("__base__.prototypes.item-tints")
local item_sounds = require("__base__.prototypes.item_sounds")
local sounds = require("__base__.prototypes.entity.sounds")
data:extend({
	{
		type = "item",
		name = "msppr-promethium-plate",
		icon = "__space-age__/graphics/icons/promethium-asteroid-chunk.png",
		subgroup = "space-material",
		order = "d[promethium]-e[chunk]",
		inventory_move_sound = item_sounds.sulfur_inventory_move,
		pick_sound = item_sounds.resource_inventory_pickup,
		drop_sound = item_sounds.sulfur_inventory_move,
		stack_size = 1,
		weight = 100 * kg,
		random_tint_color = item_tints.ice_blue,
	},
	{
		type = "item",
		name = "msppr-input-placeholder",
		icon = "__space-age__/graphics/icons/promethium-asteroid-chunk.png",
		subgroup = "space-material",
		order = "d[promethium]-e[chunk]",
		inventory_move_sound = item_sounds.sulfur_inventory_move,
		pick_sound = item_sounds.resource_inventory_pickup,
		drop_sound = item_sounds.sulfur_inventory_move,
		stack_size = 1,
		weight = 100 * kg,
		random_tint_color = item_tints.ice_blue,
	},
	{
		type = "item",
		name = "nauvis-irradiated-promethium",
		icon = "__space-age__/graphics/icons/promethium-asteroid-chunk.png",
		subgroup = "space-material",
		order = "d[promethium]-e[chunk]",
		inventory_move_sound = item_sounds.sulfur_inventory_move,
		pick_sound = item_sounds.resource_inventory_pickup,
		drop_sound = item_sounds.sulfur_inventory_move,
		stack_size = 1,
		weight = 100 * kg,
		random_tint_color = item_tints.ice_blue,
	},
	{
		type = "recipe",
		name = "msppr-recipe-nauvis",
		subgroup = "science-pack",
		category = "centrifuging",
		surface_conditions = {
			{
				property = "pressure",
				min = 1000,
				max = 1000,
			},
		},
		enabled = false,
		ingredients = {
			{ type = "item", name = "msppr-input-placeholder", amount = 1 },
			{ type = "item", name = "uranium-235", amount = 1 },
			{ type = "item", name = "biter-egg", amount = 1 },
		},
		energy_required = 10,
		results = {
			{ type = "item", name = "nauvis-irradiated-promethium", amount = 1 },
		},
		allow_productivity = true,
	},
	{
		type = "item",
		name = "gleba-bioinfused-promethium",
		icon = "__space-age__/graphics/icons/promethium-asteroid-chunk.png",
		subgroup = "space-material",
		order = "d[promethium]-e[chunk]",
		inventory_move_sound = item_sounds.sulfur_inventory_move,
		pick_sound = item_sounds.resource_inventory_pickup,
		drop_sound = item_sounds.sulfur_inventory_move,
		stack_size = 1,
		weight = 100 * kg,
		random_tint_color = item_tints.ice_blue,
	},
	{
		type = "recipe",
		name = "msppr-recipe-gleba",
		subgroup = "science-pack",
		category = "organic",
		surface_conditions = {
			{
				property = "pressure",
				min = 2000,
				max = 2000,
			},
		},
		enabled = false,
		ingredients = {
			{ type = "item", name = "msppr-input-placeholder", amount = 1 },
			{ type = "item", name = "bioflux", amount = 1 },
			{ type = "item", name = "pentapod-egg", amount = 1 },
			{ type = "item", name = "carbon-fiber", amount = 1 },
		},
		energy_required = 10,
		results = {
			{ type = "item", name = "gleba-bioinfused-promethium", amount = 1 },
		},
		allow_productivity = true,
	},
})
