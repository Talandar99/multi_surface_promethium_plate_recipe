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
	recipe.icon = nil
end
