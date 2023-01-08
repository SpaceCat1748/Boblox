local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local player = game.Players.LocalPlayer

local vim = game:GetService('VirtualInputManager')

local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window(GetName.Name)

local serv = win:Server("gui", "")

local auf = serv:Channel("farm")

local part = Instance.new("Part",workspace)
    part.Name = "BS"
    part.Position = Vector3.new(999,5,999)
    part.Size = Vector3.new(100,0.5,100)
    part.Transparency = 0
    part.Anchored = true 
    part.Material = Enum.Material.SmoothPlastic
    part.TopSurface = Enum.SurfaceType.Smooth
    part.BottomSurface = Enum.SurfaceType.Smooth


auf:Toggle("Auto-Farm Energy",false, function(state)
getgenv().af = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().af == true then
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v:FindFirstChild("weightClientScript") then
                game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(v)
            end
        end
        local VirtualUser = game:service'VirtualUser'
        VirtualUser:CaptureController()
        VirtualUser:ClickButton1(Vector2.new(99999,99999))
    end
end)
end)

auf:Toggle("Safe Farm",false, function(state)
getgenv().af = state

player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace"):FindFirstChild("BS").CFrame * CFrame.new(0,10,0)

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().af == true then
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v:FindFirstChild("weightClientScript") then
                game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(v)
            end
        end
        local VirtualUser = game:service'VirtualUser'
        VirtualUser:CaptureController()
        VirtualUser:ClickButton1(Vector2.new(99999,99999))
    end
end)
end)

auf:Button("Koth", function()
player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").RayParts.KOTH.CFrame * CFrame.new(0,15,0)
end)


local msc = serv:Channel("Misc")

msc:Button("collect chests", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Chests.EnergyGymChest.Pad.CFrame
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Chests.LightningGymChest.Pad.CFrame
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Chests.LavaGymChest.Pad.CFrame
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Chests.DarkGymChest.Pad.CFrame
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Chests.GodlyGymChest.Pad.CFrame
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Chests.GroupChest.Pad.CFrame
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Chests.BigChest.Pad.CFrame
end)


msc:Textbox("WalkSpeed", "Type here!", true, function(v)
     game:GetService("Players").LocalPlayer.chosenSpeed.Value = v
     game:GetService("Players").LocalPlayer.usingChosenSpeed.Value = true
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