local _speed=50 -- lower if you are getting tp'd back (shouldn't happen)
function tp(...)
  local plr=game.Players.LocalPlayer
  local args={...}
  if typeof(args[1])=="number"and args[2]and args[3]then
     args=Vector3.new(args[1],args[2],args[3])
  elseif typeof(args[1])=="Vector3" then
      args=args[1]    
  elseif typeof(args[1])=="CFrame" then
      args=args[1].Position
  end
  local dist=(plr.Character.HumanoidRootPart.Position-args).Magnitude
  game:GetService("TweenService"):Create(
      plr.Character.HumanoidRootPart,
      TweenInfo.new(dist/_speed,Enum.EasingStyle.Linear),
      {CFrame=CFrame.new(args)}
  ):Play()
end

local function SellBlocks()
   game:GetService("ReplicatedStorage").Events.Teleport:FireServer("SurfaceSell")
end

local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window("Mining Simulator 2 | SpaceCat#1748")

local serv = win:Server("Lol", "")

local guns = serv:Channel("Farming")

local selectedplayer
guns:Dropdown("Select Chest to TP", {"Wood","Silver","Gold","Epic","Legendary"}, function(value)
    print(value)
    selectedplayer = value
end)

guns:Button("Tween TP to Chest", function()
for i,v in pairs(game:GetService("Workspace").Chests:GetChildren()) do
    if v.Name == selectedplayer then -- Change the name to "Wood", "Silver", "Gold", "Epic" or "Legendary"
      tp(game:GetService("Workspace").Chests[selectedplayer].Part.Position)
end
end
end)

guns:Toggle("Auto Jump", false, function(state)
getgenv().jump = state

while jump do 
game.Players.LocalPlayer.Character.Humanoid.Jump = true
wait()
end
end)

guns:Toggle("Auto Mine", false, function(state)

getgenv().mine = state

if mine then
while wait() do 
a = string.gsub(game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.ScreenGui.HUD.Debug.Debug9.Label.Text,"Selected Cell: <font color='rgb","")
            b = string.gsub(a,"</font>","")
            c = string.gsub(b,"(150, 255, 255)","")
            d = string.gsub(c,",","")
            e = string.gsub(d,"'","")
            f = string.sub(e,4,99)
            local args = {
                [1] = Vector3.new(string.split(f, " ")[1],string.split(f, " ")[2],string.split(f, " ")[3])
            }
            game:GetService("ReplicatedStorage").Events.MineBlock:FireServer(unpack(args))
end
end
end)

guns:Button("Sell", function()
 spawn(function()
       SellBlocks()
   end)
end)


local misc = serv:Channel("Misc")

misc:Button("Anti Afk", function()
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
end)

misc:Button("All codes redeem", function()
local code = game.ReplicatedStorage.Functions.RedeemCode
code:InvokeServer("Release")
wait(0.1)
code:InvokeServer("FreeEgg")
end)

misc:Button("copy my discord", function()
setclipboard("SpaceCat#1748")
end)    
