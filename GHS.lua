local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local A_1 = 
{
	["request"] = "ClaimReward"
}
local Event = game:GetService("ReplicatedStorage").Remotes.Timers.DailyRewardHandler
Event:InvokeServer(A_1)


local player = game.Players.LocalPlayer

local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window(GetName.Name)

local serv = win:Server("gui", "")

local auf = serv:Channel("farm")

auf:Toggle("Auto-Lift",false, function(state)
getgenv().af = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().af == true then
        local Event = game:GetService("ReplicatedStorage").Remotes.LiftWeight
        Event:FireServer()
    end
end)
end)

auf:Button("TP to Koth", function()
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Islands.KOTHIsland.MidLightFix.CFrame
end)

auf:Toggle("Auto-Sell",false, function(state)
getgenv().sell = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().sell == true then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.3260040283203, 165.4421844482422, 156.2530059814453)
		 local Event = game:GetService("ReplicatedStorage").Remotes.SellStrengthRequest
		 Event:FireServer()
    end
end)
end)




local ab = serv:Channel("Auto-Buy")

ab:Toggle("Auto-Buy Weight",false, function(state)
getgenv().weight = state

while wait() do
    if getgenv().weight == true then
		local A_1 = "Weight"
		local A_2 = "Islands"
		local Event = game:GetService("ReplicatedStorage").Remotes.Shop.RequestBuyAll
		Event:InvokeServer(A_1, A_2)
    end
end
end)



local msc = serv:Channel("Misc")


msc:Textbox("WalkSpeed", "Type here!", true, function(v)
     game:GetService("Players").LocalPlayer.PlayerData.Settings.Speed.Value = v
     game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)


msc:Button("Infinity Jumps", function()
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		player.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
end)