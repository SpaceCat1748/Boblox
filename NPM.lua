local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local player = game.Players.LocalPlayer

local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window(GetName.Name)

local serv = win:Server("gui", "")

local tgls = serv:Channel("Menu")

tgls:Button("Go to Start", function()
player.Character.Humanoid:MoveTo(game:GetService("Workspace")["MATCHMAKING_REGIONS"].TEAM.TeamQueue.Position)
end)

tgls:Button("Free Spin", function()
local Event = game:GetService("ReplicatedStorage").Packages["_Index"]["sleitnick_knit@1.4.2"].knit.Services.WheelSpinService.RF.GetReward
Event:InvokeServer()
end)
