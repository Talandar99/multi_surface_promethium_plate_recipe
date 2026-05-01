local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_effects = require("__space-age__.prototypes.item-effects")
local item_tints = require("__base__.prototypes.item-tints")
local item_sounds = require("__base__.prototypes.item_sounds")
local sounds = require("__base__.prototypes.entity.sounds")

if mods["lignumis"] then
	if settings.startup["lignumis-msppr"].value then
		data:extend({
			{
				type = "item",
				name = "msppr-lignumis",
				icon = "__multi_surface_promethium_plate_recipe__/graphics/msppr-lignumis.png",
				subgroup = "msppr",
				order = "d[promethium]-r[lignumis]",
				inventory_move_sound = item_sounds.sulfur_inventory_move,
				pick_sound = item_sounds.resource_inventory_pickup,
				drop_sound = item_sounds.sulfur_inventory_move,
				default_import_location = "lignumis",
				stack_size = 100,
				weight = 1 * kg,
				random_tint_color = item_tints.ice_blue,
			},

			{
				type = "recipe",
				name = "msppr-lignumis",
				subgroup = "science-pack",
				category = "crafting-with-steam",
				surface_conditions = {
					{
						property = "pressure",
						min = 900,
						max = 900,
					},
				},
				enabled = false,
				ingredients = {
					{ type = "item", name = "lumber", amount = 10 },
					{ type = "item", name = "gold-plate", amount = 50 },
					{ type = "item", name = "peat", amount = 10 },
				},
				energy_required = 10,
				msppr = {
					result = { type = "item", name = "msppr-lignumis", amount = 1 },
					recipe_chain_order = "lignumis",
				},
				results = { { type = "item", name = "msppr-lignumis", amount = 1 } },
				allow_productivity = false,
				auto_recycle = false,
			},
		})
	end

	if settings.startup["quality-assembler-require-promethium-plates"].value then
		-- quality assembler locked behind promethium plates
		data.raw["technology"]["quality-assembler"].unit.ingredients =
			data.raw["technology"]["research-productivity"].unit.ingredients
		table.insert(data.raw["technology"]["quality-assembler"].prerequisites, "promethium-science-pack")
		table.insert(
			data.raw["recipe"]["quality-assembler"].ingredients,
			{ type = "item", name = "msppr-promethium-plate", amount = 20 }
		)

		table.insert(
			data.raw["recipe"]["gold-module-3"].ingredients,
			{ type = "item", name = "msppr-promethium-plate", amount = 5 }
		)
	end
end

if mods["Cerys-Moon-of-Fulgora"] then
	if settings.startup["msppr-cerys"].value then
		data:extend({
			{
				type = "item",
				name = "msppr-cerys",
				icon = "__multi_surface_promethium_plate_recipe__/graphics/msppr-cerys.png",
				subgroup = "msppr",
				order = "d[promethium]-r[nauvis-cerys]",
				inventory_move_sound = item_sounds.sulfur_inventory_move,
				pick_sound = item_sounds.resource_inventory_pickup,
				drop_sound = item_sounds.sulfur_inventory_move,
				default_import_location = "cerys",
				stack_size = 100,
				weight = 1 * kg,
				random_tint_color = item_tints.ice_blue,
			},

			{
				type = "recipe",
				name = "msppr-cerys",
				subgroup = "science-pack",
				category = "centrifuging",
				surface_conditions = {
					{
						property = "pressure",
						min = 5,
						max = 5,
					},
				},
				enabled = false,
				ingredients = {
					{ type = "item", name = "plutonium-239", amount = 2 },
					{ type = "item", name = "holmium-plate", amount = 2 },
					{ type = "item", name = "uranium-238", amount = 5 },
				},
				energy_required = 10,
				msppr = {
					result = { type = "item", name = "msppr-cerys", amount = 1 },
					recipe_chain_order = "nauvis-cerys",
				},
				results = { { type = "item", name = "msppr-cerys", amount = 1 } },
				allow_productivity = false,
				auto_recycle = false,
			},
		})
	end
end

if mods["maraxsis"] then
	if settings.startup["maraxsis-msppr"].value then
		data:extend({
			{
				type = "item",
				name = "msppr-maraxsis",
				icon = "__multi_surface_promethium_plate_recipe__/graphics/msppr-maraxsis.png",
				subgroup = "msppr",
				order = "d[promethium]-r[maraxsis]",
				inventory_move_sound = item_sounds.sulfur_inventory_move,
				pick_sound = item_sounds.resource_inventory_pickup,
				drop_sound = item_sounds.sulfur_inventory_move,
				default_import_location = "maraxsis",
				stack_size = 100,
				weight = 1 * kg,
				random_tint_color = item_tints.ice_blue,
			},

			{
				type = "recipe",
				name = "msppr-maraxsis",
				subgroup = "science-pack",
				category = "maraxsis-hydro-plant",
				surface_conditions = {
					{
						property = "pressure",
						min = 400000,
						max = 400000,
					},
				},
				enabled = false,
				ingredients = {
					{ type = "item", name = "maraxsis-glass-panes", amount = 5 },
					{ type = "item", name = "maraxsis-super-sealant-substance", amount = 5 },
					{ type = "fluid", name = "molten-salt", amount = 50 },
				},
				energy_required = 10,
				msppr = {
					result = { type = "item", name = "msppr-maraxsis", amount = 1 },
					recipe_chain_order = "maraxsis",
				},
				results = { { type = "item", name = "msppr-maraxsis", amount = 1 } },
				allow_productivity = false,
				auto_recycle = false,
			},
		})
	end
end

if mods["corrundum"] then
	if settings.startup["msppr-corrundum"].value == true then
		data:extend({
			{
				type = "item",
				name = "msppr-corrundum",
				icons = {
					{
						icon = "__space-age__/graphics/icons/holmium-plate.png",
						tint = { r = 0.25, g = 0.55, b = 0.85, a = 1.0 },
					},
				},
				icon_size = 64,
				icon_mipmaps = 4,
				subgroup = "msppr",
				order = "d[promethium]-rvua[corrundum]-rvub[vulcanus]",
				inventory_move_sound = item_sounds.metal_small_inventory_move,
				pick_sound = item_sounds.metal_small_inventory_pickup,
				drop_sound = item_sounds.metal_small_inventory_move,
				default_import_location = "corrundum",
				stack_size = 100,
				weight = 1 * kg,
				random_tint_color = item_tints.ice_blue,
			},

			{
				type = "recipe",
				name = "msppr-corrundum",
				subgroup = "science-pack",
				category = "catalytic-chemistry",
				surface_conditions = {
					{
						property = "pressure",
						min = 6000,
						max = 6000,
					},
				},
				enabled = false,
				ingredients = {
					{ type = "item", name = "dry-ice", amount = 50 },
					{ type = "fluid", name = "mixed-sulfate-solution", amount = 150 },
					{ type = "item", name = "platinum-plate", amount = 8 },
				},
				energy_required = 25,
				msppr = {
					result = { type = "item", name = "msppr-corrundum", amount = 1 },
					recipe_chain_order = "vu-corrundum-vulcanus",
				},
				results = { { type = "item", name = "msppr-corrundum", amount = 1 } },
				allow_productivity = false,
				auto_recycle = false,
			},
		})
	end
end

if mods["planet-rabbasca"] then
	if settings.startup["msppr-planet-rabbasca"].value == true then
		data:extend({
			{
				type = "item",
				name = "msppr-rabbasca",
				icons = {
					{
						icon = "__space-age__/graphics/icons/huge-promethium-asteroid.png",
						tint = { r = 0.75, g = 0.35, b = 0.65, a = 1.0 },
					},
				},
				icon_size = 64,
				icon_mipmaps = 4,
				subgroup = "msppr",
				order = "d[promethium]-r[gleba]-rabbasca",
				inventory_move_sound = item_sounds.electric_large_inventory_move,
				pick_sound = item_sounds.electric_large_inventory_pickup,
				drop_sound = item_sounds.electric_large_inventory_move,
				default_import_location = "rabbasca",
				stack_size = 100,
				weight = 1 * kg,
				random_tint_color = item_tints.ice_blue,
			},

			{
				type = "recipe",
				name = "msppr-rabbasca",
				subgroup = "science-pack",
				category = "metallurgy",
				surface_conditions = { Rabbasca.above_harenic_threshold(0.1) },
				enabled = false,
				ingredients = {
					{ type = "fluid", name = "omega-carotene", amount = 100 },
					{ type = "item", name = "haronite-plate", amount = 10 },
					{ type = "item", name = "rabbasca-protein-shake", amount = 4 },
				},
				energy_required = 20,
				msppr = {
					result = { type = "item", name = "msppr-rabbasca", amount = 1 },
					recipe_chain_order = "gleba-rabbasca",
				},
				results = {
					{ type = "item", name = "msppr-rabbasca", probability = 1, amount_min = 1, amount_max = 5 },
				},
				allow_productivity = false,
				auto_recycle = false,
			},
		})
	end
end
