for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "Discord" then
       v:Destroy()
    end
end

eggTable = {}
for _,v in pairs(game:GetService("Workspace").Eggs:GetChildren()) do
    if not table.find(eggTable, v.Name) then
       table.insert(eggTable, v.Name)
    end
end

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

auf:Toggle("Auto-Win Race",false, function(state)
getgenv().afv3 = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().afv3 == true then
        for i,v in pairs(game:GetService("Workspace").CurrentMap:GetChildren()) do
            if v:FindFirstChild("WinPart") then
                firetouchinterest(game.Players.LocalPlayer.Character.Head, v.WinPart.TouchInterest.Parent, 0)
                firetouchinterest(game.Players.LocalPlayer.Character.Head, v.WinPart.TouchInterest.Parent, 1)
            end
        end
    end
end)
end)

auf:Toggle("Auto-Redeem Gifts",false, function(state)
getgenv().Redeem = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Redeem == true then
        for i= 1,8 do
local args = {
    [1] = i
}

game:GetService("ReplicatedStorage").Events.ClaimReward:FireServer(unpack(args))
        end
    end
end)
end)

local egg = serv:Channel("Eggs")

local selectedegg
local drop = egg:Dropdown("Pick Egg", eggTable, function(v)
print(v)
selectedegg = v
end)

egg:Toggle("Auto-Buy Egg", false, function(state)
getgenv().buy1 = state

while wait() do
    if getgenv().buy1 == true then
local args = {
    [1] = workspace.Eggs[selectedegg],
    [2] = false
}

game:GetService("ReplicatedStorage").GlobalFunctions.PurchasePet:FireServer(unpack(args))

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
