-------------------------------------------------------------------------------
--- building chain
-------------------------------------------------------------------------------
local first_real_input = "msppr-crushed-promethium"

local msppr_chain = {}

for _, recipe in pairs(data.raw.recipe) do
	if recipe.msppr and recipe.name ~= "msppr-hot-promethium-plate" and recipe.name ~= "msppr-promethium-plate" then
		table.insert(msppr_chain, recipe)
	end
end

table.sort(msppr_chain, function(a, b)
	return a.msppr.recipe_chain_order < b.msppr.recipe_chain_order
end)

table.insert(msppr_chain, data.raw.recipe["msppr-hot-promethium-plate"])
table.insert(msppr_chain, data.raw.recipe["msppr-promethium-plate"])

local tech = data.raw.technology["promethium-science-pack"]
table.insert(tech.effects, {
	type = "unlock-recipe",
	recipe = "msppr-crushed-promethium",
})
for _, recipe in ipairs(msppr_chain) do
	table.insert(tech.effects, {
		type = "unlock-recipe",
		recipe = recipe.name,
	})
end
local last_item = first_real_input

for _, recipe in ipairs(msppr_chain) do
	local res = recipe.msppr.result
	local amount = res.amount or 1

	recipe.ingredients = recipe.ingredients or {}
	recipe.maximum_productivity = 0

	table.insert(recipe.ingredients, {
		type = "item",
		name = last_item,
		amount = amount,
		ignored_by_stats = amount,
		ignored_by_productivity = amount,
	})

	recipe.results = recipe.results or {}

	for _, r in pairs(recipe.results) do
		if r.name == res.name then
			r.amount = amount
			r.ignored_by_stats = amount
			r.ignored_by_productivity = amount
			break
		end
	end
	recipe.allow_productivity = false
	recipe.auto_recycle = false
	last_item = res.name
end
-------------------------------------------------------------------------------
--- override promethium recipes
-------------------------------------------------------------------------------
for _, recipe in pairs(data.raw.recipe) do
	local produces_promethium_science = false

	if recipe.result == "promethium-science-pack" then
		produces_promethium_science = true
	end

	if recipe.results then
		for _, r in pairs(recipe.results) do
			if r.name == "promethium-science-pack" then
				produces_promethium_science = true
				break
			end
		end
	end

	if produces_promethium_science and recipe.ingredients then
		for _, ing in pairs(recipe.ingredients) do
			if ing.name == "promethium-asteroid-chunk" then
				ing.name = "msppr-promethium-plate"
			end
		end
	end
end
-------------------------------------------------------------------------------
--- spidertron compatibility
-------------------------------------------------------------------------------
if settings.startup["space-spidertron-compatibility"].value then
	if mods["space-spidertron"] then
		local promethium_science_packs_unit_ingredients =
			table.deepcopy(data.raw["technology"]["research-productivity"].unit.ingredients)
		data:extend({
			{
				type = "technology",
				name = "msppr-space-spidertron",
				icon = "__space-spidertron__/graphics/space-spidertron/space-spidertron-icon.png",
				icon_size = 64,
				effects = {
					{
						type = "unlock-recipe",
						recipe = "ss-space-spidertron",
					},
				},
				prerequisites = { "promethium-science-pack" },
				unit = {
					count = 2000,
					ingredients = promethium_science_packs_unit_ingredients,
					time = 60,
				},
			},
		})

		local tech = data.raw.technology["spidertron"]

		if tech and tech.effects then
			for i = #tech.effects, 1, -1 do
				local effect = tech.effects[i]
				if effect.type == "unlock-recipe" and effect.recipe == "ss-space-spidertron" then
					table.remove(tech.effects, i)
				end
			end
		end
		table.insert(data.raw["recipe"]["ss-space-spidertron"].ingredients, {
			type = "item",
			name = "msppr-promethium-plate",
			amount = 50,
		})
	end
end
