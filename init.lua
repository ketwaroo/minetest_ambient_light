-- forked from https://github.com/MikeRedwood/ambient_light
local level = tonumber(minetest.settings:get("light_level")) or 5

minetest.register_on_mods_loaded(function ()
	for i, def in pairs(minetest.registered_nodes) do
		local light_source = def.light_source
		-- prevent adding light source to air/water/etc
		if def.diggable and (light_source == nil or light_source < level) then
			minetest.override_item(i, { light_source = level })
		end
	end
end)
