require "defines"
require "config"
require "gui"

--TODO √
-- Cooldown √
-- Checking distance per tier √
-- drain √
-- Item cats √
-- Strange Linkin removal bug when upgrading with link on item √
-- Sound √
-- Distance measurement √
-- Cooldown on both √


function round(num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

function arraylength(array)
	if array == nil then return 0 end
	count = 0
	for _,_ in ipairs(array) do
		count = count+1
	end
	return count
end

function arrayGetIndex(array, item)
	for k,v in ipairs(array) do
		if v == item then return k end
	end
	return nil
end

function teleport(target_teleporter, pindex)
	if isValidTeleporter(target_teleporter) then
		game.players[pindex].surface.create_entity{name="teleport-sound", position=game.players[pindex].position}
		game.players[pindex].teleport({target_teleporter.position.x + 0.25, target_teleporter.position.y + 0.25})
	end
end

function isLinked(teleporter)
	state = false
	for k,v in ipairs(global.links) do
		if teleporter == global.links[k].a or teleporter == global.links[k].b then
			state = true
		end
	end
	return state
end

function findBside(teleporter)
	bside = nil
	for k,v in ipairs(global.links) do
		if teleporter == global.links[k].a then
			bside = global.links[k].b
		elseif teleporter == global.links[k].b then
			bside = global.links[k].a
		end
	end
	return bside
end

function breakLinks(someTeleporter, player)
	if isLinked(someTeleporter) then		
		local index = 0
		
		for k,v in ipairs(global.links) do
			if v.a == someTeleporter then
				index = k
			elseif v.b == someTeleporter then
				index = k
			end
		end
		
		table.remove(global.links, index)
		--table.remove(global.links, arrayGetIndex(global.links, findBside(someTeleporter)))
		--table.remove(global.links, arrayGetIndex(global.links, someTeleporter))
	end
end

function getEnergy(teleporter, currency)
	if teleporter.energy ~= nil then
		if currency == "J" then
			return tonumber(teleporter.energy)
		elseif currency == "KJ" then
			return tonumber(teleporter.energy/1000)
		elseif currency == "MJ" then
			return tonumber(teleporter.energy/1000000)
		else
			return 0
		end
	else
		return 0
	end
end

function getDistance(teleporterA, teleporterB)
	if teleporterA == nil or teleporterB == nil then
		return nil
	end
	local dx = teleporterA.position.x - teleporterB.position.x
	local dy = teleporterA.position.y - teleporterB.position.y
	return math.sqrt(dx*dx + dy*dy)
end

function getDistanceRaw( x1, y1, x2, y2 )
	local dx = x1 - x2
	local dy = y1 - y2
	return math.sqrt ( dx * dx + dy * dy )
end

function getTier(teleporter)
	local name = teleporter.name
	local ending = string.sub(name, 16, 17)
	return tonumber(ending)
end

function getForceOfPlayer()
	local force = nil
	for k,v in ipairs(game.players) do
		force = v.force
	end
	return force
end

function upgradeTeleporter(playerid, teleporter)
	local valids = {}
	local player = game.players[playerid]
	for i=2, 10, 1 do
		if i < 10 then
			ix = "0"..tostring(i)
		else
			ix = tostring(i)
		end
		if player.get_item_count("Teleporter_Upgrade_"..ix) ~= 0 then
			local currentTier = getTier(teleporter)
			if tonumber(ix) > currentTier then
				if tonumber(ix) == currentTier + 1 then
					valids[arraylength(valids)+1] = ix	
				end
			end
		end
	end
	
	for k,v in ipairs(valids) do
		player.character.get_inventory(1).remove{name="Teleporter_Upgrade_"..v, count=1}
		local oldpos = teleporter.position
		local oldenergy = teleporter.energy
		teleporter.destroy()
		local new = player.surface.create_entity{name="Teleporter_Tier"..v, position=oldpos}
		new.energy = oldenergy
		new.force = getForceOfPlayer()
	end
end

function findTeleporters(range, playerid)
	local found = nil

	for k,v in ipairs(tiers) do
		local inrange = game.players[playerid].surface.find_entities_filtered{area = range, name = v}
		if arraylength(inrange) >= 1 then
			found = inrange
		end
	end
	
	return found
end

function isValidTeleporter(entity)
	local valid = false
	for _,v in ipairs(tiers) do
		if entity.name == v then
			valid = true
		end
	end
	return valid		
end

function isValidUpgradeEntity(entity)
	local valid = false
	--Teleporter_UpgradeEntity_02
	for i=2, 10, 1 do 
		if i < 10 then
			ix = "0"..tostring(i)
		else
			ix = tostring(i)
		end
		local entityname = "Teleporter_UpgradeEntity_"..ix
		if entity.name == entityname then
			valid = true
		end
	end
	return valid
end

function isValidTeleporter(entity)
	local valid = false
	for k,v in ipairs(tiers) do
		if entity.name == v then
			valid = true
		end
	end	
	return valid
end

function postMessage(message, player, cr, cg,cb)
	if MSG_OUTPUT_MODE == 1 then
		player.surface.create_entity({name="flying-text", position=player.position, text=message, color={r = cr, g = cg, b = cb}})
		return true
	elseif MSG_OUTPUT_MODE == 2 then
		player.print(message)
		return true
	else
		return false
	end
end

function getConfigValue(type, tier)
	local power_names = {"TIER_01_TELEPORT_POWER", "TIER_02_TELEPORT_POWER", "TIER_03_TELEPORT_POWER", "TIER_04_TELEPORT_POWER", "TIER_05_TELEPORT_POWER",  "TIER_06_TELEPORT_POWER", "TIER_07_TELEPORT_POWER", "TIER_08_TELEPORT_POWER",
									"TIER_09_TELEPORT_POWER", "TIER_10_TELEPORT_POWER"}
	local buffer_names = {"TIER_01_BUFFER_CAPACITY", "TIER_02_BUFFER_CAPACITY", "TIER_03_BUFFER_CAPACITY", "TIER_04_BUFFER_CAPACITY", "TIER_05_BUFFER_CAPACITY",  "TIER_06_BUFFER_CAPACITY", "TIER_07_BUFFER_CAPACITY", "TIER_08_BUFFER_CAPACITY",
									"TIER_09_BUFFER_CAPACITY", "TIER_10_BUFFER_CAPACITY"}
	local input_names = {"TIER_01_FLOW_LIMIT", "TIER_02_FLOW_LIMIT", "TIER_03_FLOW_LIMIT", "TIER_04_FLOW_LIMIT", "TIER_05_FLOW_LIMIT",  "TIER_06_FLOW_LIMIT", "TIER_07_FLOW_LIMIT", "TIER_08_FLOW_LIMIT", "TIER_09_FLOW_LIMIT", 
									"TIER_10_FLOW_LIMIT"}
	local distance_names = {"TIER_01_DISTANCE", "TIER_02_DISTANCE", "TIER_03_DISTANCE", "TIER_04_DISTANCE", "TIER_05_DISTANCE",  "TIER_06_DISTANCE", "TIER_07_DISTANCE", "TIER_08_DISTANCE", "TIER_09_DISTANCE", 
									"TIER_10_DISTANCE"}
	local cooldown_names = {"TIER_01_COOLDOWN", "TIER_02_COOLDOWN", "TIER_03_COOLDOWN", "TIER_04_COOLDOWN", "TIER_05_COOLDOWN", "TIER_06_COOLDOWN", "TIER_07_COOLDOWN", "TIER_08_COOLDOWN", "TIER_09_COOLDOWN", 
									"TIER_10_COOLDOWN"}
	
	if type == "power" then
		local found = nil
		for k,v in ipairs(power_names) do
			local str = tonumber(string.sub(v, 6, 7))
			if tier == str then
				found = str
			end
		end
	
		if		  found == 1   then return TIER_01_TELEPORT_POWER
		elseif found == 2   then return TIER_02_TELEPORT_POWER
		elseif found == 3   then return TIER_03_TELEPORT_POWER
		elseif found == 4   then return TIER_04_TELEPORT_POWER
		elseif found == 5   then return TIER_05_TELEPORT_POWER
		elseif found == 6   then return TIER_06_TELEPORT_POWER
		elseif found == 7   then return TIER_07_TELEPORT_POWER
		elseif found == 8   then return TIER_08_TELEPORT_POWER
		elseif found == 9   then return TIER_09_TELEPORT_POWER
		elseif found == 10 then return TIER_10_TELEPORT_POWER
		else								 return nil
		end
	elseif type == "buffer" then
		local found = nil
		for k,v in ipairs(buffer_names) do
			local str = tonumber(string.sub(v, 6, 7))
			if tier == str then
				found = str
			end
		end
		
		if		  found == 1   then return TIER_01_BUFFER_CAPACITY
		elseif found == 2   then return TIER_02_BUFFER_CAPACITY
		elseif found == 3   then return TIER_03_BUFFER_CAPACITY
		elseif found == 4   then return TIER_04_BUFFER_CAPACITY
		elseif found == 5   then return TIER_05_BUFFER_CAPACITY
		elseif found == 6   then return TIER_06_BUFFER_CAPACITY
		elseif found == 7   then return TIER_07_BUFFER_CAPACITY
		elseif found == 8   then return TIER_08_BUFFER_CAPACITY
		elseif found == 9   then return TIER_09_BUFFER_CAPACITY
		elseif found == 10 then return TIER_10_BUFFER_CAPACITY
		else								 return nil
		end
	elseif type == "input" then
		local found = nil
		for k,v in ipairs(input_names) do
			local str = tonumber(string.sub(v, 6, 7))
			if tier == str then
				found = str
			end
		end
		
		if		  found == 1   then return TIER_01_FLOW_LIMIT
		elseif found == 2   then return TIER_02_FLOW_LIMIT
		elseif found == 3   then return TIER_03_FLOW_LIMIT
		elseif found == 4   then return TIER_04_FLOW_LIMIT
		elseif found == 5   then return TIER_05_FLOW_LIMIT
		elseif found == 6   then return TIER_06_FLOW_LIMIT
		elseif found == 7   then return TIER_07_FLOW_LIMIT
		elseif found == 8   then return TIER_08_FLOW_LIMIT
		elseif found == 9   then return TIER_09_FLOW_LIMIT
		elseif found == 10 then return TIER_10_FLOW_LIMIT
		else								 return nil
		end
	elseif type == "distance" then
		local found = nil
		for k,v in ipairs(distance_names) do
			local str = tonumber(string.sub(v, 6, 7))
			if tier == str then
				found = str
			end
		end
		
		if		  found == 1   then return TIER_01_DISTANCE
		elseif found == 2   then return TIER_02_DISTANCE
		elseif found == 3   then return TIER_03_DISTANCE
		elseif found == 4   then return TIER_04_DISTANCE
		elseif found == 5   then return TIER_05_DISTANCE
		elseif found == 6   then return TIER_06_DISTANCE
		elseif found == 7   then return TIER_07_DISTANCE
		elseif found == 8   then return TIER_08_DISTANCE
		elseif found == 9   then return TIER_09_DISTANCE
		elseif found == 10 then return TIER_10_DISTANCE
		else								 return nil
		end
	elseif type == "cooldown" then
		local found = nil
		for k,v in ipairs(cooldown_names) do
			local str = tonumber(string.sub(v, 6, 7))
			if tier == str then
				found = str
			end
		end
		
		if		  found == 1   then return TIER_01_COOLDOWN
		elseif found == 2   then return TIER_02_COOLDOWN
		elseif found == 3   then return TIER_03_COOLDOWN
		elseif found == 4   then return TIER_04_COOLDOWN
		elseif found == 5   then return TIER_05_COOLDOWN
		elseif found == 6   then return TIER_06_COOLDOWN
		elseif found == 7   then return TIER_07_COOLDOWN
		elseif found == 8   then return TIER_08_COOLDOWN
		elseif found == 9   then return TIER_09_COOLDOWN
		elseif found == 10 then return TIER_10_COOLDOWN
		else								 return nil
		end
	else
		return nil
	end
end

function arraycontains(array, item)
	local found = false
	for k,v in ipairs(array) do
		if v.teleporter == item then
			found = true
		end
	end
	return found
end

function isTeleInCooldown(teleporter)
	local found = false
	for k,v in ipairs(cd) do
		if v.teleporter == teleporter then
			found = true
		end
	end
	return found
end

function getLeftCooldownTime(teleporter)
	local wanted_tick = 0
	for k,v in ipairs(cd) do
		if v.teleporter == teleporter then
			if game.tick < v.after then
				wanted_tick = v.after - game.tick
			end
		end
	end
	return wanted_tick / 60
end

function cleanCooldowns()
	for k,v in ipairs(cd) do
		if v.enabled == false then
			cd[k].teleporter = nil
		end
	end
end

function dist2tier(dist)
	local r = round(dist, 2)
	local allowed_dists = {}
	local first_possible = 0
	for i=1,10,1 do
		allowed_dists[i] = getConfigValue("distance", i)		
	end
	for k,v in ipairs(allowed_dists) do
		if r <= v then
			if first_possible == 0 then
				first_possible = k
			end
		end
	end
	return first_possible
end

function assignName(teleporter, name, player)
	local alreadythere = 0
	for k,v in ipairs(global.names) do
		if v.t == teleporter then
			alreadythere = k
		end
	end
	if alreadythere ~= 0 then
		global.names[alreadythere].n = name
	else
		global.names[arraylength(global.names)+1] = {t=teleporter, n=name}
	end
	if player ~= nil then
		player.print("Name changed to "..name)
	end
end

function getName(teleporter)
	for k,v in ipairs(global.names) do
		if v.t == teleporter then
			return v.n
		end
	end
	return "NO_NAME"
end

function getState(teleporter)
	if isTeleInCooldown(teleporter) == true then
		return "Cooling down"
	elseif teleporter.energy/1000000 == getConfigValue("buffer", getTier(teleporter)) then
		return "Ready"
	elseif teleporter.energy/1000000 < getConfigValue("buffer", getTier(teleporter)) then
		return "Charging"
	end
end

script.on_init(
	function()
		global.links = global.links or {}
		global.names = global.names or {}
	end
)

script.on_load(
	function()
		global.links = global.links or {}
		global.names = global.names or {}
	end
)

set_a = false
set_b = false
allow_tp = true
tiers = {"Teleporter_Tier01","Teleporter_Tier02","Teleporter_Tier03","Teleporter_Tier04","Teleporter_Tier05","Teleporter_Tier06","Teleporter_Tier07","Teleporter_Tier08","Teleporter_Tier09","Teleporter_Tier10"}

point_a_set = false
point_b_set = false

ax, ay, bx, by, e1, e2 = 0, 0, 0, 0, nil, nil

cd = {}

script.on_event(defines.events.on_tick, 
	function(event)
		for k,v in ipairs(game.players) do
			local player = game.players[k]
		
			tp_range = { {player.position.x-1, player.position.y-1},{player.position.x+1, player.position.y+1} } --HERE
			next_teleporter = findTeleporters(tp_range, k)
		
			if game.tick % 1200 == 0 then
				local nears = findTeleporters({{player.position.x-64, player.position.y-64},{player.position.x+64, player.position.y+64}}, k)
				if arraylength(nears) >= 1 then
					for _,v in ipairs(nears) do
						v.energy = v.energy - (getConfigValue("input", getTier(v))-(getConfigValue("buffer", getTier(v))/100))*1000000
					end
				end
			end

			--
			for k,v in ipairs(cd) do
				if v.enabled == true then
					if game.tick == v.after then
						v.enabled = false
						cleanCooldowns()
					end --if game.tick
				end --if v.enabled
			end --for
			--
						
			-- GUI HOOK
			gui_tick(player)
			--
			
			if arraylength(next_teleporter) >= 1 then
				allowed_range_x = next_teleporter[1].position.x + 0.4
				allowed_range_y = next_teleporter[1].position.y + 0.4
					
				if round(tonumber(player.position.x),0) <= allowed_range_x and round(tonumber(player.position.y),0) <= allowed_range_y then
					if arraylength(global.links) == 0 or isLinked(next_teleporter[1]) == false then
						if allow_tp == true then
							postMessage("This teleporter is not linked!", player, 1, 0, 0)
							allow_tp = false
						end
					end
					if isLinked(next_teleporter[1]) then
						if allow_tp == true then
							if isTeleInCooldown(next_teleporter[1]) == false then
								if getEnergy(next_teleporter[1], "MJ") >= getConfigValue("power", getTier(next_teleporter[1])) then
									next_teleporter[1].energy = next_teleporter[1].energy - (getConfigValue("power",getTier(next_teleporter[1]))*1000000)
									teleport(findBside(next_teleporter[1]), k)

									--
									cd[arraylength(cd)+1] = {}
									cd[arraylength(cd)].enabled = true
									cd[arraylength(cd)].before = game.tick
									cd[arraylength(cd)].after = game.tick + (getConfigValue("cooldown", getTier(next_teleporter[1])) * 60)
									cd[arraylength(cd)].print = false
									cd[arraylength(cd)].teleporter = next_teleporter[1]
									
									cd[arraylength(cd)+1] = {}
									cd[arraylength(cd)].enabled = true
									cd[arraylength(cd)].before = game.tick
									cd[arraylength(cd)].after = game.tick + (getConfigValue("cooldown", getTier(next_teleporter[1])) * 60)
									cd[arraylength(cd)].print = false
									cd[arraylength(cd)].teleporter = findBside(next_teleporter[1])			
									--
									
									allow_tp = false
								else
									postMessage("Not enough energy!", player, 1, 0, 0)
									allow_tp = false
								end -- if getEnergy
							else
								postMessage("This teleporter is cooling down!", player, 1, 1, 0)
								allow_tp = false
							end -- if isTeleInCooldown
						end -- if allow_tp
					end -- if isLinked
				else
					if allow_tp == false then
						allow_tp = true
					end -- if allow_tp
				end --if round
			end -- if arraylength
		end -- for
	end --function
)

script.on_event(defines.events.on_built_entity, 
	function(event)
		local player = game.get_player(event.player_index)
		
		--player.print(event.created_entity.name)
		
		if event.created_entity.name == "telelinker" then
			player.insert({name = "telelinker", count = 1})
			
			hitpos = event.created_entity.position
			hitrange = { {hitpos.x-1, hitpos.y-1},{hitpos.x+1, hitpos.y+1} } --HERE
			hittp = findTeleporters(hitrange, event.player_index)
			
			if arraylength(hittp) >= 1 then
				if set_a == false and set_b == false then
					temp_teleporter_a = hittp[1]
					postMessage("A selected! Now click on the second teleporter!", player, 1, 1, 0)
					set_a = true
				elseif set_a == true and set_b == false then
					temp_teleporter_b = hittp[1]
					if getTier(temp_teleporter_a) == getTier(temp_teleporter_b) then
						if getDistance(temp_teleporter_a, temp_teleporter_b) <= getConfigValue("distance", getTier(temp_teleporter_a)) then
							if temp_teleporter_a ~= temp_teleporter_b then
								postMessage("Connection established!", player, 1, 1, 0)
								set_b = true
							else
								postMessage("You cannot link the teleporter to itself! Aborting Linking..", player, 1, 0, 0)
								set_b = false
								set_a = false
								temp_teleporter_a = nil
								temp_teleporter_b = nil
							end
						else
							postMessage("The distance is too high for Tier "..tostring(getTier(temp_teleporter_a)).."! The max. allowed distance is: "..tostring(getConfigValue("distance", getTier(temp_teleporter_a))).." Tiles (Actual: "..tostring(getDistance(temp_teleporter_a, temp_teleporter_b))..")", player, 1, 0, 0)
							temp_teleporter_a = nil
							temp_teleporter_b = nil
							set_a = false
							set_b = false
						end
					else
						postMessage("This is not the same tier as the first teleporter! Aborting..", player, 1, 0, 0)
						temp_teleporter_a = nil
						temp_teleporter_b = nil
						set_a = false
						set_b = false
					end
				end
				
				if set_a == true and set_b == true then
					global.links[arraylength(global.links)+1] = {a=temp_teleporter_a,b=temp_teleporter_b}
					set_a = false
					set_b = false
				end
			end

			event.created_entity.destroy()
		elseif isValidUpgradeEntity(event.created_entity) then
			player.insert{name="Teleporter_Upgrade_"..string.sub(event.created_entity.name,26,27), count=1}
			hitpos = event.created_entity.position
			hitrange = { {hitpos.x-1, hitpos.y-1},{hitpos.x+1, hitpos.y+1} } --HERE
			hittp = findTeleporters(hitrange, event.player_index)	

			if arraylength(hittp) >= 1 then
				if tonumber(string.sub(event.created_entity.name,26,27)) < getTier(hittp[1]) then
					postMessage("You cannot downgrade a teleporter!", player, 1, 0, 0)
				elseif tonumber(string.sub(event.created_entity.name,26,27)) == getTier(hittp[1]) then
					postMessage("This teleporter is already Tier "..tostring(getTier(hittp[1])), player, 1, 0, 0)
				else
					if tonumber(string.sub(event.created_entity.name,26,27)) ~= getTier(hittp[1])+1 then
						postMessage("You cannot use a Tier "..string.sub(event.created_entity.name,26,27).." Upgrade module to upgrade a Tier "..tostring(getTier(hittp[1])).." Teleporter!", player, 1, 0, 0)
					else
						breakLinks(hittp[1], player)
						upgradeTeleporter(event.player_index, hittp[1], getTier(hittp[1])+1)					
					end
				end
			end
			player.get_inventory(1).remove{name="Teleporter_Upgrade_"..string.sub(event.created_entity.name,26,27), count=1}
			event.created_entity.destroy()
		elseif event.created_entity.name == "distance-tool" then
			player.insert{name="distance-tool", count=1}
			hitpos = event.created_entity.position
			
			if point_a_set == false and point_b_set == false then
				ax = hitpos.x
				ay = hitpos.y
				point_a_set = true
				e1 = event.created_entity
				postMessage("Point A set!", player, 1, 1, 0)
			elseif point_a_set == true and point_b_set == false then
				bx = hitpos.x
				by = hitpos.y
				point_b_set = true
				e2 = event.created_entity
			end
			
			if point_a_set == true and point_b_set == true then
				local distance = getDistanceRaw(ax, ay, bx, by)
				postMessage("Point B set! The measured distance is: "..tostring(round(distance,2)).." Tiles, so you at least need a Tier "..tostring(dist2tier(distance)).." Teleporter.", player, 1, 1, 0)
				point_a_set = false
				point_b_set = false
				e1.destroy()
				e2.destroy()
			end
		elseif isValidTeleporter(event.created_entity) then
			assignName(event.created_entity, "Teleporter #"..tostring(arraylength(global.names)+1), nil)
		-- GUI STUFF
		elseif event.created_entity.name == "gui-tool" then
			player.insert{name="gui-tool", count=1}
			hitpos = event.created_entity.position
			hitrange = { {hitpos.x-1, hitpos.y-1},{hitpos.x+1, hitpos.y+1} }
			hittp = findTeleporters(hitrange, event.player_index)
			
			if arraylength(hittp) >= 1 then
				--setGuiState(true, game.players[event.player_index], hittp[1])
				setGuiStatePerPlayer(true, game.players[event.player_index], hittp[1])
			else
				--setGuiState(true, game.players[event.player_index], nil)
				setGuiStatePerPlayer(true, game.players[event.player_index], nil)
			end
			
			event.created_entity.destroy()
		end
		--
	end
)

script.on_event(defines.events.on_preplayer_mined_item,
	function(event)
		local player = game.get_player(event.player_index)

		if isValidTeleporter(event.entity) then
			breakLinks(event.entity, player)
		end
	end
)

-- Remote things here
remote.add_interface("tele", {
debug = function(pid)
	local p = game.players[pid]
	p.print("Player position: "..tostring(p.position.x)..","..tostring(p.position.y))
	if p.selected ~= nil then p.print("Is Teleporter Selected: "..tostring(isValidTeleporter(p.selected))) end
	if p.selected ~= nil and isValidTeleporter(p.selected) then
		p.print("Selected Teleporter.Tier = "..tostring(getTier(p.selected)))
		p.print("Needed power = "..getConfigValue("power", getTier(p.selected)))
	end
end,
links = function(pid)
	local p = game.players[pid]
	for k,v in ipairs(global.links) do
		p.print("[Link #"..tostring(k).."] Teleporter '"..v.a.name.."' at "..v.a.position.x..","..v.a.position.y.." - Teleporter '"..v.b.name.."' at "..v.b.position.x..","..v.b.position.y.." (Distance: "..tostring(getDistance(v.a, v.b))..")")
	end
end,
clearlinks = function(pid)
	local p = game.players[pid]
	count = 0
	for k,v in ipairs(global.links) do
		global.links[k] = nil
		count = count + 1
	end
	p.print("Deleted "..tostring(count).." links!")
end,
cdd = function(pid)
	local p = game.players[pid]
	p.print(arraylength(cd))
end,
window = function(pid)
	local state = getGuiState()
	state = not state
	setGuiState(state, game.players[pid], game.players[pid].selected or nil)
end
})