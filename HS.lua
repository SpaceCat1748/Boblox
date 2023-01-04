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

local auf = serv:Channel("farm")

auf:Toggle("Auto-Pay",false, function(state)
getgenv().ap = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().ap == true then
        local A_1 = game:GetService("Players").LocalPlayer
        local Event = game:GetService("ReplicatedStorage").Knit.Services.TycoonService.RF.PayIncome
        Event:InvokeServer(A_1)
    end
end)
end)

auf:Toggle("Auto-Buy Buttons",false, function(state)
getgenv().ab = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().ab == true then
        for i,v in pairs(game:GetService("Workspace").Tycoons:GetChildren()) do
            if v:GetAttribute("Owner") == game.Players.LocalPlayer.Name then
                for i,l in pairs(v.Buttons:GetChildren()) do
                    if l.ClassName == "Model" then
                        if not string.find("GAMEPASS", l.Top.SurfaceGui.Name) then
                            firetouchinterest(player.Character.HumanoidRootPart, l.Top.TouchInterest.Parent, 0)
                            firetouchinterest(player.Character.HumanoidRootPart, l.Top.TouchInterest.Parent, 1)
                        end
                    end
                end
            end
        end
    end
end)
end)

auf:Toggle("Auto-Rebirth",false, function(state)
getgenv().ar = state

while wait() do
    if getgenv().ar == true then
        local Event = game:GetService("ReplicatedStorage").Knit.Services.TycoonService.RF.Rebirth
        Event:InvokeServer()
    end
end
end)

local msc = serv:Channel("Misc")


msc:Textbox("WalkSpeed", "Type here!", true, function(v)
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