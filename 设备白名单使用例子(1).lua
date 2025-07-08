local LONGTEAM = false
local LONG = game:GetService("RbxAnalyticsService"):GetClientId()

game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "脚本内部版"; Text ="检查白名单中！"; Duration = 4; })
if LONG == "" then 
LONGTEAM = true 
elseif LONG == "" then 
LONGTEAM = true 
elseif LONG ==" then 
LONGTEAM = true 
elseif LONG == "" then 
LONGTEAM = true 
elseif LONG == "设备码" then 
LONGTEAM = true 
elseif LONG == "" then 
LONGTEAM = true 
elseif LONG == "" then 
LONGTEAM = true 
elseif LONG == "" then 
LONGTEAM = true 
elseif LONG == "" then 
LONGTEAM = true 
elseif LONG == "" then 
LONGTEAM = true 
elseif LONG == "" then 
LONGTEAM = true 
elseif LONG == "" then 
LONGTEAM = true 
elseif LONG == "" then 
LONGTEAM = true 
elseif LONG == "" then 
LONGTEAM = true 
end

if LONGTEAM then
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "脚本内部版"; Text ="脚本加载中！请不要着急！"; Duration = 4; })
loadstring(game:HttpGet("https://raw.githubusercontent.com/lyynb666ezlol/jejsjwhwjajshsjnsjajqkwkdjdhieekjehwhwjw/refs/heads/main/2082393", true))()
else
      setclipboard(tostring(game:GetService("RbxAnalyticsService"):GetClientId()))
      game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "你不是白名单用户"; Text ="仅供内部"; Duration = 4; })
end
