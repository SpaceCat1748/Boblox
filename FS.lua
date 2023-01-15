game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16

getgenv().walk = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed;

local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)


tpTable = {}
for _,v in pairs(game:GetService("Workspace").Portals.World:GetChildren()) do
   if v.ClassName == "Part" then
      if not table.find(tpTable, v.Name) then
         table.insert(tpTable, v.Name)
       end
   end
end

BackpackTable = {}
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v.ClassName == "Tool" then
        if not v:FindFirstChild("Script") then
                if not v:FindFirstChild("Event") then
                    if not table.find(BackpackTable, v.Name) then
                        table.insert(BackpackTable, v.Name)
                end
           end
       end
   end
end
game.Players.LocalPlayer.Backpack.ChildAdded:Connect(function()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v.ClassName == "Tool" then
        if not v:FindFirstChild("Script") then
                if not v:FindFirstChild("Event") then
                    if not table.find(BackpackTable, v.Name) then
                        table.insert(BackpackTable, v.Name)
                end
           end
       end
   end
end
end)


local VirtualInputManager = game:GetService('VirtualInputManager')

local player = game.Players.LocalPlayer

local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window(GetName.Name)

local serv = win:Server("gui", "")

local auf = serv:Channel("Farm")

auf:Button("Give Gamepasses", function()
for i,v in pairs(game:GetService("ReplicatedStorage").PlayerData[game.Players.LocalPlayer.Name]:GetChildren()) do
    if v.ClassName == "BoolValue" then
       v.Value = true
    end
end
end)

local selecteditem
local drop = auf:Dropdown("Pick Item", BackpackTable, function(v)
print(v)
selecteditem = v
end)


auf:Toggle("Auto-Lift",false, function(state)
getgenv().lift = state

player.Character.HumanoidRootPart.CFrame = CFrame.new(-65.12925720214844, 215.9927215576172, 577.9686279296875)

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().lift == true then
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v.Name == selecteditem then
                game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(v)
            end
        end
        local VirtualUser = game:service'VirtualUser'
        VirtualUser:CaptureController()
        VirtualUser:ClickButton1(Vector2.new(99999,99999))
    end
end)
end)

auf:Toggle("Auto-Rebirth",false, function(state)
getgenv().rebirth = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().rebirth == true then
        local Event = game:GetService("ReplicatedStorage").Remotes.rebirthEvent
        Event:FireServer()
    end
end)
end)

auf:Toggle("Auto-Buy Food",false, function(state)
getgenv().food = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().food == true then
        local Event = game:GetService("ReplicatedStorage").Remotes.buyFood
        Event:InvokeServer()
    end
end)
end)


auf:Toggle("Auto-Claim Orbs",false, function(state)
getgenv().orbs = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().orbs == true then
        for i,v in pairs(game:GetService("Workspace").ballsFolder:GetChildren()) do
            for i,l in pairs(v:GetChildren()) do
                if l:FindFirstChild("Outer") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = l.Outer.CFrame
                end
            end
        end
    end
end)
end)

auf:Toggle("Auto-Claim Gifts",false, function(state)
getgenv().gift = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().gift == true then
        for i = 1,12 do
            local A_1 = i
            local Event = game:GetService("ReplicatedStorage").Remotes.claimGift
            Event:InvokeServer(A_1)
        end
    end
end)
end)


auf:Toggle("Auto-Claim Quests",false, function(state)
getgenv().Quest = state

game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Quest == true then
        for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.mainGui.Menus.questsMenu.Info.Listing.Rewards:GetChildren()) do
            if v.ClassName == "Frame" then
                local A_1 = v.Name
                local Event = game:GetService("ReplicatedStorage").Remotes.quest
                Event:InvokeServer(A_1)
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