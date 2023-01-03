local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

function Owner() 
    for i,v in pairs(game:GetService("Workspace").Plots:GetChildren()) do
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

local player = game.Players.LocalPlayer

local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window(GetName.Name)

local serv = win:Server("gui", "")

local auf = serv:Channel("farm")

auf:Label("For better farming, take the plot closer to the Clothes Chute")

auf:Toggle("Auto-Grab Clothing",false, function(state)
getgenv().agc = state

while wait() do
    if getgenv().agc == true then
        for i,v in pairs(game:GetService("Workspace").Debris.Clothing:GetChildren()) do
            if v.ClassName == "MeshPart" then
                local A_1 = v
                local Event = game:GetService("ReplicatedStorage").Events.GrabClothing
                Event:FireServer(A_1)
            end
        end
    end
end
end)

auf:Toggle("Auto-Load Washing Machine",false, function(state)
getgenv().alwm = state

while wait() do
    if getgenv().alwm == true then
        for i,v in pairs(Owner().WashingMachines:GetChildren()) do
            if v.ClassName == "Model" then
                local A_1 = v
                local Event = game:GetService("ReplicatedStorage").Events.LoadWashingMachine
                Event:FireServer(A_1)
            end
        end
    end
end
end)

auf:Toggle("Auto-Unload Washing Machine",false, function(state)
getgenv().auwm = state

while wait() do
    if getgenv().auwm == true then
        for i,v in pairs(Owner().WashingMachines:GetChildren()) do
            if v.ClassName == "Model" then
                local A_1 = v
                local Event = game:GetService("ReplicatedStorage").Events.UnloadWashingMachine
                Event:FireServer(A_1)
            end
        end
    end
end
end)

auf:Toggle("Auto-Drop Clothes In Chute",false, function(state)
getgenv().adc = state

while wait() do
    if getgenv().adc == true then
        local Event = game:GetService("ReplicatedStorage").Events.DropClothesInChute
        Event:FireServer()
    end
end
end)

auf:Button("Get Gamepasses(but only works x2 coins)", function()
for i,v in pairs(game:GetService("Players").LocalPlayer.Gamepasses:GetChildren()) do
    if v.ClassName == "BoolValue" then
        v.Value = true
    end
end
end)

local msc = serv:Channel("Misc")

msc:Textbox("WalkSpeed", "Type here!", true, function(v) -- текстовой бокс для изменения Скорости
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
