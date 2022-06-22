local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window("SKYWARS | SpaceCat#1748")

local serv = win:Server("Lol", "")

local guns = serv:Channel("General")

guns:Toggle("inf Jumps",false, function(state)
    local InfiniteJumpEnabled = state
    game:GetService("UserInputService").JumpRequest:connect(function()
        if InfiniteJumpEnabled then
            game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
        end
    end)
end)

guns:Button("ESP", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua',true))()
end)

guns:Button("Infinity Yield", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

guns:Button("Rejoin", function()
local ts = game:GetService("TeleportService")
local p = game:GetService("Players").LocalPlayer

ts:Teleport(game.PlaceId, p)
end)

local TP = serv:Channel("TP")

TP:Button("Tp to VIP Room", function()
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1.092299584115608e-10, 263.9999084472656, -70)
end)


TP:Button("Tp to Mega VIP Room", function()
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2.4351720639970154e-10, 263.9999084472656, 70)
end)

TP:Button("Tp to Group Room", function()
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(128, 263.9999084472656, -4.7378125600516796e-07)
end)

playerTable = {}
for _,v in pairs(game:GetService("Players"):GetChildren()) do
   if v.Name ~= game.Players.LocalPlayer.Name then
       table.insert(playerTable, v.Name)
   end
end
   
local selectedplayer
TP:Dropdown("Select Player to TP", playerTable, function(value)
    print(value)
    selectedplayer = value
end)

TP:Button("Tp to Selected Player", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[selectedplayer].Character.HumanoidRootPart.CFrame
end)