data:extend({
	{
		type = "bool-setting",
		name = "space-spidertron-compatibility",
		setting_type = "startup",
		default_value = true,
		order = "msppr-a",
	},
})

if mods["lignumis"] then
	data:extend({
		{
			type = "bool-setting",
			name = "lignumis-msppr",
			setting_type = "startup",
			default_value = true,
			order = "msppr-b",
		},
	})
	data:extend({
		{
			type = "bool-setting",
			name = "quality-assembler-require-promethium-plates",
			setting_type = "startup",
			default_value = true,
			order = "msppr-c",
		},
	})
end
if mods["Cerys-Moon-of-Fulgora"] then
	data:extend({
		{
			type = "bool-setting",
			name = "msppr-cerys",
			setting_type = "startup",
			default_value = true,
			order = "msppr-d",
		},
	})
end

if mods["maraxsis"] then
	data:extend({
		{
			type = "bool-setting",
			name = "maraxsis-msppr",
			setting_type = "startup",
			default_value = true,
			order = "msppr-d",
		},
	})
end

if mods["corrundum"] then
	data:extend({
		{
			type = "bool-setting",
			name = "msppr-corrundum",
			setting_type = "startup",
			default_value = true,
			order = "msppr-e",
		},
	})
end

if mods["planet-rabbasca"] then
	data:extend({
		{
			type = "bool-setting",
			name = "msppr-planet-rabbasca",
			setting_type = "startup",
			default_value = true,
			order = "msppr-d",
		},
	})
end
