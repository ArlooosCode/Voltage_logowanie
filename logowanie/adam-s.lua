local logs = "https://discordapp.com/api/webhooks/668819145403662347/A1CxKfPxDKbhQK-K61SmMfurE9s7p1viqSB8Cwrx4Q8BHCTfp5jxq50K4ew2P6MOpPRN"
local lconnect = "**Zaćmienie**"
AddEventHandler("onServerResourceStart", function(resource)
    if GetCurrentResourceName() == resource then
        local servername = GetConvar("sv_hostname","nigga")
        local client = GetConvar("sv_maxclients", "suka")
        local connect = lconnect.."\n`Wyspa ON` "
        PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "VoltageRP - Logowanie", content = connect}), { ['Content-Type'] = 'application/json' })
    end
end)