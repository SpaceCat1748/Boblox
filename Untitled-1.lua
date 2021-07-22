local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Clicker Madness", "Sentinel")

local AF = Window:NewTab("Auto-Farm")
local Section = AF:NewSection("Auto-Click")

Section:NewToggle("Auto-Clicker", "Clicks for you", function(state)
    getgenv().autoTap = true

        local clickMod = require(game:GetService("Players").LocalPlayer.PlayerScripts.Aero.Controllers.UI.Click)
        
spawn(function()
    while autoTap do
         clickMod:Click()
            wait(0.1)
         end
     end)
end)
local Section = AF:NewSection("No Auto-Rebirth")
Section:NewButton("Give Gamepass Auto-Rebirth", "Gives free gamepass", function()
    local gamepassMod = require(game:GetService("ReplicatedStorage").Aero.Shared.Gamepasses)
    gamepassMod.HasPassOtherwisePrompt = function() return true end
end)

local Pets = Window:NewTab("Pets")
local Eggs = Pets:NewSection("Eggs")

Eggs:NewDropdown("Select an egg", "choose an egg to buy", {"basic", "valentines", "lava"}, function(selectedEgg)
local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.EggService.Purchase
Event:FireServer(selectedEgg)
end)


local Misc = Window:NewTab("Misc")
local LOL = Misc:NewSection("Misc")

LOL:NewButton("Anti-Afk", "You will never be kicked", function()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
       vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
       wait(1)
       vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)

LOL:NewKeybind("Keybind", "Keybind", Enum.KeyCode.F, function()
	Library:ToggleUI()
end)


