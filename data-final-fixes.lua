local placeholder = "msppr-input-placeholder"
local first_real_input = "promethium-asteroid-chunk"

-- Zbieramy wszystkie receptury mające placeholder
local chain = {}

for _, recipe in pairs(data.raw.recipe) do
	if recipe.ingredients then
		for _, ing in ipairs(recipe.ingredients) do
			if ing.name == placeholder then
				table.insert(chain, recipe)
				break
			end
		end
	end
end
-- Możesz posortować, jeśli chcesz narzucić kolejność:
-- table.sort(chain, function(a, b) return a.name < b.name end)

local last_output = nil

for i, recipe in ipairs(chain) do
	local ingredients = recipe.ingredients

	-- Wybieramy input
	local new_input = (i == 1) and first_real_input or last_output

	-- Zamieniamy placeholder na aktualny input
	for _, ing in ipairs(ingredients) do
		if ing.name == placeholder then
			ing.name = new_input
		end
	end

	-- Pobieramy nazwę outputu tej receptury
	local results = recipe.results
	if not results or not results[1] then
		log("Recipe " .. recipe.name .. " has no results!")
		break
	end

	last_output = results[1].name
end
