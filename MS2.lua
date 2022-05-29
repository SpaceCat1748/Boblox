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

local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window("Mining Simulator 2 | SpaceCat#1748")

local serv = win:Server("Lol", "")

local guns = serv:Channel("Farm")

local selectedplayer
guns:Dropdown("Select Chest to TP", {"Wood","Silver","Gold","Epic","Legendary"}, function(value)
    print(value)
    selectedplayer = value
end)

guns:Toggle("Auto Farm (very Buggy)",false, function(state)
getgenv().chest = state

while chest do
for i,v in pairs(game:GetService("Workspace").Chests:GetChildren()) do
    if v.Name == selectedplayer then -- Change the name to "Wood", "Silver", "Gold", "Epic" or "Legendary"
      tp(game:GetService("Workspace").Chests[selectedplayer].Part.Position)
      wait()
 end
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
