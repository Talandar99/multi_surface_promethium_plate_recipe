local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_effects = require("__space-age__.prototypes.item-effects")
local item_tints = require("__base__.prototypes.item-tints")
local item_sounds = require("__base__.prototypes.item_sounds")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
	{
		type = "item-subgroup",
		name = "msppr",
		group = "space",
		order = "e",
	},
})
-- vanila planet ingredients
data:extend({
	{
		type = "item",
		name = "msppr-nauvis",
		icon = "__multi_surface_promethium_plate_recipe__/graphics/msppr-nauvis.png",
		subgroup = "msppr",
		order = "d[promethium]-r[nauvis]",
		inventory_move_sound = item_sounds.sulfur_inventory_move,
		pick_sound = item_sounds.resource_inventory_pickup,
		drop_sound = item_sounds.sulfur_inventory_move,
		stack_size = 100,
		weight = 1 * kg,
		random_tint_color = item_tints.ice_blue,
	},
	{
		type = "item",
		name = "msppr-gleba",
		icon = "__multi_surface_promethium_plate_recipe__/graphics/msppr-gleba.png",
		subgroup = "msppr",
		order = "d[promethium]-r[gleba]",
		inventory_move_sound = item_sounds.sulfur_inventory_move,
		pick_sound = item_sounds.resource_inventory_pickup,
		drop_sound = item_sounds.sulfur_inventory_move,
		stack_size = 100,
		weight = 1 * kg,
		random_tint_color = item_tints.ice_blue,
	},
	{
		type = "item",
		name = "msppr-crushed-promethium",
		icon = "__multi_surface_promethium_plate_recipe__/graphics/msppr-crushed-promethium.png",
		subgroup = "msppr",
		order = "d[promethium]-f[crushed]",
		inventory_move_sound = item_sounds.sulfur_inventory_move,
		pick_sound = item_sounds.resource_inventory_pickup,
		drop_sound = item_sounds.sulfur_inventory_move,
		stack_size = 100,
		weight = 1 * kg,
		random_tint_color = item_tints.ice_blue,
	},
	{
		type = "item",
		name = "msppr-fulgora",
		icon = "__multi_surface_promethium_plate_recipe__/graphics/msppr-fulgora.png",
		subgroup = "msppr",
		order = "d[promethium]-r[fulgora]",
		inventory_move_sound = item_sounds.electric_inventory_move,
		pick_sound = item_sounds.resource_inventory_pickup,
		drop_sound = item_sounds.electric_inventory_move,
		stack_size = 100,
		weight = 1 * kg,
		random_tint_color = item_tints.electric_blue,
	},
	{
		type = "item",
		name = "msppr-hot-promethium-plate",
		icon = "__multi_surface_promethium_plate_recipe__/graphics/msppr-hot-promethium-plate.png",
		subgroup = "msppr",
		order = "d[promethium]-z[hot-plate]",
		inventory_move_sound = item_sounds.sulfur_inventory_move,
		pick_sound = item_sounds.resource_inventory_pickup,
		drop_sound = item_sounds.sulfur_inventory_move,
		stack_size = 100,
		weight = 1 * kg,
		random_tint_color = item_tints.ice_blue,
	},
	{
		type = "item",
		name = "msppr-promethium-plate",
		icon = "__multi_surface_promethium_plate_recipe__/graphics/msppr-promethium-plate.png",
		subgroup = "msppr",
		order = "d[promethium]-z[plate]",
		inventory_move_sound = item_sounds.sulfur_inventory_move,
		pick_sound = item_sounds.resource_inventory_pickup,
		drop_sound = item_sounds.sulfur_inventory_move,
		stack_size = 100,
		weight = 1 * kg,
		random_tint_color = item_tints.ice_blue,
	},
})

data:extend({
	{
		type = "recipe",
		name = "msppr-nauvis",
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
			{ type = "item", name = "tree-seed", amount = 10 },
			{ type = "item", name = "uranium-235", amount = 3 },
			{ type = "item", name = "biter-egg", amount = 1 },
		},
		energy_required = 10,
		msppr = {
			result = { type = "item", name = "msppr-nauvis", amount = 1 },
			recipe_chain_order = "nauvis",
		},
		results = { { type = "item", name = "msppr-nauvis", amount = 1 } },
		allow_productivity = false,
		auto_recycle = false,
	},
	{
		type = "recipe",
		name = "msppr-gleba",
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
			{ type = "item", name = "bioflux", amount = 2 },
			{ type = "item", name = "pentapod-egg", amount = 1 },
			{ type = "item", name = "carbon-fiber", amount = 2 },
		},
		energy_required = 10,
		--msppr_result = { type = "item", name = "msppr-gleba", amount = 2 },
		msppr = {
			result = { type = "item", name = "msppr-gleba", amount = 1 },
			recipe_chain_order = "gleba",
		},
		results = { { type = "item", name = "msppr-gleba", amount = 1 } },
		allow_productivity = false,
		auto_recycle = false,
	},
	{
		type = "recipe",
		name = "msppr-fulgora",
		subgroup = "science-pack",
		category = "electromagnetics",
		surface_conditions = {
			{
				property = "pressure",
				min = 800,
				max = 800,
			},
			{
				property = "magnetic-field",
				min = 99,
				max = 99,
			},
		},
		enabled = false,
		ingredients = {
			{ type = "item", name = "scrap", amount = 10 },
			{ type = "item", name = "supercapacitor", amount = 1 },
			{ type = "item", name = "superconductor", amount = 2 },
			{ type = "item", name = "holmium-plate", amount = 2 },
			{ type = "fluid", name = "electrolyte", amount = 10 },
		},
		msppr = {
			result = { type = "item", name = "msppr-fulgora", amount = 1 },
			recipe_chain_order = "fulgora",
		},
		energy_required = 10,
		results = { { type = "item", name = "msppr-fulgora", amount = 1 } },
		allow_productivity = false,
		auto_recycle = false,
	},
})
data:extend({
	{
		type = "recipe",
		name = "msppr-crushed-promethium",
		subgroup = "science-pack",
		category = "crushing",
		surface_conditions = {
			{
				property = "pressure",
				min = 0,
				max = 0,
			},
		},
		enabled = false,
		ingredients = {
			{ type = "item", name = "promethium-asteroid-chunk", amount = 1 },
		},
		energy_required = 10,
		results = {
			{ type = "item", name = "msppr-crushed-promethium", amount = 2 },
		},
		allow_productivity = false,
		auto_recycle = false,
		maximum_productivity = 0,
	},
	{
		type = "recipe",
		name = "msppr-hot-promethium-plate",
		subgroup = "science-pack",
		category = "metallurgy",
		surface_conditions = {
			{
				property = "pressure",
				min = 4000,
				max = 4000,
			},
		},
		enabled = false,
		ingredients = {
			{ type = "fluid", name = "molten-iron", amount = 50 },
			{ type = "fluid", name = "molten-copper", amount = 50 },
			{ type = "item", name = "tungsten-plate", amount = 4 },
			{ type = "item", name = "carbon", amount = 5 },
			{ type = "item", name = "calcite", amount = 5 },
		},
		energy_required = 10,
		msppr = {
			result = { type = "item", name = "msppr-hot-promethium-plate", amount = 1 },
			recipe_chain_order = "",
		},
		results = { { type = "item", name = "msppr-hot-promethium-plate", amount = 1 } },
		allow_productivity = false,
		auto_recycle = false,
		maximum_productivity = 0,
	},
	{
		type = "recipe",
		name = "msppr-promethium-plate",
		subgroup = "science-pack",
		category = "cryogenics",
		surface_conditions = {
			{
				property = "pressure",
				min = 300,
				max = 300,
			},
		},
		enabled = false,
		ingredients = {
			{ type = "fluid", name = "fluoroketone-cold", amount = 50 },
			{ type = "fluid", name = "water", amount = 50 },
			{ type = "fluid", name = "light-oil", amount = 50 },
		},
		energy_required = 10,
		msppr = {
			result = { type = "item", name = "msppr-promethium-plate", amount = 1 },
			recipe_chain_order = "",
		},
		results = {
			{ type = "item", name = "msppr-promethium-plate", amount = 1 },
			{ type = "fluid", name = "fluoroketone-hot", amount = 40 },
		},
		main_product = "msppr-promethium-plate",
		allow_productivity = false,
		auto_recycle = false,
		maximum_productivity = 0,
	},
})
