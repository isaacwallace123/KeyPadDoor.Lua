local Code = script.Code
local Entered = script.Entered
local Tween = game:GetService("TweenService")
for i,v in pairs(script.Parent.Numbers:GetChildren()) do
	script.Parent.Numbers[v.Name].ClickDetector.MouseClick:Connect(function()
		Entered.Value = Entered.Value..v.SurfaceGui.TextLabel.Text
	end)
end

for i,v in pairs(script.Parent.Parent.Door.Doors:GetChildren()) do
	local function OpenDoors()
		if v.Name == "Left" then
			for x,y in pairs(v:GetChildren()) do
				local X1 = y.Position.X
				local Y1 = y.Position.Y
				local Z1 = y.Position.Z
				Tween:Create(y, TweenInfo.new(0.5),{Position = Vector3.new(X1+3.4,Y1,Z1)}):Play()
				wait(5)
				Tween:Create(y, TweenInfo.new(0.5),{Position = Vector3.new(X1,Y1,Z1)}):Play()
			end
		elseif v.Name == "Right" then
			for x,y in pairs(v:GetChildren()) do
				local X2 = y.Position.X
				local Y2 = y.Position.Y
				local Z2 = y.Position.Z
				Tween:Create(y, TweenInfo.new(0.5),{Position = Vector3.new(X2-3.4,Y2,Z2)}):Play()
				wait(5)
				Tween:Create(y, TweenInfo.new(0.5),{Position = Vector3.new(X2,Y2,Z2)}):Play()
			end
		else
			print("Doors Not Found")
		end
	end
	script.Parent.Button.enter.ClickDetector.MouseClick:Connect(function()
		if Entered.Value == Code.Value then
			OpenDoors()
		else
			print("Wrong Code")
			Entered.Value = ""
		end
	end)
end

script.Parent.Button.restart.ClickDetector.MouseClick:Connect(function()
	Entered.Value = ""
end)