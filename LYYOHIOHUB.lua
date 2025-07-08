-- 获取本地玩家对象
local player = game:GetService("Players").LocalPlayer
-- 获取传送服务
local TeleportService = game:GetService("TeleportService")
-- 获取HTTP服务（用于网络请求）
local HttpService = game:GetService("HttpService")
-- 获取玩家角色（若未加载则等待加载完成）
local character = player.Character or player.CharacterAdded:Wait()
-- 获取角色的HumanoidRootPart（用于移动和定位）
local HumanoidRootPart = character:WaitForChild("HumanoidRootPart")
-- 获取角色的Humanoid（用于控制移动）
local humanoid = character:WaitForChild("Humanoid")
-- 记录脚本启动时间（用于超时判断）
local scriptStartTime = os.time()
-- 禁止区域的中心坐标
local forbiddenZoneCenter = Vector3.new(352.884155, 13.0287256, -1353.05396)
-- 禁止区域的半径（单位： studs）
local forbiddenRadius = 80
-- 通过Roblox API获取当前游戏的公共服务器列表（最多100个）
local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100"))
-- 获取当前服务器的JobId
local currentJobId = game.JobId
-- 存储可用服务器的列表（非当前服务器且未满员）
local availableServers = {}
-- 筛选可用服务器
for _, server in ipairs(servers.data) do
    -- 排除当前服务器，且服务器人数未满
    if server.id ~= currentJobId and server.playing < server.maxPlayers then
        table.insert(availableServers, server.id)
    end
end
-- 需要自动拾取的目标稀有物品列表
local targetItems = {
    "Money Printer",
    "Blue Candy Cane",
    "Bunny Balloon",
    "Ghost Balloon",
    "Clover Balloon",
    "Bat Balloon",
    "Gold Clover Balloon",
    "Golden Rose",
    "Black Rose",
    "Heart Balloon",
    "Diamond Ring",
    "Diamond",
    "Void Gem",
    "Dark Matter Gem",
    "Rollie",
    "Helicopter Key",
    "NextBot Grenade",
     "Mustang Key",
      "Nuclear Missile Launcher",
       "Suitcase Nuke",
        "Helicopter",
         "Trident",
          "Golden Cup"
}
-- 显示通知的函数
local function ShowNotification(text)
    game.StarterGui:SetCore(
        "SendNotification",
        {
            Title = "LYY OHIO HUB",  -- 通知标题
            Text = text,  -- 通知内容
            Duration = 5  -- 通知显示时长（秒）
        }
    )
end
-- 检查脚本是否超时（超过120秒）
local function checkTimeout()
    return (os.time() - scriptStartTime) >= 120
end
-- 切换服务器的函数
local function TPServer()
    -- 若有可用服务器，则随机传送至一个
    if #availableServers > 0 then
        TeleportService:TeleportToPlaceInstance(game.PlaceId, availableServers[math.random(1, #availableServers)])
    else
        ShowNotification("没有可用服务器")
    end
end
-- 自动拾取物品的函数
local function AutoPickItem()
    ShowNotification("代理：奶龙 细猫 细勾 小希 AK47")
    -- 每0.1秒循环一次，持续寻找物品
    while task.wait(0.1) do
        -- 若超时，则切换服务器并停止寻找
        if checkTimeout() then
            TPServer()
            return false
        end
        local foundItem = false  -- 标记是否找到目标物品
        -- 遍历游戏中所有可拾取物品
        for _, itemFolder in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
            for _, item in pairs(itemFolder:GetChildren()) do
                -- 只处理Part或MeshPart类型的物品
                if item:IsA("MeshPart") or item:IsA("Part") then
                    local itemPos = item.Position  -- 物品位置
                    -- 计算物品与禁止区域中心的距离
                    local distance = (itemPos - forbiddenZoneCenter).Magnitude
        
                    -- 若物品在禁止区域外（距离大于禁止半径）
                    if distance > forbiddenRadius then
                        -- 检查物品是否有交互提示（ProximityPrompt）
                        for _, child in pairs(item:GetChildren()) do
                            if child:IsA("ProximityPrompt") then
                                -- 匹配目标物品名称
                                for _, targetName in pairs(targetItems) do
                                    if child.ObjectText == targetName then
                                        foundItem = true  -- 标记找到物品
                                        -- 优化交互设置：取消视线要求、瞬间拾取
                                        child.RequiresLineOfSight = false
                                        child.HoldDuration = 0
                                        -- 移动角色到物品位置（上方2单位）
                                        humanoid:Move(Vector3.new(1, 0, 0))
                                        HumanoidRootPart.CFrame = item.CFrame * CFrame.new(0, 2, 0)
                                        -- 触发拾取交互
                                        fireproximityprompt(child)
                                        
                                        -- 设置5秒超时检测，若物品未消失则强制删除
                                        local startTime = tick()
                                        local timeout = 5
                                        local connection
                                        connection = game:GetService("RunService").Heartbeat:Connect(function()
                                            if not item or not item.Parent then
                                                connection:Disconnect()  -- 物品已消失，断开连接
                                                return
                                            end
                                            
                                            if tick() - startTime >= timeout then
                                                item:Destroy()  -- 超时未消失，强制删除物品
                                                connection:Disconnect()
                                            end
                                        end)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        -- 若未找到物品，则准备抢劫银行
        if not foundItem then
            ShowNotification("代理：奶龙 细猫 细勾 小希 AK47")
            return true
        end
    end
end
-- 自动抢劫银行的函数
local function AutoFarmBank()
    ShowNotification("代理：奶龙 细猫 细勾 小希 AK47")
    -- 获取银行相关对象
    local BankDoor = workspace.BankRobbery.VaultDoor
    local BankCashs = workspace.BankRobbery.BankCash
    -- 循环执行抢劫操作（每0.1秒一次）
    while task.wait(0.1) do
        -- 若超时，则切换服务器
        if checkTimeout() then
            TPServer()
            return
        end
        -- 情况1：银行门未打开且有现金包，执行开门操作
        if BankDoor.Door.Attachment.ProximityPrompt.Enabled == true and BankCashs.Cash:FindFirstChild("Bundle") then
            HumanoidRootPart.CFrame = CFrame.new(1078.08093, 6.24685, -343.95758)  -- 移动到门位置
            BankDoor.Door.Attachment.ProximityPrompt.HoldDuration = 0  -- 瞬间开门
            fireproximityprompt(BankDoor.Door.Attachment.ProximityPrompt)  -- 触发开门交互
            task.wait(0.5)  -- 等待0.5秒
        -- 情况2：银行门已打开且有现金包，执行拾取现金操作
        elseif not BankDoor.Door.Attachment.ProximityPrompt.Enabled and BankCashs.Cash:FindFirstChild("Bundle") then
            local targetPos = BankCashs.Cash:FindFirstChild("Bundle"):GetPivot().Position  -- 现金包位置
            -- 计算角色站立位置（现金包下方5单位）
            local basePosition = Vector3.new(targetPos.X, targetPos.Y - 5, targetPos.Z)
            -- 面向现金包
            local lookVector = (targetPos - basePosition).Unit
            HumanoidRootPart.CFrame = CFrame.new(basePosition, basePosition + lookVector)
            -- 优化交互设置：取消视线要求、瞬间拾取
            BankCashs.Main.Attachment.ProximityPrompt.RequiresLineOfSight = false
            BankCashs.Main.Attachment.ProximityPrompt.HoldDuration = 0
            fireproximityprompt(BankCashs.Main.Attachment.ProximityPrompt)  -- 触发拾取现金交互
            task.wait(0.5)  -- 等待0.5秒
        -- 情况3：无现金包，抢劫完成，切换服务器
        else
            ShowNotification("抢劫银行完成，1秒后换服")
            task.wait(1)  -- 等待1秒
            TPServer()  -- 切换服务器
            return
        end
    end
end
-- 脚本启动提示
ShowNotification("LYY OHIO HUB - 优先物品拾取")
-- 先执行自动拾取物品流程
local itemsFinished = AutoPickItem()
-- 若物品拾取流程结束（未找到物品且未超时），则执行抢劫银行流程
if itemsFinished then
    AutoFarmBank()
end