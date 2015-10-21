require "defines"

guistate = false -- sync
selected_teleporter = nil --sync
mode = "links" 
tier_details = 0
dropdownStates = {}
dropdowns = {}
aDropdownNameFields = {}
bDropdownNameFields = {}
value_font_color = {r=1, g=1}
value_font_color_links = {r=1, g=1}

guistate_per_player = {} -- player (p), state (s), teleporter (t), mode (m)

--[[
function gui_tick(player)
	if guistate == true then
		if player.gui.center.TeleWindow == nil then
			player.gui.center.add{type="frame", name="TeleWindow", caption="Teleportation Window", direction="horizontal"}
			drawWindow(player)
		end
		if mode == "current" and selected_teleporter ~= nil and isTeleInCooldown(selected_teleporter) then
			if player.gui.center.TeleWindow.DetailsFrame.CooldownInfo == nil then
				player.gui.center.TeleWindow.DetailsFrame.add{type="flow", name="CooldownInfo", direction="horizontal"}
				player.gui.center.TeleWindow.DetailsFrame.CooldownInfo.add{type="label", caption="Seconds left:"}
				player.gui.center.TeleWindow.DetailsFrame.CooldownInfo.add{type="progressbar", name="CooldownProgress", size=getConfigValue("cooldown", getTier(selected_teleporter)), style="teleporter-progress-bar"}
			end
			if player.gui.center.TeleWindow.DetailsFrame.CooldownInfo.CooldownProgress ~= nil then
				updateProgressBar(player, player.gui.center.TeleWindow.DetailsFrame.CooldownInfo.CooldownProgress)
			end
		elseif mode == "current" and selected_teleporter ~= nil and isTeleInCooldown(selected_teleporter) == false then
			if player.gui.center.TeleWindow.DetailsFrame.CooldownInfo ~= nil then
				player.gui.center.TeleWindow.DetailsFrame.CooldownInfo.destroy()
			end
		end
	else
		if player.gui.center.TeleWindow ~= nil then
			player.gui.center.TeleWindow.destroy()
		end
	end
end
]]--

-- NEW MULTIPLAYER FUNCTIONS

function gui_tick(player)
	if getGuiStatePerPlayer(player) == true then
		if player.gui.center.TeleWindow == nil then
			player.gui.center.add{type="frame", name="TeleWindow", caption="Teleportation Window", direction="horizontal"}
			drawWindow(player)
		end
		if getModePerPlayer(player) == "current" and getTeleporterPerPlayer(player) ~= nil and isTeleInCooldown(getTeleporterPerPlayer(player)) then
			if player.gui.center.TeleWindow.DetailsFrame.CooldownInfo == nil then
				player.gui.center.TeleWindow.DetailsFrame.add{type="flow", name="CooldownInfo", direction="horizontal"}
				player.gui.center.TeleWindow.DetailsFrame.CooldownInfo.add{type="label", caption="Seconds left:"}
				player.gui.center.TeleWindow.DetailsFrame.CooldownInfo.add{type="progressbar", name="CooldownProgress", size=getConfigValue("cooldown", getTier(getTeleporterPerPlayer(player))), style="teleporter-progress-bar"}
			end
			if player.gui.center.TeleWindow.DetailsFrame.CooldownInfo.CooldownProgress ~= nil then
				updateProgressBar(player, player.gui.center.TeleWindow.DetailsFrame.CooldownInfo.CooldownProgress)
			end
		elseif getModePerPlayer(player) == "current" and getTeleporterPerPlayer(player) ~= nil and isTeleInCooldown(getTeleporterPerPlayer(player)) == false then
			if player.gui.center.TeleWindow.DetailsFrame.CooldownInfo ~= nil then
				player.gui.center.TeleWindow.DetailsFrame.CooldownInfo.destroy()
			end
		end
	else
		if player.gui.center.TeleWindow ~= nil then
			player.gui.center.TeleWindow.destroy()
		end
	end
end

function setGuiStatePerPlayer(state, player, teleporter)
	if isPlayerInStateList(player) == false then
		guistate_per_player[arraylength(guistate_per_player)+1] = {p = player, s = state, t = teleporter, m = "links"}
		player.print("Assigned new ID "..arraylength(guistate_per_player).." to player "..player.name.. "with state "..tostring(state))
	else
		guistate_per_player[getPlayerStateID(player)].s = state
		guistate_per_player[getPlayerStateID(player)].t = teleporter
		guistate_per_player[getPlayerStateID(player)].m = "links"
		player.print("Player is already in list with ID "..getPlayerStateID(player).." with state "..tostring(state))
	end
end

function getGuiStatePerPlayer(player)
	if isPlayerInStateList(player) == false then
		setGuiStatePerPlayer(false, player, nil)
	else
		for k,v in ipairs(guistate_per_player) do
			if v.p == player then
				return v.s
			end
		end
	end
	
end

function getTeleporterPerPlayer(player)
	for k,v in ipairs(guistate_per_player) do
		if v.p == player then
			return v.t
		end
	end
	return nil
end

function setModePerPlayer(player, mode)
	guistate_per_player[getPlayerStateID(player)].m = mode
end

function getModePerPlayer(player)
	for k,v in ipairs(guistate_per_player) do
		if v.p == player then
			return v.m
		end
	end
	return "links"
end

function isPlayerInStateList(player)
	for k,v in ipairs(guistate_per_player) do
		if v.p == player then
			return true
		end
	end
	return false
end

function getPlayerStateID(player)
	for k,v in ipairs(guistate_per_player) do
		if v.p == player then
			return k
		end
	end
	return nil
end

-- END

function setGuiState(state, player, teleporter)
	guistate = state
	selected_teleporter = teleporter
	if state == false then
		mode = "links"
	end
end

function getGuiState()
	return guistate
end

function index2configValue(index)
	if index == 1 then return "power" end
	if index == 2 then return "buffer" end
	if index == 3 then return "distance" end
	if index == 4 then return "cooldown" end
end

function index2configName(index)
	if index == 1 then return "Teleport Power" end
	if index == 2 then return "Buffer Capacity" end
	if index == 3 then return "Maximum Distance" end
	if index == 4 then return "Cooldown Time" end
end

function index2configUnit(index)
	if index == 1 then return "MJ" end
	if index == 2 then return "MJ" end
	if index == 3 then return "Tiles" end
	if index == 4 then return "Seconds" end
end

function redrawWindow(p)
	if p.gui.center.TeleWindow == nil then
		return false
	end
	if p.gui.center.TeleWindow ~= nil then
		p.gui.center.TeleWindow.destroy()
		drawWindow(p)
	end
end

function updateProgressBar(player, bar)
	if selected_teleporter == nil then return end
	bar.value = getLeftCooldownTime(selected_teleporter)/getConfigValue("cooldown", getTier(selected_teleporter))
	if bar.value == 0 then
		player.print("bar value == 0")
		bar.destroy()
	end
end

function isDropDown(element)
	if string.sub(element.name, 1,9) == "DropDown_" then
		return true
	else
		return false
	end
end

function populateDropDowns(pr)
	--p.gui.center.TeleWindow.DetailsFrame.DropDown_1.
	if arraylength(global.links) >= 1 then
		for k,v in ipairs(global.links) do
			dropdowns[k] = pr.add{type="frame", name="DropDown_"..tostring(k), caption="Link #"..tostring(k), style="teleporter-dropdown"}
		end
		for k,v in ipairs(dropdownStates) do
			if v == true then
				expandDropDown(dropdowns[k])
			end
		end
	else
		pr.add{type="label", caption="No Links were made!"}.style.font_color = {r=1, g=1}
		pr.add{type="label", caption="Go ahead and make some!"}.style.font_color = {r=1, g=1}
	end
end

function getDropDownID(dropdown)
	local str = string.sub(dropdown.name,10,11) --DropDown_XX
	return tonumber(str)
end

function isDropDownExpanded(dropdown)
	if dropdown.DropDownFlow == nil then
		return false
	else
		return true
	end
end

function expandDropDown(dropdown)
	if isDropDown(dropdown) == false then return end
	
	dropdown.style = "teleporter-dropdown-selected"
	
	dropdownStates[getDropDownID(dropdown)] = true
	
	local a = global.links[getDropDownID(dropdown)].a
	local b = global.links[getDropDownID(dropdown)].b
	
	dropdown.add{type="flow", name="DropDownFlow", direction="vertical"}
	
	dropdown.DropDownFlow.add{type="flow", name="NonSideDetails", direction="vertical", style="teleporter-flow"}
	dropdown.DropDownFlow.NonSideDetails.add{type="flow", name="TierInfo", direction="horizontal"}
	dropdown.DropDownFlow.NonSideDetails.TierInfo.add{type="label", name="TierLabel1", caption="Tier:"}
	dropdown.DropDownFlow.NonSideDetails.TierInfo.add{type="label", name="TierLabel2", caption=getTier(a)}.style.font_color = value_font_color_links
	
	dropdown.DropDownFlow.NonSideDetails.add{type="flow", name="DistanceInfo", direction="horizontal"}
	dropdown.DropDownFlow.NonSideDetails.DistanceInfo.add{type="label", name="DistanceLabel1", caption="Distance:"}
	dropdown.DropDownFlow.NonSideDetails.DistanceInfo.add{type="label", name="DistanceLabel2", caption=round(getDistance(a,b),2).." Tiles"}.style.font_color = value_font_color_links
	
	dropdown.DropDownFlow.add{type="flow", name="SideDetails", direction="horizontal"}
	
	dropdown.DropDownFlow.SideDetails.add{type="frame", name="SideAInfo", caption="Teleporter 1", direction="vertical"}
	dropdown.DropDownFlow.SideDetails.SideAInfo.add{type="flow", name="aNameInfo", direction="horizontal"}
	dropdown.DropDownFlow.SideDetails.SideAInfo.aNameInfo.add{type="label", name="aName1", caption="Name:"}
	aDropdownNameFields[getDropDownID(dropdown)] = dropdown.DropDownFlow.SideDetails.SideAInfo.aNameInfo.add{type="textfield", name="aName2", style="teleporter-name-textfield"}
	aDropdownNameFields[getDropDownID(dropdown)].text = getName(a)
	dropdown.DropDownFlow.SideDetails.SideAInfo.aNameInfo.add{type="button", name="aSetNameButton_"..tostring(getDropDownID(dropdown)), caption="Set", style="teleporter-button-small"}
	dropdown.DropDownFlow.SideDetails.SideAInfo.add{type="flow", name="aCoordsInfo", direction="horizontal"}
	dropdown.DropDownFlow.SideDetails.SideAInfo.aCoordsInfo.add{type="label", name="aCoords1", caption="Coordinates:"}
	dropdown.DropDownFlow.SideDetails.SideAInfo.aCoordsInfo.add{type="label", name="aCoords2", caption=a.position.x..";"..a.position.y}.style.font_color = value_font_color
	
	dropdown.DropDownFlow.SideDetails.add{type="frame", name="SideBInfo", caption="Teleporter 2", direction="vertical"}	
	dropdown.DropDownFlow.SideDetails.SideBInfo.add{type="flow", name="bNameInfo", direction="horizontal"}
	dropdown.DropDownFlow.SideDetails.SideBInfo.bNameInfo.add{type="label", name="bName1", caption="Name:"}
	bDropdownNameFields[getDropDownID(dropdown)] = dropdown.DropDownFlow.SideDetails.SideBInfo.bNameInfo.add{type="textfield", name="bName2", style="teleporter-name-textfield"}
	bDropdownNameFields[getDropDownID(dropdown)].text = getName(b)
	dropdown.DropDownFlow.SideDetails.SideBInfo.bNameInfo.add{type="button", name="bSetNameButton_"..tostring(getDropDownID(dropdown)), caption="Set", style="teleporter-button-small"}
	dropdown.DropDownFlow.SideDetails.SideBInfo.add{type="flow", name="bCoordsInfo", direction="horizontal"}
	dropdown.DropDownFlow.SideDetails.SideBInfo.bCoordsInfo.add{type="label", name="bCoords1", caption="Coordinates:"}
	dropdown.DropDownFlow.SideDetails.SideBInfo.bCoordsInfo.add{type="label", name="bCoords2", caption=b.position.x..";"..b.position.y}.style.font_color = value_font_color
end

function closeDropDown(dropdown, player)
	if dropdown.DropDownFlow == nil then return end
	dropdown.DropDownFlow.destroy()
	dropdownStates[getDropDownID(dropdown)] = false
	redrawWindow(player)
end

function drawWindow(p)
	if p.gui.center.TeleWindow == nil then return end
	
	local h = p.gui.center.TeleWindow

	h.add{type="flow", name="TabFlow", direction="vertical"}
	h.TabFlow.add{type="button", name="Links_btn", caption="Links", style="teleporter-button"}
	h.TabFlow.add{type="button", name="Wiki_btn", caption="Wiki", style="teleporter-button"}
	if getTeleporterPerPlayer(p) == nil then
		h.TabFlow.add{type="button", name="Current_btn", caption="Current", style="teleporter-button-deactive"}
	else
		h.TabFlow.add{type="button", name="Current_btn", caption="Current", style="teleporter-button"}
	end
	h.TabFlow.add{type="button", name="Exit_btn", caption="Close", style="teleporter-button"}
	
	h.add{type="frame", name="DetailsFrame", direction="vertical"}
	
	local tierInfoFields = {}
	
	if getModePerPlayer(p) == "links" then
		populateDropDowns(h.DetailsFrame)
	elseif getModePerPlayer(p) == "wiki" then
		h.DetailsFrame.add{type="label", caption="Select a tier below to see its informations."}
		h.DetailsFrame.add{type="table", name="TierTable", colspan = 5}
		for i=1,10,1 do
			h.DetailsFrame.TierTable.add{type="button", name="TierButton"..tostring(i), caption="Tier "..tostring(i), style="teleporter-tier-button"}
		end
		if tier_details ~= 0 then
			h.DetailsFrame.add{type="frame", name="TierInfo", direction="vertical"}
			h.DetailsFrame.TierInfo.add{type="label", caption="Showing informations for Tier "..tostring(tier_details)}.style.font_color = value_font_color
			tierInfoFields = {}
			for i=1,4,1 do
				tierInfoFields[i] = h.DetailsFrame.TierInfo.add{type="flow", name="TierInfoField"..tostring(i), direction="horizontal"}
				tierInfoFields[i].add{type="label", caption=index2configName(i), style="teleporter-label-1"}
				tierInfoFields[i].add{type="label", caption=getConfigValue(index2configValue(i), tier_details).." "..index2configUnit(i)}.style.font_color = value_font_color
			end
		end
	elseif getModePerPlayer(p) == "current" then
		h.DetailsFrame.add{type="flow", name="CurrentName", direction="horizontal"}
		h.DetailsFrame.add{type="flow", name="CurrentInfo1", direction="horizontal"}
		h.DetailsFrame.add{type="flow", name="CurrentInfo2", direction="horizontal"}
		
		h.DetailsFrame.CurrentName.add{type="label", caption="Name: "}
		h.DetailsFrame.CurrentName.add{type="textfield", name="CurrentTeleporterName"}.text=getName(getTeleporterPerPlayer(p))
		h.DetailsFrame.CurrentName.add{type="button", name="CurrentNameSet_btn", caption="Set", style="teleporter-button-small"}
		h.DetailsFrame.CurrentInfo1.add{type="label", caption="Teleporter Tier: ", style="teleporter-label-1"}
		h.DetailsFrame.CurrentInfo1.add{type="label", caption=tostring(getTier(getTeleporterPerPlayer(p)))}.style.font_color = value_font_color
		h.DetailsFrame.CurrentInfo2.add{type="label", caption="Current Status: ", style="teleporter-label-1"}
		h.DetailsFrame.CurrentInfo2.add{type="label", caption=getState(getTeleporterPerPlayer(p))}.style.font_color = value_font_color
	end
end

script.on_event(defines.events.on_gui_click, 
	function(event)
		local p = game.players[event.player_index]
		--General Tab Button Switch
		if event.element.name == "Links_btn" then
			setModePerPlayer(p, "links")
			redrawWindow(p)
		elseif event.element.name == "Wiki_btn" then
			setModePerPlayer(p, "wiki")
			redrawWindow(p)
		elseif event.element.name == "Current_btn" then
			if getTeleporterPerPlayer(p) ~= nil then
				setModePerPlayer(p, "current")
				redrawWindow(p)
			end
		elseif event.element.name == "Exit_btn" then
			--setGuiState(false, p, nil)
			setGuiStatePerPlayer(false, p, nil)
		elseif string.sub(event.element.name,1,10) == "TierButton" then
			tier_details = tonumber(string.sub(event.element.name,11,12))
			redrawWindow(p)
		elseif event.element.name == "CurrentNameSet_btn" then
			if p.gui.center.TeleWindow.DetailsFrame.CurrentName.CurrentTeleporterName ~= nil then
				if p.gui.center.TeleWindow.DetailsFrame.CurrentName.CurrentTeleporterName ~='' then
					assignName(getTeleporterPerPlayer(p), p.gui.center.TeleWindow.DetailsFrame.CurrentName.CurrentTeleporterName.text, p)
				end
			end
		elseif isDropDown(event.element) then
			if isDropDownExpanded(event.element) then
				closeDropDown(event.element, p)
			else
				expandDropDown(event.element)
			end
		elseif string.sub(event.element.name, 1, 15) == "aSetNameButton_" then
			local index = tonumber(string.sub(event.element.name, 16, 17))
			local t_a = global.links[index].a
			local textfield = aDropdownNameFields[index]
			assignName(t_a, textfield.text, p)
		elseif string.sub(event.element.name, 1, 15) == "bSetNameButton_" then
			local index = tonumber(string.sub(event.element.name, 16, 17))
			local t_b = global.links[index].a
			local textfield = bDropdownNameFields[index]
			assignName(t_b, textfield.text, p)
		end
	end
)