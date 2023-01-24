for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "Discord" then
       v:Destroy()
    end
end

function Owner()
    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
        if string.find(v.Name, "Tycoon") then
            if string.find(v.Name, game.Players.LocalPlayer.Name) then
                return v
            end
        end
    end
end

for i,v in pairs(Owner():GetChildren()) do
    if string.find(v.Name, "Floor") then
        if v.Contents.Name == "Gamepasses" then
            v:Remove()
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
getgenv().collectv1 = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().collectv1 == true then
        local A_1 = "RequestCollectCash"
        local Event = game:GetService("ReplicatedStorage").RemoteEvent
        Event:FireServer(A_1)
    end
end)
end)

auf:Toggle("Auto-Buy Buttons",false, function(state)
getgenv().buyt = state

while wait() do
    if getgenv().buyt == true then
        for i,v in pairs(Owner():GetChildren()) do
            if string.find(v.Name, "Floor") then
                for i,l in pairs(v:GetDescendants()) do
                     firetouchinterest(player.Character.HumanoidRootPart, l.Parent, 0)
                     firetouchinterest(player.Character.HumanoidRootPart, l.Parent, 1)
                end
            end
        end
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