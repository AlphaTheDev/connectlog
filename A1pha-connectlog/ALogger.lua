local logs = "https://discord.com/api/webhooks/917506614796365835/i8diGHP1-cxZeS036Za-1lFh-Sh59jlMnIskpk0A7jsSsEx-Stp_GFcnJcD5rzjgE-kT"
local communityname = "A1pha Logs"
local communtiylogo = "https://media.discordapp.net/attachments/916117958823141376/917508332670033930/A1pha-Logo.png?width=461&height=461" --Skal være en .png eller .jpg

AddEventHandler('playerConnecting', function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local connect = {
        {
            ["color"] = "8663711",
            ["title"] = "Spiller Joinede Server #1",
            ["description"] = "Spiller: **"..name.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }

PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "A1pha Logs", embeds = connect}), { ['Content-Type'] = 'application/json' })
end)

AddEventHandler('playerDropped', function(reason)
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local disconnect = {
        {
            ["color"] = "8663711",
            ["title"] = "Spiller Gik Ud Af Server #1",
            ["description"] = "Spiller: **"..name.."** \nReason: **"..reason.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }

    PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "A1pha Logs", embeds = disconnect}), { ['Content-Type'] = 'application/json' })
end)
