for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "Discord" then
       v:Destroy()
    end
end

function Owner()
    for i,v in pairs(game:GetService("Workspace").Plots:GetChildren()) do
        if v.Owner.Value == game.Players.LocalPlayer then
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

auf:Button("X2 Money", function()
local kek = require(game:GetService("ReplicatedStorage").Modules.Client.LocalMarketModule)

kek.Owns = function() return true end
end)

auf:Toggle("Auto-Farm",false, function(state)
getgenv().afarmv4 = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().afarmv4 == true then
    for i,v in pairs(Owner().Customers:GetChildren()) do
    local args = {
        [1] = v
    }

    game:GetService("ReplicatedStorage").Communication.CustomerOrder:FireServer(unpack(args))
    local args = {
        [1] = v
    }

    game:GetService("ReplicatedStorage").Communication.ServeCustomer:FireServer(unpack(args))
    end

for i,v in pairs(Owner().Objects:GetChildren()) do
    if v:FindFirstChild("Item") and v:FindFirstChild("InUse") then
       for i,l in pairs(Owner().Customers:GetChildren()) do
       if l:GetAttribute("Item") == v.Item.Value then
          game:GetService("ReplicatedStorage").Communication.UseTrash:FireServer()
          local args = {
    [1] = v,
    [2] = false
}

game:GetService("ReplicatedStorage").Communication.UseMachine:FireServer(unpack(args)) 
local argsv2 = {
    [1] = v,
    [2] = true
}
game:GetService("ReplicatedStorage").Communication.UseMachine:FireServer(unpack(argsv2)) 
       end
    end
end
end
    end
end)
end)

auf:Toggle("Auto-Claim Playtime Rewards", false, function(state)
getgenv().ac = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().ac == true then
       for i = 1,9 do
        local args = {
        [1] = i
        }

        game:GetService("ReplicatedStorage").Communication.ClaimPlaytimeReward:InvokeServer(unpack(args))
        end
    end
end)
end)

auf:Toggle("Auto-Buy Upgrades", false, function(state)
getgenv().ab = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().ab == true then
       for i = 1,6 do
local args = {
    [1] = i
}

game:GetService("ReplicatedStorage").Communication.BuyUpgrade:FireServer(unpack(args))
        end
    end
end)
end)

auf:Toggle("Auto-Upgrade Machine", false, function(state)
getgenv().ab = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().ab == true then
for i,v in pairs(Owner().Objects:GetChildren()) do
    if v:FindFirstChild("InUse") and v:FindFirstChild("Item") then
local args = {
    [1] = v.Item.Value
}

game:GetService("ReplicatedStorage").Communication.UpgradeMachine:FireServer(unpack(args))
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