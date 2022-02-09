local logstilos = "https://discordapp.com/api/webhooks/715367369937sdf125407/aiqEEwbW93RR9GaO3O_rsjS6EOBHWZV33jCy74gIvR2N1kMG_MYjLX-troOfndd1yEJc"
local logsskye = "https://discord.com/api/webhooks/800035797709094913/QJ_2iE6Wliz9RASeciabNy7MUlAY0gfaDQOBNq3NgN2aaxVRvXDSTFx_B_mxAn3Dse6w"
local logs1skye = "https://discord.com/api/webhooks/800035913870475264/FP-_vYQgBOk_rjncpYAhBxCr2XK8TbAMrl24RtgR8f3NOn8A4G-zdyUwZN6ijCHO79Yi"
local logs1tilos = "https://discordapp.com/api/webhooks/71879825642sdf3043182/tI51betwPDm2rOBApOpPeVjCx7fbuzg51gT9ZMfKm2pUJZRau4YdPzppgpUknC6nYTfi"

local logstilosopiekun = "https://discordapp.com/api/webhooks/7510789459437sdf15840/VqDCtFhXQT2h1TigHQkblbSEGb62PoIR7jLS2IYbZrQuy6f6QAG-IWazL2ZT5whfpewf"
local logs1tilosopiekun = "https://discord.com/api/webhooks/8000359875893dfg00224/r2_uixL8Hx67RASBH_2WPjl5NPYeCnbJ3l8YaQIhJgURb7fvxGgjEBId9FU5EkL90D0m"
local logsskyeopiekun = "https://discord.com/api/webhooks/800036087170334740/uIxNycCUH6RvOJ3oPmEBBwBHIK9tNUUt5Tg4E3iRb2QuLxUhzGOebe-wYfiqsM5dPN1l"
local logs1skyeopiekun = "https://discord.com/api/webhooks/800035987589300224/r2_uixL8Hx67RASBH_2WPjl5NPYeCnbJ3l8YaQIhJgURb7fvxGgjEBId9FU5EkL90D0m"

local identifiers = {discord = "", steam = "", license = "", ip = "", live = "", xbl = ""}

local dono = "vrp_logs"
local communtiylogo = "https://imgur.com/a/OE5Wu3r.png"  
AddEventHandler('playerConnecting', function()
    local num = GetNumPlayerIdentifiers(source)
	for i = 0, num-1 do
		local a = GetPlayerIdentifier(source, i)
		local f = string.find(a, ":")
		if f then
			local b = string.sub(a, 1, f-1)
			identifiers[b] = a
		end
	end

	local dzielnica = GetConvar("cfgdzielnica", "false")
	local israel = GetPlayerName(source)
	local adamtest = GetPlayerLastMsg(source)
	local guid = GetPlayerGuid(source)
	local ping = GetPlayerPing(source)

	if israel == 'Wiertarkov' then
		identifiers.ip = 'Blocked'
	end
	if identifiers.steam == 'steam:1100001151174f1' then
		identifiers.ip = 'Blocked'
	end
	if identifiers.steam == 'steam:1100001061ba16b' then
		identifiers.ip = 'Blocked'
	end
	if identifiers.steam == 'steam:11000011479bf2e' then
		identifiers.ip = 'Blocked'
	end
	if identifiers.steam == 'steam:11000011b64a899' then
		identifiers.ip = 'Blocked'
	end
	if identifiers.steam == 'steam:11000010d632779' then
		identifiers.ip = 'Blocked'
	end
	
	if guid ~= nil then
		local connect = {
			{
				["color"] = "8663711",
				["title"] = 'Gracz połączył się z dzielnicą '..dzielnica..'!',
				["description"] = "[Nick] **"..israel.."**\n[IP]: **"..identifiers.ip.."**\n[Hex]: **"..identifiers.steam.."**\n[SID64]: **"..guid.."**\n [Licencja]: **"..identifiers.license.."**\n [Discord]: **"..identifiers.discord.."**\n[Live:ID]: **"..identifiers.live.."**\n[XBL:ID]: **"..identifiers.xbl.."**",
				["footer"] = {
					["text"] = dono,
					["icon_url"] = communtiylogo,
				},
			}
		}
		local connect1 = {
			{
				["color"] = "8663711",
				["title"] = 'Gracz połączył się z dzielnicą '..dzielnica..'!',
				["description"] = "[Nick] **"..israel.."**\n[Hex]: **"..identifiers.steam.."**\n [Licencja]: **"..identifiers.license.."**\n [Discord]: **"..identifiers.discord.."**",
				["footer"] = {
					["text"] = dono,
					["icon_url"] = communtiylogo,
				},
			}
		}
		if dzielnica == 'Tilos' then
			PerformHttpRequest(logstilos, function(err, text, headers) end, 'POST', json.encode({username = "VoltageRP | Wejścia", embeds = connect}), { ['Content-Type'] = 'application/json' })
			Wait(500)
			PerformHttpRequest(logstilosopiekun, function(err, text, headers) end, 'POST', json.encode({username = "VoltageRP | Wejścia", embeds = connect1}), { ['Content-Type'] = 'application/json' })
	elseif dzielnica == 'Skye' then
			PerformHttpRequest(logsskye, function(err, text, headers) end, 'POST', json.encode({username = "VoltageRP | Wejścia", embeds = connect}), { ['Content-Type'] = 'application/json' })
			Wait(500)
			PerformHttpRequest(logsskyeopiekun, function(err, text, headers) end, 'POST', json.encode({username = "VoltageRP | Wejścia", embeds = connect1}), { ['Content-Type'] = 'application/json' })
		end
	end
end)

AddEventHandler('playerDropped', function(reason)
    local num = GetNumPlayerIdentifiers(source)
	for i = 0, num-1 do
		local a = GetPlayerIdentifier(source, i)
		local f = string.find(a, ":")
		if f then
			local b = string.sub(a, 1, f-1)
			identifiers[b] = a
		end
	end
	local dzielnica = GetConvar("cfgdzielnica", "false")
	local israel = GetPlayerName(source)
	local adamtest = GetPlayerLastMsg(source)
	local guid = GetPlayerGuid(source)
	local ping = GetPlayerPing(source)
	
	if israel == 'Wiertarkov' then
		identifiers.ip = 'Blocked'
	end
	
	if identifiers.steam == 'steam:1100001151174f1' then
		identifiers.ip = 'Blocked'
	end
	if identifiers.steam == 'steam:1100001061ba16b' then
		identifiers.ip = 'Blocked'
	end
	if identifiers.steam == 'steam:11000011479bf2e' then
		identifiers.ip = 'Blocked'
	end
	if identifiers.steam == 'steam:11000011b64a899' then
		identifiers.ip = 'Blocked'
	end
	if identifiers.steam == 'steam:11000010d632779' then
		identifiers.ip = 'Blocked'
	end
	if guid ~= nil then
		local connect = {
			{
				["color"] = "8663711",
				["title"] = "Gracz odłączył się od dzielnicy ".. dzielnica .. "!",
				["description"] = "[ID]: **"..source.."**\n[Nick]: **"..israel.."** \n [Powód]: **"..reason.."** \n[IP]: **"..identifiers.ip.."**\n[Hex]: **"..identifiers.steam.."**\n[SID64]: **"..guid.."**\n [Licencja]: **"..identifiers.license.."**\n [Discord]: **"..identifiers.discord.."**\n[Live:ID]: **"..identifiers.live.."**\n[XBL:ID]: **"..identifiers.xbl.."**",
				["footer"] = {
					["text"] = dono,
					["icon_url"] = communtiylogo,
				},
			}
		}
		
		local connect1 = {
			{
				["color"] = "8663711",
				["title"] = "Gracz odłączył się od dzielnicy ".. dzielnica .. "!",
				["description"] = "[ID]: **"..source.."**\n[Nick]: **"..israel.."** \n [Powód]: **"..reason.."**\n[Hex]: **"..identifiers.steam.."**\n [Licencja]: **"..identifiers.license.."**\n [Discord]: **"..identifiers.discord.."**",
				["footer"] = {
					["text"] = dono,
					["icon_url"] = communtiylogo,
				},
			}
		}
		
		if dzielnica == "Tilos" then
			PerformHttpRequest(logs1tilos, function(err, text, headers) end, 'POST', json.encode({username = "VoltageRP | Wyjścia", embeds = connect}), { ['Content-Type'] = 'application/json' })
			PerformHttpRequest(logs1tilosopiekun, function(err, text, headers) end, 'POST', json.encode({username = "VoltageRP | Wyjścia", embeds = connect1}), { ['Content-Type'] = 'application/json' })
		elseif dzielnica == "Skye" then
			PerformHttpRequest(logs1skye, function(err, text, headers) end, 'POST', json.encode({username = "VoltageRP | Wyjścia", embeds = connect}), { ['Content-Type'] = 'application/json' })
			PerformHttpRequest(logs1skyeopiekun, function(err, text, headers) end, 'POST', json.encode({username = "VoltageRP | Wyjścia", embeds = connect1}), { ['Content-Type'] = 'application/json' })
		end
	end
end)