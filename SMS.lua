for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "Discord" then
       v:Destroy()
    end
end

eggTable = {}
for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Main.Eggs.EggsList:GetChildren()) do
    if v.ClassName == "Frame" then
        if not table.find(eggTable, v.Name) then
            table.insert(eggTable, v.Name)
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

auf:Toggle("Auto-Power",false, function(state)
getgenv().Click = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Click == true then
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v:FindFirstChild("Handle") then
               if v.Name ~= "Fist" then
                    player.Character.Humanoid:EquipTool(v)
                end
            end
        end
            local VirtualUser = game:service'VirtualUser'
            VirtualUser:CaptureController()
            VirtualUser:ClickButton1(Vector2.new(99999,99999))
        end
    end)
end)

auf:Toggle("Auto-Rebirth",false, function(state)
getgenv().Rebirth = state

while wait() do
    if getgenv().Rebirth == true then
local args = {
    [1] = "S_Controller_Rebirth_Rebirth",
    [2] = {}
}

game:GetService("ReplicatedStorage").Shared.Services["3 | Network"].RemoteEvent:FireServer(unpack(args))
        end
    end
end)

auf:Toggle("Auto-Claim Free BP",false, function(state)
getgenv().Claim = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Claim == true then
        for i= 1,10 do
local args = {
    [1] = "S_Controller_Battlepass_Claim",
    [2] = {
        [1] = i,
        [2] = "Free"
    }
}

game:GetService("ReplicatedStorage").Shared.Services["3 | Network"].RemoteFunction:InvokeServer(unpack(args))
end
        end
    end)
end)

local egg = serv:Channel("Egg")

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
    [1] = "S_Controller_Eggs_Buy",
    [2] = {
        [1] = selectedegg
    }
}

game:GetService("ReplicatedStorage").Shared.Services["3 | Network"].RemoteFunction:InvokeServer(unpack(args))
    end
end
end)

egg:Toggle("Auto-Equip Best", false, function(state)
getgenv().best = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().best == true then
local args = {
    [1] = "S_Controller_Pets_EquipBest",
    [2] = {}
}

game:GetService("ReplicatedStorage").Shared.Services["3 | Network"].RemoteEvent:FireServer(unpack(args))
    end
end)
end)

local upg = serv:Channel("Upgrades")

upg:Toggle("Auto-Upgrade Damage Multiplier",false, function(state)
getgenv().Damage = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Damage == true then
local args = {
    [1] = "S_Controller_Upgrades_Upgrade",
    [2] = {
        [1] = "Damage_Multiplier"
    }
}

game:GetService("ReplicatedStorage").Shared.Services["3 | Network"].RemoteEvent:FireServer(unpack(args))

        end
    end)
end)

upg:Toggle("Auto-Upgrade Health Multiplier",false, function(state)
getgenv().Health = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Health == true then
local args = {
    [1] = "S_Controller_Upgrades_Upgrade",
    [2] = {
        [1] = "Health_Multiplier"
    }
}

game:GetService("ReplicatedStorage").Shared.Services["3 | Network"].RemoteEvent:FireServer(unpack(args))
        end
    end)
end)

upg:Toggle("Auto-Upgrade JumpPower",false, function(state)
getgenv().JumpPower = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().JumpPower == true then
local args = {
    [1] = "S_Controller_Upgrades_Upgrade",
    [2] = {
        [1] = "Jump_Power"
    }
}

game:GetService("ReplicatedStorage").Shared.Services["3 | Network"].RemoteEvent:FireServer(unpack(args))

        end
    end)
end)


upg:Toggle("Auto-Upgrade WalkSpeed",false, function(state)
getgenv().WalkSpeed = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().WalkSpeed == true then
local args = {
    [1] = "S_Controller_Upgrades_Upgrade",
    [2] = {
        [1] = "Walk_Speed"
    }
}

game:GetService("ReplicatedStorage").Shared.Services["3 | Network"].RemoteEvent:FireServer(unpack(args))

        end
    end)
end)

upg:Toggle("Auto-Upgrade Pet Space",false, function(state)
getgenv().Pet = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Pet == true then
local args = {
    [1] = "S_Controller_Upgrades_Upgrade",
    [2] = {
        [1] = "Pet_Space"
    }
}

game:GetService("ReplicatedStorage").Shared.Services["3 | Network"].RemoteEvent:FireServer(unpack(args))

        end
    end)
end)

upg:Toggle("Auto-Upgrade Inventory Space",false, function(state)
getgenv().Inventory = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Inventory == true then
local args = {
    [1] = "S_Controller_Upgrades_Upgrade",
    [2] = {
        [1] = "Inventory_Space"
    }
}

game:GetService("ReplicatedStorage").Shared.Services["3 | Network"].RemoteEvent:FireServer(unpack(args))

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
