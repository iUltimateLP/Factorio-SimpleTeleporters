require "defines"

guistate = false
selected_teleporter = nil
mode = "links"
tier_details = 0

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

function drawWindow(p)
	if p.gui.center.TeleWindow == nil then return end
	
	local h = p.gui.center.TeleWindow

	h.add{type="flow", name="TabFlow", direction="vertical"}
	h.TabFlow.add{type="button", name="Links_btn", caption="Links", style="teleporter-button"}
	h.TabFlow.add{type="button", name="Wiki_btn", caption="Wiki", style="teleporter-button"}
	if selected_teleporter == nil then
		h.TabFlow.add{type="button", name="Current_btn", caption="Current", style="teleporter-button-deactive"}
	else
		h.TabFlow.add{type="button", name="Current_btn", caption="Current", style="teleporter-button"}
	end
	
	h.add{type="frame", name="DetailsFrame", direction="vertical"}
	
	local tierInfoFields = {}
	
	local linkItems = {}

	
	if mode == "links" then
		linkItems = {}
		for k,v in ipairs(global.links) do
			-- MasterFrame (frame)
			-- ╚ NonSideDetails (flow)
			--   ╚ LinkInfo (flow)
			--     ╚ LinkLabel1 (label)
			--     ╚ LinkLabel2 (label)
			--   ╚ TierInfo (flow)
			--     ╚ TierLabel1 (label)
			--	   ╚ TierLabel2 (label)
			--   ╚ DistanceInfo (flow)
			--     ╚ DistanceLabel1 (label)
			--     ╚ DistanceLabel2 (label)
			-- ╚ TeleportersInfo (flow)
			--   ╚ SideAInfo (frame)
			--     ╚ aNameInfo (flow)
			--       ╚ aName1 (label)
			--       ╚ aName2 (textfield)
			--       ╚ aSetNameBtn (button)
			--     ╚ aCoordsInfo (flow)
			--       ╚ aCoords1 (label)
			--       ╚ aCords2 (label)
			--   ╚ SideBInfo (frame)
			--     ╚ bNameInfo (flow)
			--       ╚ bName1 (label)
			--       ╚ bName2 (textfield)
			--       ╚ bSetNameBtn (button)
			--     ╚ bCoordsInfo (flow)
			--       ╚ bCoords1 (label)
			--       ╚ bCoords2 (label)
		end
	elseif mode == "wiki" then
		h.DetailsFrame.add{type="label", caption="Select a tier below to see its informations."}
		h.DetailsFrame.add{type="table", name="TierTable", colspan = 5}
		for i=1,10,1 do
			h.DetailsFrame.TierTable.add{type="button", name="TierButton"..tostring(i), caption="Tier "..tostring(i), style="teleporter-tier-button"}
		end
		if tier_details ~= 0 then
			h.DetailsFrame.add{type="frame", name="TierInfo", direction="vertical"}
			h.DetailsFrame.TierInfo.add{type="label", caption="Showing informations for Tier "..tostring(tier_details)}.style.font_color = {r=1,g=1}
			tierInfoFields = {}
			for i=1,4,1 do
				tierInfoFields[i] = h.DetailsFrame.TierInfo.add{type="flow", name="TierInfoField"..tostring(i), direction="horizontal"}
				tierInfoFields[i].add{type="label", caption=index2configName(i), style="teleporter-label-1"}
				tierInfoFields[i].add{type="label", caption=getConfigValue(index2configValue(i), tier_details).." "..index2configUnit(i)}.style.font_color = {r=1, g=1}
			end
		end
	elseif mode == "current" then
		h.DetailsFrame.add{type="flow", name="CurrentName", direction="horizontal"}
		h.DetailsFrame.add{type="flow", name="CurrentInfo1", direction="horizontal"}
		h.DetailsFrame.add{type="flow", name="CurrentInfo2", direction="horizontal"}
		
		h.DetailsFrame.CurrentName.add{type="label", caption="Name: "}
		h.DetailsFrame.CurrentName.add{type="textfield", name="CurrentTeleporterName"}.text=getName(selected_teleporter)
		h.DetailsFrame.CurrentName.add{type="button", name="CurrentNameSet_btn", caption="Set", style="teleporter-button-small"}
		h.DetailsFrame.CurrentInfo1.add{type="label", caption="Teleporter Tier: ", style="teleporter-label-1"}
		h.DetailsFrame.CurrentInfo1.add{type="label", caption=tostring(getTier(selected_teleporter))}.style.font_color = {r=1, g=1}
		h.DetailsFrame.CurrentInfo2.add{type="label", caption="Current Status: ", style="teleporter-label-1"}
		h.DetailsFrame.CurrentInfo2.add{type="label", caption=getState(selected_teleporter)}.style.font_color = {r=1,g=1}
	end
end

game.on_event(defines.events.on_gui_click, 
	function(event)
		local p = game.players[event.player_index]
		--General Tab Button Switch
		if event.element.name == "Links_btn" then
			mode = "links"
			redrawWindow(p)
		elseif event.element.name == "Wiki_btn" then
			mode = "wiki"
			redrawWindow(p)
		elseif event.element.name == "Current_btn" then
			if selected_teleporter ~= nil then
				mode = "current"
				redrawWindow(p)
			end
		elseif string.sub(event.element.name,1,10) == "TierButton" then
			tier_details = tonumber(string.sub(event.element.name,11,12))
			redrawWindow(p)
		elseif event.element.name == "CurrentNameSet_btn" then
			if p.gui.center.TeleWindow.DetailsFrame.CurrentName.CurrentTeleporterName ~= nil then
				if p.gui.center.TeleWindow.DetailsFrame.CurrentName.CurrentTeleporterName ~='' then
					assignName(selected_teleporter, p.gui.center.TeleWindow.DetailsFrame.CurrentName.CurrentTeleporterName.text, p)
				end
			end
		elseif string.sub(event.element.name, 2,12) == "SetNameBtn_" then
			local field = string.sub(event.element.name, 1, 1)
			local index = string.sub(event.element.name, 13, 14)
			local value_a = a_fields[index]
			local value_b = b_fields[index]
			p.print("Index = "..index.." field = "..field)
			if field == "a" then
				p.print("Field a! Val="..value_a)
			elseif field == "b" then
				p.print("Field b! Val="..value_b)
			else
				p.print("Something")
			end
		end
	end
)