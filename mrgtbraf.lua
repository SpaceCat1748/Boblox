game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16

getgenv().walk = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed;

local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

function Owner()
    for i,v in pairs(game:GetService("Workspace").Areas:GetChildren()) do
        if v.Owner.Value == game.Players.LocalPlayer then
            return v
        end
    end
end

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local VirtualInputManager = game:GetService('VirtualInputManager')

local player = game.Players.LocalPlayer

local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window(GetName.Name)

local serv = win:Server("gui", "")

local auf = serv:Channel("Farm")

auf:Button("Claim House", function()
function Get()
    for i,v in pairs(game:GetService("Workspace").Areas:GetChildren()) do
        if v.Owner.Value == nil then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.OutsidePos.CFrame * CFrame.new(0,0,-6)
        end
    end
end

Get()
end)

auf:Button("Tp to your house", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Owner().OutsidePos.CFrame * CFrame.new(0,0,-6)
end)


auf:Button("Get 2x Cash", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Obby.Easy.Start.CFrame
wait(0.5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Obby.Easy.Claim.CFrame
end)

auf:Toggle("Auto-Create and Release Game",false, function(state)
getgenv().farm = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().farm == true then
        local A_1 = 
        {
            [1] = "Release"
        }
        local Event = game:GetService("ReplicatedStorage").Events.Game
        Event:FireServer(A_1)
    end
end)
end)

auf:Toggle("Auto-Buy Buttons",false, function(state)
getgenv().buy = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().buy == true then
        for i,v in pairs(Owner().Buttons:GetDescendants()) do
            if v.Name == "TouchInterest" then
                firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 0)
                firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 1)
            end
        end
    end
end)
end)

auf:Toggle("Auto-Wake Up NPC",false, function(state)
getgenv().up = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().up == true then
        for i,v in pairs(Owner().ToBuy:GetChildren()) do
            if string.find(v.Name, "Friend") then
                fireproximityprompt(v.Desk.Main.ProximityPrompt)
            end
        end
    end
end)
end)

getgenv().amount = 1;

auf:Textbox("Amount Rebirth", "Type here!", true, function(v)
getgenv().amount = v
end)

auf:Toggle("Auto-Rebirth",false, function(state)
getgenv().Rebirth = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Rebirth == true then
        local A_1 = 
        {
            [1] = "Rebirth", 
            [2] = tonumber(getgenv().amount)
        }
        local Event = game:GetService("ReplicatedStorage").Events.Buy
        Event:FireServer(A_1)
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