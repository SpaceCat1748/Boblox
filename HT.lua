for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "Discord" then
       v:Destroy()
    end
end

function Owner()
    for i,v in pairs(game:GetService("Workspace").Tycoons:GetChildren()) do
        if v.Values.Owner.Value == game.Players.LocalPlayer then
            return v
        end
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

local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window(GetName.Name)

local serv = win:Server("gui", "")

local auf = serv:Channel("Farm")

auf:Toggle("Auto-Collect Money",false, function(state)
getgenv().collect = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().collect == true then
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Owner().Default.Mailbox.Collect.TouchInterest.Parent, 1)
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Owner().Default.Mailbox.Collect.TouchInterest.Parent, 0)
    end
end)
end)

auf:Toggle("Auto-Buy Buttons",false, function(state)
getgenv().bruh = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().bruh == true then
       for i,v in pairs(Owner().Buttons:GetChildren()) do
            if not v:FindFirstChild("Gamepass") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Head.TouchInterest.Parent, 1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Head.TouchInterest.Parent, 0)
            end
        end
    end
end)
end)

auf:Button("Buy all Cars for 1$", function()
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Main.Frame["Main Body"].Main.Shop.Cars.CarList.CarList:GetChildren()) do
    if v.ClassName == "Frame" then
        local args = {
            [1] = 1,
            [2] = v.Name,
            [3] = "purchase"
        }
        game:GetService("ReplicatedStorage").Remotes.CarShop:FireServer(unpack(args))
    end
end
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