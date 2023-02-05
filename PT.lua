for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "Discord" then
       v:Destroy()
    end
end

for i,v in pairs(game:GetService("Workspace")["Zednov's Tycoon Kit"].Tycoons:GetChildren()) do
    if v.Name == game.Players.LocalPlayer.Team.Name then
       game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.Entrance:FindFirstChildOfClass("Model").Head.CFrame
    end
end


game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16

getgenv().walk = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed;

local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local VirtualInputManager = game:GetService('VirtualInputManager')

local player = game.Players.LocalPlayer

function Owner()
    for i,v in pairs(game:GetService("Workspace")["Zednov's Tycoon Kit"].Tycoons:GetChildren()) do
        if v.Owner.Value == game.Players.LocalPlayer then
            return v
        end
    end
end

local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window(GetName.Name)

local serv = win:Server("gui", "")

local auf = serv:Channel("Farm")

auf:Toggle("Auto-Click on Button",false, function(state)
getgenv().Click = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Click == true then
            for i,v in pairs(Owner().PurchasedObjects:GetDescendants()) do
                if v.Name == "ClickDetector" then
                    fireclickdetector(v)
                end
            end
        end
    end)
end)

auf:Toggle("Auto-Collect Money",false, function(state)
getgenv().Collect = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Collect == true then
            firetouchinterest(player.Character.HumanoidRootPart, Owner().Essentials.Giver.TouchInterest.Parent, 0)
            firetouchinterest(player.Character.HumanoidRootPart, Owner().Essentials.Giver.TouchInterest.Parent, 1)
        end
    end)
end)

auf:Toggle("Auto-Buy Buttons",false, function(state)
getgenv().Buy = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Buy == true then
        for i,v in pairs(Owner().Buttons:GetDescendants()) do
            if v.Name == "TouchInterest" then
                firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 0)
                firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 1)
                end
            end
        end
    end)
end)

local msc = serv:Channel("Misc")

msc:Textbox("WalkSpeed", "Type here!", true, function(v)
getgenv().walk = v

game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().walk
end)

msc:Toggle("Toggle WalkSpeed",false, function(state)
getgenv().walk1 = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().walk1 == true then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().walk
    elseif getgenv().walk1 == false then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end)
end)



msc:Button("Infinity Jumps", function()
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		player.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
end)
