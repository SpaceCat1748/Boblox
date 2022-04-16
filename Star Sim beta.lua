local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window("Star Simulator Beta | SpaceCat#1748")

local serv = win:Server("Lol", "")

local guns = serv:Channel("General")


guns:Toggle("Auto Farm (Laggy)",false, function(state)
    getgenv().Autofarm = state 

while Autofarm do
    wait()
    local ok = tostring("Star_"..game.Players.LocalPlayer.Name)
    for i,v in pairs(game:GetService("Workspace")[ok].Player:GetDescendants()) do
        if v.ClassName == "Model" and v:FindFirstChild("RefreshHP") then
            for z = 1, 8 do
                game:GetService("ReplicatedStorage").Attack.UpdateHPEvent:FireServer(v, "Axe")        
                game:GetService("ReplicatedStorage").Attack.UpdateHPEvent:FireServer(v, "Pickaxe")
            end
        end
    end
end
end)

guns:Button("Rejoin(Fix farm)", function()
local ts = game:GetService("TeleportService")
local p = game:GetService("Players").LocalPlayer

ts:Teleport(game.PlaceId, p)
end)

guns:Button("Unlock All island", function()
    for _, player in next, game.Players:GetChildren() do
        for _, land in next, workspace["Star_"..player.Name].Player.Land:GetChildren() do
            game.ReplicatedStorage.PlayerData.Unlocker.LandShow:FireServer(land)
        end
    end
end)

local player = serv:Channel("Player's Scripts")

local speed = player:Slider("WalkSpeed", 0, 1000, 400, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)
    
player:Button("Normal WalkSpeed", function()
    speed:Change(15)
end)

local jump = player:Slider("JumpPower", 0, 1000, 400, function(v)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end)