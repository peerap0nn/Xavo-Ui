game:GetService("Debris"):AddItem(ripple, 0.6)
                    end
                end)
                
                local hovering = false
                
                -- Modern hover effects
                buttonElement.MouseEnter:Connect(function()
                    if not focusing then
                        game.TweenService:Create(buttonElement, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundColor3 = Color3.fromRGB(
                                math.min(255, themeList.ElementColor.r * 255 + 15),
                                math.min(255, themeList.ElementColor.g * 255 + 15),
                                math.min(255, themeList.ElementColor.b * 255 + 15)
                            ),
                            Size = UDim2.new(0, 375, 0, 38)
                        }):Play()
                        hovering = true
                    end
                end)
                
                buttonElement.MouseLeave:Connect(function()
                    if not focusing then
                        game.TweenService:Create(buttonElement, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundColor3 = themeList.ElementColor,
                            Size = UDim2.new(0, 370, 0, 38)
                        }):Play()
                        hovering = false
                    end
                end)

                -- Theme updates
                coroutine.wrap(function()
                    while wait() do
                        if not hovering then
                            buttonElement.BackgroundColor3 = themeList.ElementColor
                        end
                        touch.ImageColor3 = themeList.SchemeColor
                        btnInfo.TextColor3 = themeList.TextColor
                    end
                end)()
                
                function ButtonFunction:UpdateButton(newTitle)
                    btnInfo.Text = newTitle
                end
                return ButtonFunction
            end

            function Elements:NewToggle(tname, nTip, callback)
                local TogFunction = {}
                tname = tname or "Toggle"
                nTip = nTip or "Toggle this option on or off"
                callback = callback or function() end
                local toggled = false
                table.insert(SettingsT, tname)

                local toggleElement = Instance.new("TextButton")
                local UICorner = Instance.new("UICorner")
                local toggleContainer = Instance.new("Frame")
                local toggleSlider = Instance.new("Frame")
                local toggleCorner = Instance.new("UICorner")
                local sliderCorner = Instance.new("UICorner")
                local togName = Instance.new("TextLabel")

                toggleElement.Name = "toggleElement"
                toggleElement.Parent = sectionInners
                toggleElement.BackgroundColor3 = themeList.ElementColor
                toggleElement.ClipsDescendants = true
                toggleElement.Size = UDim2.new(0, 370, 0, 38)
                toggleElement.AutoButtonColor = false
                toggleElement.Font = Enum.Font.SourceSans
                toggleElement.Text = ""
                toggleElement.TextColor3 = Color3.fromRGB(0, 0, 0)
                toggleElement.TextSize = 14.000

                UICorner.CornerRadius = UDim.new(0, 8)
                UICorner.Parent = toggleElement

                -- Modern Toggle Switch Design
                toggleContainer.Name = "toggleContainer"
                toggleContainer.Parent = toggleElement
                toggleContainer.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                toggleContainer.Position = UDim2.new(0.85, 0, 0.26, 0)
                toggleContainer.Size = UDim2.new(0, 45, 0, 18)
                
                toggleCorner.CornerRadius = UDim.new(1, 0)
                toggleCorner.Parent = toggleContainer

                toggleSlider.Name = "toggleSlider"
                toggleSlider.Parent = toggleContainer
                toggleSlider.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
                toggleSlider.Position = UDim2.new(0.05, 0, 0.11, 0)
                toggleSlider.Size = UDim2.new(0, 14, 0, 14)
                
                sliderCorner.CornerRadius = UDim.new(1, 0)
                sliderCorner.Parent = toggleSlider

                togName.Name = "togName"
                togName.Parent = toggleElement
                togName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                togName.BackgroundTransparency = 1.000
                togName.Position = UDim2.new(0.025, 0, 0.26, 0)
                togName.Size = UDim2.new(0, 300, 0, 18)
                togName.Font = Enum.Font.GothamSemibold
                togName.Text = tname
                togName.RichText = true
                togName.TextColor3 = themeList.TextColor
                togName.TextSize = 15.000
                togName.TextXAlignment = Enum.TextXAlignment.Left

                updateSectionFrame()
                UpdateSize()

                local function updateToggle()
                    if toggled then
                        game.TweenService:Create(toggleContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundColor3 = themeList.SchemeColor
                        }):Play()
                        game.TweenService:Create(toggleSlider, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                            Position = UDim2.new(0.65, 0, 0.11, 0),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        }):Play()
                    else
                        game.TweenService:Create(toggleContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                        }):Play()
                        game.TweenService:Create(toggleSlider, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                            Position = UDim2.new(0.05, 0, 0.11, 0),
                            BackgroundColor3 = Color3.fromRGB(200, 200, 200)
                        }):Play()
                    end
                end

                toggleElement.MouseButton1Click:Connect(function()
                    if not focusing then
                        toggled = not toggled
                        updateToggle()
                        pcall(callback, toggled)
                    end
                end)

                local hovering = false
                toggleElement.MouseEnter:Connect(function()
                    if not focusing then
                        game.TweenService:Create(toggleElement, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundColor3 = Color3.fromRGB(
                                math.min(255, themeList.ElementColor.r * 255 + 12),
                                math.min(255, themeList.ElementColor.g * 255 + 12),
                                math.min(255, themeList.ElementColor.b * 255 + 12)
                            )
                        }):Play()
                        hovering = true
                    end 
                end)
                
                toggleElement.MouseLeave:Connect(function()
                    if not focusing then
                        game.TweenService:Create(toggleElement, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundColor3 = themeList.ElementColor
                        }):Play()
                        hovering = false
                    end
                end)

                coroutine.wrap(function()
                    while wait() do
                        if not hovering then
                            toggleElement.BackgroundColor3 = themeList.ElementColor
                        end
                        togName.TextColor3 = themeList.TextColor
                    end
                end)()
                
                function TogFunction:UpdateToggle(newText, isTogOn)
                    isTogOn = isTogOn or toggled
                    if newText ~= nil then 
                        togName.Text = newText
                    end
                    if isTogOn ~= toggled then
                        toggled = isTogOn
                        updateToggle()
                        pcall(callback, toggled)
                    end
                end
                return TogFunction
            end

            function Elements:NewSlider(slidInf, slidTip, maxvalue, minvalue, startVal, callback)
                slidInf = slidInf or "Slider"
                slidTip = slidTip or "Adjust the slider value"
                maxvalue = maxvalue or 100
                minvalue = minvalue or 0
                startVal = startVal or minvalue
                callback = callback or function() end

                local sliderElement = Instance.new("TextButton")
                local UICorner = Instance.new("UICorner")
                local togName = Instance.new("TextLabel")
                local sliderTrack = Instance.new("Frame")
                local trackCorner = Instance.new("UICorner")
                local sliderFill = Instance.new("Frame")
                local fillCorner = Instance.new("UICorner")
                local sliderHandle = Instance.new("Frame")
                local handleCorner = Instance.new("UICorner")
                local val = Instance.new("TextLabel")

                sliderElement.Name = "sliderElement"
                sliderElement.Parent = sectionInners
                sliderElement.BackgroundColor3 = themeList.ElementColor
                sliderElement.ClipsDescendants = true
                sliderElement.Size = UDim2.new(0, 370, 0, 50)
                sliderElement.AutoButtonColor = false
                sliderElement.Font = Enum.Font.SourceSans
                sliderElement.Text = ""
                sliderElement.TextColor3 = Color3.fromRGB(0, 0, 0)
                sliderElement.TextSize = 14.000

                UICorner.CornerRadius = UDim.new(0, 8)
                UICorner.Parent = sliderElement

                togName.Name = "togName"
                togName.Parent = sliderElement
                togName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                togName.BackgroundTransparency = 1.000
                togName.Position = UDim2.new(0.025, 0, 0.1, 0)
                togName.Size = UDim2.new(0, 250, 0, 18)
                togName.Font = Enum.Font.GothamSemibold
                togName.Text = slidInf
                togName.RichText = true
                togName.TextColor3 = themeList.TextColor
                togName.TextSize = 15.000
                togName.TextXAlignment = Enum.TextXAlignment.Left

                val.Name = "val"
                val.Parent = sliderElement
                val.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                val.BackgroundTransparency = 1.000
                val.Position = UDim2.new(0.7, 0, 0.1, 0)
                val.Size = UDim2.new(0, 100, 0, 18)
                val.Font = Enum.Font.GothamBold
                val.Text = tostring(startVal)
                val.TextColor3 = themeList.SchemeColor
                val.TextSize = 15.000
                val.TextXAlignment = Enum.TextXAlignment.Right

                -- Modern Slider Track
                sliderTrack.Name = "sliderTrack"
                sliderTrack.Parent = sliderElement
                sliderTrack.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                sliderTrack.Position = UDim2.new(0.025, 0, 0.64, 0)
                sliderTrack.Size = UDim2.new(0, 320, 0, 8)

                trackCorner.CornerRadius = UDim.new(1, 0)
                trackCorner.Parent = sliderTrack

                -- Slider Fill
                sliderFill.Name = "sliderFill"
                sliderFill.Parent = sliderTrack
                sliderFill.BackgroundColor3 = themeList.SchemeColor
                sliderFill.Size = UDim2.new(0, 0, 1, 0)

                fillCorner.CornerRadius = UDim.new(1, 0)
                fillCorner.Parent = sliderFill

                -- Slider Handle
                sliderHandle.Name = "sliderHandle"
                sliderHandle.Parent = sliderTrack
                sliderHandle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                sliderHandle.Position = UDim2.new(0, -8, 0, -4)
                sliderHandle.Size = UDim2.new(0, 16, 0, 16)

                handleCorner.CornerRadius = UDim.new(1, 0)
                handleCorner.Parent = sliderHandle

                updateSectionFrame()
                UpdateSize()

                local mouse = game.Players.LocalPlayer:GetMouse()
                local uis = game:GetService("UserInputService")
                local Value = startVal

                local function updateSlider()
                    local percentage = (Value - minvalue) / (maxvalue - minvalue)
                    percentage = math.clamp(percentage, 0, 1)
                    
                    sliderFill.Size = UDim2.new(percentage, 0, 1, 0)
                    sliderHandle.Position = UDim2.new(percentage, -8, 0, -4)
                    val.Text = tostring(math.floor(Value))
                end

                updateSlider()

                local dragging = false
                local function updateValue()
                    local percentage = math.clamp((mouse.X - sliderTrack.AbsolutePosition.X) / sliderTrack.AbsoluteSize.X, 0, 1)
                    Value = math.floor(minvalue + (maxvalue - minvalue) * percentage)
                    updateSlider()
                    pcall(callback, Value)
                end

                sliderTrack.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true
                        updateValue()
                    end
                end)

                uis.InputChanged:Connect(function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        updateValue()
                    end
                end)

                uis.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false
                    end
                end)

                local hovering = false
                sliderElement.MouseEnter:Connect(function()
                    if not focusing then
                        game.TweenService:Create(sliderElement, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundColor3 = Color3.fromRGB(
                                math.min(255, themeList.ElementColor.r * 255 + 12),
                                math.min(255, themeList.ElementColor.g * 255 + 12),
                                math.min(255, themeList.ElementColor.b * 255 + 12)
                            )
                        }):Play()
                        hovering = true
                    end 
                end)
                
                sliderElement.MouseLeave:Connect(function()
                    if not focusing then
                        game.TweenService:Create(sliderElement, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundColor3 = themeList.ElementColor
                        }):Play()
                        hovering = false
                    end
                end)

                coroutine.wrap(function()
                    while wait() do
                        if not hovering then
                            sliderElement.BackgroundColor3 = themeList.ElementColor
                        end
                        val.TextColor3 = themeList.SchemeColor
                        togName.TextColor3 = themeList.TextColor
                        sliderFill.BackgroundColor3 = themeList.SchemeColor
                    end
                end)()
            end

            function Elements:NewDropdown(dropname, dropinf, list, callback)
                local DropFunction = {}
                dropname = dropname or "Dropdown"
                list = list or {}
                dropinf = dropinf or "Select an option from the dropdown"
                callback = callback or function() end   

                local opened = false
                local DropYSize = 38

                local dropFrame = Instance.new("Frame")
                local dropOpen = Instance.new("TextButton")
                local listImg = Instance.new("ImageLabel")
                local itemTextbox = Instance.new("TextLabel")
                local UICorner = Instance.new("UICorner")
                local UIListLayout = Instance.new("UIListLayout")
                local dropArrow = Instance.new("TextLabel")

                dropFrame.Name = "dropFrame"
                dropFrame.Parent = sectionInners
                dropFrame.BackgroundColor3 = themeList.Background
                dropFrame.BorderSizePixel = 0
                dropFrame.Size = UDim2.new(0, 370, 0, 38)
                dropFrame.ClipsDescendants = true
                
                dropOpen.Name = "dropOpen"
                dropOpen.Parent = dropFrame
                dropOpen.BackgroundColor3 = themeList.ElementColor
                dropOpen.Size = UDim2.new(0, 370, 0, 38)
                dropOpen.AutoButtonColor = false
                dropOpen.Font = Enum.Font.SourceSans
                dropOpen.Text = ""
                dropOpen.TextColor3 = Color3.fromRGB(0, 0, 0)
                dropOpen.TextSize = 14.000
                dropOpen.ClipsDescendants = true

                UICorner.CornerRadius = UDim.new(0, 8)
                UICorner.Parent = dropOpen

                listImg.Name = "listImg"
                listImg.Parent = dropOpen
                listImg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                listImg.BackgroundTransparency = 1.000
                listImg.Position = UDim2.new(0.025, 0, 0.21, 0)
                listImg.Size = UDim2.new(0, 22, 0, 22)
                listImg.Image = "rbxassetid://3926305904"
                listImg.ImageColor3 = themeList.SchemeColor
                listImg.ImageRectOffset = Vector2.new(644, 364)
                listImg.ImageRectSize = Vector2.new(36, 36)

                itemTextbox.Name = "itemTextbox"
                itemTextbox.Parent = dropOpen
                itemTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                itemTextbox.BackgroundTransparency = 1.000
                itemTextbox.Position = UDim2.new(0.1, 0, 0.26, 0)
                itemTextbox.Size = UDim2.new(0, 250, 0, 18)
                itemTextbox.Font = Enum.Font.GothamSemibold
                itemTextbox.Text = dropname
                itemTextbox.RichText = true
                itemTextbox.TextColor3 = themeList.TextColor
                itemTextbox.TextSize = 15.000
                itemTextbox.TextXAlignment = Enum.TextXAlignment.Left

                -- Modern Dropdown Arrow
                dropArrow.Name = "dropArrow"
                dropArrow.Parent = dropOpen
                dropArrow.BackgroundTransparency = 1
                dropArrow.Position = UDim2.new(0.9, 0, 0.26, 0)
                dropArrow.Size = UDim2.new(0, 18, 0, 18)
                dropArrow.Font = Enum.Font.GothamBold
                dropArrow.Text = "▼"
                dropArrow.TextColor3 = themeList.SchemeColor
                dropArrow.TextSize = 12.000
                dropArrow.TextXAlignment = Enum.TextXAlignment.Center

                UIListLayout.Parent = dropFrame
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.Padding = UDim.new(0, 2)

                updateSectionFrame() 
                UpdateSize()

                dropOpen.MouseButton1Click:Connect(function()
                    if not focusing then
                        if opened then
                            opened = false
                            dropFrame:TweenSize(UDim2.new(0, 370, 0, 38), "InOut", "Quad", 0.2)
                            game.TweenService:Create(dropArrow, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Rotation = 0
                            }):Play()
                            wait(0.2)
                            updateSectionFrame()
                            UpdateSize()
                        else
                            opened = true
                            dropFrame:TweenSize(UDim2.new(0, 370, 0, UIListLayout.AbsoluteContentSize.Y), "InOut", "Quad", 0.2, true)
                            game.TweenService:Create(dropArrow, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Rotation = 180
                            }):Play()
                            wait(0.2)
                            updateSectionFrame()
                            UpdateSize()
                        end
                    end
                end)

                local hovering = false
                dropOpen.MouseEnter:Connect(function()
                    if not focusing then
                        game.TweenService:Create(dropOpen, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundColor3 = Color3.fromRGB(
                                math.min(255, themeList.ElementColor.r * 255 + 12),
                                math.min(255, themeList.ElementColor.g * 255 + 12),
                                math.min(255, themeList.ElementColor.b * 255 + 12)
                            )
                        }):Play()
                        hovering = true
                    end 
                end)
                
                dropOpen.MouseLeave:Connect(function()
                    if not focusing then
                        game.TweenService:Create(dropOpen, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundColor3 = themeList.ElementColor
                        }):Play()
                        hovering = false
                    end
                end)

                coroutine.wrap(function()
                    while wait() do
                        if not hovering then
                            dropOpen.BackgroundColor3 = themeList.ElementColor
                        end
                        dropFrame.BackgroundColor3 = themeList.Background
                        listImg.ImageColor3 = themeList.SchemeColor
                        itemTextbox.TextColor3 = themeList.TextColor
                        dropArrow.TextColor3 = themeList.SchemeColor
                    end
                end)()

                for i,v in next, list do
                    local optionSelect = Instance.new("TextButton")
                    local UICorner_2 = Instance.new("UICorner")

                    DropYSize = DropYSize + 35
                    optionSelect.Name = "optionSelect"
                    optionSelect.Parent = dropFrame
                    optionSelect.BackgroundColor3 = themeList.ElementColor
                    optionSelect.Size = UDim2.new(0, 370, 0, 32)
                    optionSelect.AutoButtonColor = false
                    optionSelect.Font = Enum.Font.GothamSemibold
                    optionSelect.Text = "  "..v
                    optionSelect.TextColor3 = Color3.fromRGB(
                        math.max(0, themeList.TextColor.r * 255 - 20),
                        math.max(0, themeList.TextColor.g * 255 - 20),
                        math.max(0, themeList.TextColor.b * 255 - 20)
                    )
                    optionSelect.TextSize = 14.000
                    optionSelect.TextXAlignment = Enum.TextXAlignment.Left
                    optionSelect.ClipsDescendants = true
                    
                    optionSelect.MouseButton1Click:Connect(function()
                        if not focusing then
                            opened = false
                            callback(v)
                            itemTextbox.Text = v
                            dropFrame:TweenSize(UDim2.new(0, 370, 0, 38), 'InOut', 'Quad', 0.2)
                            game.TweenService:Create(dropArrow, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Rotation = 0
                            }):Play()
                            wait(0.2)
                            updateSectionFrame()
                            UpdateSize()
                        end
                    end)

                    UICorner_2.CornerRadius = UDim.new(0, 6)
                    UICorner_2.Parent = optionSelect

                    local oHover = false
                    optionSelect.MouseEnter:Connect(function()
                        if not focusing then
                            game.TweenService:Create(optionSelect, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                BackgroundColor3 = themeList.SchemeColor,
                                TextColor3 = Color3.fromRGB(255, 255, 255)
                            }):Play()
                            oHover = true
                        end 
                    end)
                    
                    optionSelect.MouseLeave:Connect(function()
                        if not focusing then
                            game.TweenService:Create(optionSelect, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                BackgroundColor3 = themeList.ElementColor,
                                TextColor3 = Color3.fromRGB(
                                    math.max(0, themeList.TextColor.r * 255 - 20),
                                    math.max(0, themeList.TextColor.g * 255 - 20),
                                    math.max(0, themeList.TextColor.b * 255 - 20)
                                )
                            }):Play()
                            oHover = false
                        end
                    end)   
                    
                    coroutine.wrap(function()
                        while wait() do
                            if not oHover then
                                optionSelect.BackgroundColor3 = themeList.ElementColor
                            end
                        end
                    end)()
                end

                function DropFunction:Refresh(newList)
                    newList = newList or {}
                    for i,v in next, dropFrame:GetChildren() do
                        if v.Name == "optionSelect" then
                            v:Destroy()
                        end
                    end
                    
                    for i,v in next, newList do
                        local optionSelect = Instance.new("TextButton")
                        local UICorner_2 = Instance.new("UICorner")

                        DropYSize = DropYSize + 35
                        optionSelect.Name = "optionSelect"
                        optionSelect.Parent = dropFrame
                        optionSelect.BackgroundColor3 = themeList.ElementColor
                        optionSelect.Size = UDim2.new(0, 370, 0, 32)
                        optionSelect.AutoButtonColor = false
                        optionSelect.Font = Enum.Font.GothamSemibold
                        optionSelect.Text = "  "..v
                        optionSelect.TextColor3 = Color3.fromRGB(
                            math.max(0, themeList.TextColor.r * 255 - 20),
                            math.max(0, themeList.TextColor.g * 255 - 20),
                            math.max(0, themeList.TextColor.b * 255 - 20)
                        )
                        optionSelect.TextSize = 14.000
                        optionSelect.TextXAlignment = Enum.TextXAlignment.Left
                        optionSelect.ClipsDescendants = true
                        
                        UICorner_2.CornerRadius = UDim.new(0, 6)
                        UICorner_2.Parent = optionSelect
                        
                        optionSelect.MouseButton1Click:Connect(function()
                            if not focusing then
                                opened = false
                                callback(v)
                                itemTextbox.Text = v
                                dropFrame:TweenSize(UDim2.new(0, 370, 0, 38), 'InOut', 'Quad', 0.2)
                                game.TweenService:Create(dropArrow, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    Rotation = 0
                                }):Play()
                                wait(0.2)
                                updateSectionFrame()
                                UpdateSize()
                            end
                        end)

                        local hov = false
                        optionSelect.MouseEnter:Connect(function()
                            if not focusing then
                                game.TweenService:Create(optionSelect, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    BackgroundColor3 = themeList.SchemeColor,
                                    TextColor3 = Color3.fromRGB(255, 255, 255)
                                }):Play()
                                hov = true
                            end 
                        end)
                        
                        optionSelect.MouseLeave:Connect(function()
                            if not focusing then
                                game.TweenService:Create(optionSelect, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    BackgroundColor3 = themeList.ElementColor,
                                    TextColor3 = Color3.fromRGB(
                                        math.max(0, themeList.TextColor.r * 255 - 20),
                                        math.max(0, themeList.TextColor.g * 255 - 20),
                                        math.max(0, themeList.TextColor.b * 255 - 20)
                                    )
                                }):Play()
                                hov = false
                            end
                        end)   
                        
                        coroutine.wrap(function()
                            while wait() do
                                if not hov then
                                    optionSelect.BackgroundColor3 = themeList.ElementColor
                                end
                            end
                        end)()
                    end
                    
                    if opened then 
                        dropFrame:TweenSize(UDim2.new(0, 370, 0, UIListLayout.AbsoluteContentSize.Y), "InOut", "Quad", 0.2, true)
                        wait(0.2)
                        updateSectionFrame()
                        UpdateSize()
                    else
                        dropFrame:TweenSize(UDim2.new(0, 370, 0, 38), "InOut", "Quad", 0.2)
                        wait(0.2)
                        updateSectionFrame()
                        UpdateSize()
                    end
                end
                return DropFunction
            end

            function Elements:NewTextBox(tname, tTip, callback)
                tname = tname or "TextBox"
                tTip = tTip or "Enter text input here"
                callback = callback or function() end
                
                local textboxElement = Instance.new("TextButton")
                local UICorner = Instance.new("UICorner")
                local write = Instance.new("ImageLabel")
                local TextBox = Instance.new("TextBox")
                local UICorner_2 = Instance.new("UICorner")
                local togName = Instance.new("TextLabel")

                textboxElement.Name = "textboxElement"
                textboxElement.Parent = sectionInners
                textboxElement.BackgroundColor3 = themeList.ElementColor
                textboxElement.ClipsDescendants = true
                textboxElement.Size = UDim2.new(0, 370, 0, 38)
                textboxElement.AutoButtonColor = false
                textboxElement.Font = Enum.Font.SourceSans
                textboxElement.Text = ""
                textboxElement.TextColor3 = Color3.fromRGB(0, 0, 0)
                textboxElement.TextSize = 14.000

                UICorner.CornerRadius = UDim.new(0, 8)
                UICorner.Parent = textboxElement

                write.Name = "write"
                write.Parent = textboxElement
                write.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                write.BackgroundTransparency = 1.000
                write.Position = UDim2.new(0.025, 0, 0.21, 0)
                write.Size = UDim2.new(0, 22, 0, 22)
                write.Image = "rbxassetid://3926305904"
                write.ImageColor3 = themeList.SchemeColor
                write.ImageRectOffset = Vector2.new(324, 604)
                write.ImageRectSize = Vector2.new(36, 36)

                TextBox.Parent = textboxElement
                TextBox.BackgroundColor3 = Color3.fromRGB(
                    math.max(0, themeList.ElementColor.r * 255 - 8),
                    math.max(0, themeList.ElementColor.g * 255 - 8),
                    math.max(0, themeList.ElementColor.b * 255 - 8)
                )
                TextBox.BorderSizePixel = 0
                TextBox.ClipsDescendants = true
                TextBox.Position = UDim2.new(0.52, 0, 0.26, 0)
                TextBox.Size = UDim2.new(0, 160, 0, 18)
                TextBox.ZIndex = 99
                TextBox.ClearTextOnFocus = false
                TextBox.Font = Enum.Font.Gotham
                TextBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
                TextBox.PlaceholderText = "Type here..."
                TextBox.Text = ""
                TextBox.TextColor3 = themeList.SchemeColor
                TextBox.TextSize = 13.000

                UICorner_2.CornerRadius = UDim.new(0, 6)
                UICorner_2.Parent = TextBox

                togName.Name = "togName"
                togName.Parent = textboxElement
                togName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                togName.BackgroundTransparency = 1.000
                togName.Position = UDim2.new(0.1, 0, 0.26, 0)
                togName.Size = UDim2.new(0, 150, 0, 18)
                togName.Font = Enum.Font.GothamSemibold
                togName.Text = tname
                togName.RichText = true
                togName.TextColor3 = themeList.TextColor
                togName.TextSize = 15.000
                togName.TextXAlignment = Enum.TextXAlignment.Left

                updateSectionFrame()
                UpdateSize()

                TextBox.FocusLost:Connect(function(EnterPressed)
                    if EnterPressed then
                        callback(TextBox.Text)
                        wait(0.1)
                        TextBox.Text = ""
                    end
                end)

                local hovering = false
                textboxElement.MouseEnter:Connect(function()
                    if not focusing then
                        game.TweenService:Create(textboxElement, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundColor3 = Color3.fromRGB(
                                math.min(255, themeList.ElementColor.r * 255 + 12),
                                math.min(255, themeList.ElementColor.g * 255 + 12),
                                math.min(255, themeList.ElementColor.b * 255 + 12)
                            )
                        }):Play()
                        hovering = true
                    end 
                end)

                textboxElement.MouseLeave:Connect(function()
                    if not focusing then
                        game.TweenService:Create(textboxElement, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundColor3 = themeList.ElementColor
                        }):Play()
                        hovering = false
                    end
                end)

                coroutine.wrap(function()
                    while wait() do
                        if not hovering then
                            textboxElement.BackgroundColor3 = themeList.ElementColor
                        end
                        TextBox.BackgroundColor3 = Color3.fromRGB(
                            math.max(0, themeList.ElementColor.r * 255 - 8),
                            math.max(0, themeList.ElementColor.g * 255 - 8),
                            math.max(0, themeList.ElementColor.b * 255 - 8)
                        )
                        write.ImageColor3 = themeList.SchemeColor
                        togName.TextColor3 = themeList.TextColor
                        TextBox.TextColor3 = themeList.SchemeColor
                    end
                end)()
            end 

            function Elements:NewLabel(title)
                local labelFunctions = {}
                local label = Instance.new("TextLabel")
                local UICorner = Instance.new("UICorner")
                
                label.Name = "label"
                label.Parent = sectionInners
                label.BackgroundColor3 = themeList.SchemeColor
                label.BorderSizePixel = 0
                label.ClipsDescendants = true
                label.Text = title
                label.Size = UDim2.new(0, 370, 0, 38)
                label.Font = Enum.Font.GothamBold
                label.Text = "  "..title
                label.RichText = true
                label.TextColor3 = Color3.fromRGB(255, 255, 255)
                label.TextSize = 15.000
                label.TextXAlignment = Enum.TextXAlignment.Left
                
                UICorner.CornerRadius = UDim.new(0, 8)
                UICorner.Parent = label

                coroutine.wrap(function()
                    while wait() do
                        label.BackgroundColor3 = themeList.SchemeColor
                        label.TextColor3 = Color3.fromRGB(255, 255, 255)
                    end
                end)()
                
                updateSectionFrame()
                UpdateSize()
                
                function labelFunctions:UpdateLabel(newText)
                    if label.Text ~= "  "..newText then
                        label.Text = "  "..newText
                    end
                end	
                return labelFunctions
            end	
            
            return Elements
        end
        return Sections
    end  
    return Tabs
end

return Xavo
                        --// Xavo UI Library - Modern & Sleek Interface Framework
--// Rebranded and modernized from Kavo UI Library
--// For educational and development purposes only

local Xavo = {}

local tween = game:GetService("TweenService")
local tweeninfo = TweenInfo.new
local input = game:GetService("UserInputService")
local run = game:GetService("RunService")

local Utility = {}
local Objects = {}

function Xavo:DraggingEnabled(frame, parent)
    parent = parent or frame
    
    local dragging = false
    local dragInput, mousePos, framePos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = parent.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    input.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            parent.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
        end
    end)
end

function Utility:TweenObject(obj, properties, duration, ...)
    tween:Create(obj, tweeninfo(duration, ...), properties):Play()
end

-- Modern Color Themes for Xavo
local themes = {
    SchemeColor = Color3.fromRGB(88, 101, 242),  -- Discord Blurple
    Background = Color3.fromRGB(32, 34, 37),      -- Modern Dark
    Header = Color3.fromRGB(40, 43, 48),          -- Slightly Lighter
    TextColor = Color3.fromRGB(220, 221, 222),    -- Soft White
    ElementColor = Color3.fromRGB(47, 49, 54)     -- Element Background
}

local themeStyles = {
    Discord = {
        SchemeColor = Color3.fromRGB(88, 101, 242),
        Background = Color3.fromRGB(32, 34, 37),
        Header = Color3.fromRGB(40, 43, 48),
        TextColor = Color3.fromRGB(220, 221, 222),
        ElementColor = Color3.fromRGB(47, 49, 54)
    },
    Cyberpunk = {
        SchemeColor = Color3.fromRGB(255, 20, 147),  -- Hot Pink
        Background = Color3.fromRGB(12, 12, 23),      -- Deep Dark
        Header = Color3.fromRGB(20, 20, 35),
        TextColor = Color3.fromRGB(0, 255, 255),      -- Cyan
        ElementColor = Color3.fromRGB(25, 25, 40)
    },
    Neon = {
        SchemeColor = Color3.fromRGB(57, 255, 20),   -- Bright Green
        Background = Color3.fromRGB(8, 8, 8),
        Header = Color3.fromRGB(15, 15, 15),
        TextColor = Color3.fromRGB(240, 240, 240),
        ElementColor = Color3.fromRGB(20, 20, 20)
    },
    Ocean = {
        SchemeColor = Color3.fromRGB(0, 150, 255),   -- Ocean Blue
        Background = Color3.fromRGB(18, 30, 45),
        Header = Color3.fromRGB(25, 40, 60),
        TextColor = Color3.fromRGB(200, 220, 240),
        ElementColor = Color3.fromRGB(30, 45, 65)
    },
    Sunset = {
        SchemeColor = Color3.fromRGB(255, 107, 107), -- Coral
        Background = Color3.fromRGB(45, 30, 35),
        Header = Color3.fromRGB(60, 40, 50),
        TextColor = Color3.fromRGB(255, 240, 245),
        ElementColor = Color3.fromRGB(65, 45, 55)
    },
    Forest = {
        SchemeColor = Color3.fromRGB(76, 175, 80),   -- Material Green
        Background = Color3.fromRGB(25, 35, 25),
        Header = Color3.fromRGB(35, 50, 35),
        TextColor = Color3.fromRGB(230, 245, 230),
        ElementColor = Color3.fromRGB(40, 55, 40)
    },
    Royal = {
        SchemeColor = Color3.fromRGB(156, 39, 176),  -- Deep Purple
        Background = Color3.fromRGB(25, 15, 35),
        Header = Color3.fromRGB(40, 25, 55),
        TextColor = Color3.fromRGB(240, 230, 255),
        ElementColor = Color3.fromRGB(45, 30, 65)
    },
    Minimal = {
        SchemeColor = Color3.fromRGB(100, 100, 100),
        Background = Color3.fromRGB(248, 249, 250),
        Header = Color3.fromRGB(238, 239, 240),
        TextColor = Color3.fromRGB(33, 37, 41),
        ElementColor = Color3.fromRGB(228, 229, 230)
    }
}

local oldTheme = ""
local SettingsT = {}
local Name = "XavoConfig.JSON"

pcall(function()
    if not pcall(function() readfile(Name) end) then
        writefile(Name, game:service'HttpService':JSONEncode(SettingsT))
    end
    Settings = game:service'HttpService':JSONDecode(readfile(Name))
end)

local LibName = "Xavo_"..tostring(math.random(1, 100))..tostring(math.random(1,50))..tostring(math.random(1, 100))

function Xavo:ToggleUI()
    if game.CoreGui[LibName].Enabled then
        game.CoreGui[LibName].Enabled = false
    else
        game.CoreGui[LibName].Enabled = true
    end
end

function Xavo.CreateLib(xavoName, themeList)
    if not themeList then
        themeList = themes
    end
    
    -- Handle string theme names
    if type(themeList) == "string" then
        if themeStyles[themeList] then
            themeList = themeStyles[themeList]
        else
            themeList = themes -- Fallback to default
        end
    end
    
    -- Validate theme properties
    if type(themeList) == "table" then
        themeList.SchemeColor = themeList.SchemeColor or Color3.fromRGB(88, 101, 242)
        themeList.Background = themeList.Background or Color3.fromRGB(32, 34, 37)
        themeList.Header = themeList.Header or Color3.fromRGB(40, 43, 48)
        themeList.TextColor = themeList.TextColor or Color3.fromRGB(220, 221, 222)
        themeList.ElementColor = themeList.ElementColor or Color3.fromRGB(47, 49, 54)
    end

    local selectedTab 
    xavoName = xavoName or "Xavo Library"
    table.insert(Xavo, xavoName)
    
    -- Clean up existing instances
    for i,v in pairs(game.CoreGui:GetChildren()) do
        if v:IsA("ScreenGui") and v.Name == LibName then
            v:Destroy()
        end
    end
    
    -- Create main interface
    local ScreenGui = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local MainCorner = Instance.new("UICorner")
    local MainHeader = Instance.new("Frame")
    local headerCover = Instance.new("UICorner")
    local coverup = Instance.new("Frame")
    local title = Instance.new("TextLabel")
    local close = Instance.new("ImageButton")
    local MainSide = Instance.new("Frame")
    local sideCorner = Instance.new("UICorner")
    local coverup_2 = Instance.new("Frame")
    local tabFrames = Instance.new("Frame")
    local tabListing = Instance.new("UIListLayout")
    local pages = Instance.new("Frame")
    local Pages = Instance.new("Folder")
    local infoContainer = Instance.new("Frame")
    local blurFrame = Instance.new("Frame")

    Xavo:DraggingEnabled(MainHeader, Main)

    -- Setup ScreenGui
    ScreenGui.Parent = game.CoreGui
    ScreenGui.Name = LibName
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false

    -- Main Frame Setup
    Main.Name = "Main"
    Main.Parent = ScreenGui
    Main.BackgroundColor3 = themeList.Background
    Main.ClipsDescendants = true
    Main.Position = UDim2.new(0.336, 0, 0.275, 0)
    Main.Size = UDim2.new(0, 540, 0, 340)

    MainCorner.CornerRadius = UDim.new(0, 8)  -- More rounded corners
    MainCorner.Name = "MainCorner"
    MainCorner.Parent = Main

    -- Header Setup
    MainHeader.Name = "MainHeader"
    MainHeader.Parent = Main
    MainHeader.BackgroundColor3 = themeList.Header
    Objects[MainHeader] = "BackgroundColor3"
    MainHeader.Size = UDim2.new(0, 540, 0, 35)  -- Slightly taller header
    
    headerCover.CornerRadius = UDim.new(0, 8)
    headerCover.Name = "headerCover"
    headerCover.Parent = MainHeader

    coverup.Name = "coverup"
    coverup.Parent = MainHeader
    coverup.BackgroundColor3 = themeList.Header
    Objects[coverup] = "BackgroundColor3"
    coverup.BorderSizePixel = 0
    coverup.Position = UDim2.new(0, 0, 0.7, 0)
    coverup.Size = UDim2.new(0, 540, 0, 10)

    -- Modern Title
    title.Name = "title"
    title.Parent = MainHeader
    title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1.000
    title.BorderSizePixel = 0
    title.Position = UDim2.new(0.02, 0, 0.25, 0)
    title.Size = UDim2.new(0, 250, 0, 18)
    title.Font = Enum.Font.GothamBold
    title.RichText = true
    title.Text = xavoName
    title.TextColor3 = themeList.TextColor
    title.TextSize = 18.000
    title.TextXAlignment = Enum.TextXAlignment.Left

    -- Modern Close Button
    close.Name = "close"
    close.Parent = MainHeader
    close.BackgroundColor3 = Color3.fromRGB(255, 87, 87)  -- Modern red
    close.Position = UDim2.new(0.94, 0, 0.2, 0)
    close.Size = UDim2.new(0, 22, 0, 22)
    close.ZIndex = 2
    close.Text = "×"
    close.Font = Enum.Font.GothamBold
    close.TextColor3 = Color3.fromRGB(255, 255, 255)
    close.TextSize = 16
    close.BorderSizePixel = 0
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 6)
    closeCorner.Parent = close
    
    close.MouseButton1Click:Connect(function()
        -- Modern close animation
        game.TweenService:Create(close, TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1
        }):Play()
        
        wait(0.1)
        
        game.TweenService:Create(Main, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0, Main.AbsolutePosition.X + (Main.AbsoluteSize.X / 2), 0, Main.AbsolutePosition.Y + (Main.AbsoluteSize.Y / 2))
        }):Play()
        
        wait(0.3)
        ScreenGui:Destroy()
    end)

    -- Side Panel
    MainSide.Name = "MainSide"
    MainSide.Parent = Main
    MainSide.BackgroundColor3 = themeList.Header
    Objects[MainSide] = "Header"
    MainSide.Position = UDim2.new(0, 0, 0.103, 0)
    MainSide.Size = UDim2.new(0, 160, 0, 305)  -- Wider sidebar

    sideCorner.CornerRadius = UDim.new(0, 8)
    sideCorner.Name = "sideCorner"
    sideCorner.Parent = MainSide

    coverup_2.Name = "coverup"
    coverup_2.Parent = MainSide
    coverup_2.BackgroundColor3 = themeList.Header
    Objects[coverup_2] = "Header"
    coverup_2.BorderSizePixel = 0
    coverup_2.Position = UDim2.new(0.94, 0, 0, 0)
    coverup_2.Size = UDim2.new(0, 10, 0, 305)

    -- Tab Container
    tabFrames.Name = "tabFrames"
    tabFrames.Parent = MainSide
    tabFrames.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tabFrames.BackgroundTransparency = 1.000
    tabFrames.Position = UDim2.new(0.05, 0, 0.02, 0)
    tabFrames.Size = UDim2.new(0, 145, 0, 295)

    tabListing.Name = "tabListing"
    tabListing.Parent = tabFrames
    tabListing.SortOrder = Enum.SortOrder.LayoutOrder
    tabListing.Padding = UDim.new(0, 4)

    -- Pages Container
    pages.Name = "pages"
    pages.Parent = Main
    pages.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    pages.BackgroundTransparency = 1.000
    pages.BorderSizePixel = 0
    pages.Position = UDim2.new(0.296, 0, 0.125, 0)
    pages.Size = UDim2.new(0, 380, 0, 295)

    Pages.Name = "Pages"
    Pages.Parent = pages

    -- Info Container
    infoContainer.Name = "infoContainer"
    infoContainer.Parent = Main
    infoContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    infoContainer.BackgroundTransparency = 1.000
    infoContainer.BorderColor3 = Color3.fromRGB(27, 42, 53)
    infoContainer.ClipsDescendants = true
    infoContainer.Position = UDim2.new(0.296, 0, 0.88, 0)
    infoContainer.Size = UDim2.new(0, 385, 0, 35)

    -- Blur Frame
    blurFrame.Name = "blurFrame"
    blurFrame.Parent = pages
    blurFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    blurFrame.BackgroundTransparency = 1
    blurFrame.BorderSizePixel = 0
    blurFrame.Position = UDim2.new(-0.025, 0, -0.04, 0)
    blurFrame.Size = UDim2.new(0, 395, 0, 310)
    blurFrame.ZIndex = 999
    
    -- Theme update loop
    coroutine.wrap(function()
        while wait() do
            Main.BackgroundColor3 = themeList.Background
            MainHeader.BackgroundColor3 = themeList.Header
            MainSide.BackgroundColor3 = themeList.Header
            coverup_2.BackgroundColor3 = themeList.Header
            coverup.BackgroundColor3 = themeList.Header
            title.TextColor3 = themeList.TextColor
        end
    end)()

    function Xavo:ChangeColor(property, color)
        if property == "Background" then
            themeList.Background = color
        elseif property == "SchemeColor" then
            themeList.SchemeColor = color
        elseif property == "Header" then
            themeList.Header = color
        elseif property == "TextColor" then
            themeList.TextColor = color
        elseif property == "ElementColor" then
            themeList.ElementColor = color
        end
    end

    local Tabs = {}
    local first = true

    function Tabs:NewTab(tabName)
        tabName = tabName or "Tab"
        local tabButton = Instance.new("TextButton")
        local UICorner = Instance.new("UICorner")
        local page = Instance.new("ScrollingFrame")
        local pageListing = Instance.new("UIListLayout")

        local function UpdateSize()
            local cS = pageListing.AbsoluteContentSize
            game.TweenService:Create(page, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                CanvasSize = UDim2.new(0, cS.X, 0, cS.Y)
            }):Play()
        end

        -- Page Setup
        page.Name = "Page"
        page.Parent = Pages
        page.Active = true
        page.BackgroundColor3 = themeList.Background
        page.BorderSizePixel = 0
        page.Position = UDim2.new(0, 0, 0, 0)
        page.Size = UDim2.new(1, 0, 1, 0)
        page.ScrollBarThickness = 6
        page.Visible = false
        page.ScrollBarImageColor3 = themeList.SchemeColor
        
        -- Modern scrollbar styling
        page.ScrollBarImageTransparency = 0.3

        pageListing.Name = "pageListing"
        pageListing.Parent = page
        pageListing.SortOrder = Enum.SortOrder.LayoutOrder
        pageListing.Padding = UDim.new(0, 6)

        -- Modern Tab Button
        tabButton.Name = tabName.."TabButton"
        tabButton.Parent = tabFrames
        tabButton.BackgroundColor3 = themeList.SchemeColor
        Objects[tabButton] = "SchemeColor"
        tabButton.Size = UDim2.new(0, 145, 0, 32)  -- Taller tabs
        tabButton.AutoButtonColor = false
        tabButton.Font = Enum.Font.GothamSemibold
        tabButton.Text = tabName
        tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        tabButton.TextSize = 15.000
        tabButton.BackgroundTransparency = 1

        -- Set first tab as active
        if first then
            first = false
            page.Visible = true
            tabButton.BackgroundTransparency = 0
            UpdateSize()
        else
            page.Visible = false
            tabButton.BackgroundTransparency = 1
        end

        UICorner.CornerRadius = UDim.new(0, 8)  -- More rounded
        UICorner.Parent = tabButton
        table.insert(Tabs, tabName)

        UpdateSize()
        page.ChildAdded:Connect(UpdateSize)
        page.ChildRemoved:Connect(UpdateSize)

        -- Modern tab switching animation
        tabButton.MouseButton1Click:Connect(function()
            UpdateSize()
            
            -- Smooth page transition
            for i,v in next, Pages:GetChildren() do
                if v.Visible then
                    game.TweenService:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Position = UDim2.new(-1, 0, 0, 0)
                    }):Play()
                    wait(0.1)
                    v.Visible = false
                    v.Position = UDim2.new(0, 0, 0, 0)
                end
            end
            
            page.Position = UDim2.new(1, 0, 0, 0)
            page.Visible = true
            game.TweenService:Create(page, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Position = UDim2.new(0, 0, 0, 0)
            }):Play()
            
            -- Tab button animations
            for i,v in next, tabFrames:GetChildren() do
                if v:IsA("TextButton") then
                    Utility:TweenObject(v, {
                        BackgroundTransparency = 1,
                        TextColor3 = Color3.fromRGB(180, 180, 180)
                    }, 0.2)
                end
            end
            
            Utility:TweenObject(tabButton, {
                BackgroundTransparency = 0,
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }, 0.2)
        end)

        local Sections = {}
        local focusing = false
        local viewDe = false

        -- Theme update for tabs
        coroutine.wrap(function()
            while wait() do
                page.BackgroundColor3 = themeList.Background
                page.ScrollBarImageColor3 = themeList.SchemeColor
                tabButton.BackgroundColor3 = themeList.SchemeColor
            end
        end)()
    
        function Sections:NewSection(secName, hidden)
            secName = secName or "Section"
            local sectionFunctions = {}
            local modules = {}
            hidden = hidden or false
            
            local sectionFrame = Instance.new("Frame")
            local sectionlistoknvm = Instance.new("UIListLayout")
            local sectionHead = Instance.new("Frame")
            local sHeadCorner = Instance.new("UICorner")
            local sectionName = Instance.new("TextLabel")
            local sectionInners = Instance.new("Frame")
            local sectionElListing = Instance.new("UIListLayout")
			
            if hidden then
                sectionHead.Visible = false
            else
                sectionHead.Visible = true
            end

            sectionFrame.Name = "sectionFrame"
            sectionFrame.Parent = page
            sectionFrame.BackgroundColor3 = themeList.Background
            sectionFrame.BorderSizePixel = 0
            
            sectionlistoknvm.Name = "sectionlistoknvm"
            sectionlistoknvm.Parent = sectionFrame
            sectionlistoknvm.SortOrder = Enum.SortOrder.LayoutOrder
            sectionlistoknvm.Padding = UDim.new(0, 6)

            -- Modern Section Header
            sectionHead.Name = "sectionHead"
            sectionHead.Parent = sectionFrame
            sectionHead.BackgroundColor3 = themeList.SchemeColor
            Objects[sectionHead] = "BackgroundColor3"
            sectionHead.Size = UDim2.new(0, 370, 0, 38)  -- Taller section headers

            sHeadCorner.CornerRadius = UDim.new(0, 10)  -- More rounded
            sHeadCorner.Name = "sHeadCorner"
            sHeadCorner.Parent = sectionHead

            sectionName.Name = "sectionName"
            sectionName.Parent = sectionHead
            sectionName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            sectionName.BackgroundTransparency = 1.000
            sectionName.BorderColor3 = Color3.fromRGB(27, 42, 53)
            sectionName.Position = UDim2.new(0.025, 0, 0, 0)
            sectionName.Size = UDim2.new(0.975, 0, 1, 0)
            sectionName.Font = Enum.Font.GothamBold
            sectionName.Text = secName
            sectionName.RichText = true
            sectionName.TextColor3 = Color3.fromRGB(255, 255, 255)
            sectionName.TextSize = 16.000
            sectionName.TextXAlignment = Enum.TextXAlignment.Left
               
            sectionInners.Name = "sectionInners"
            sectionInners.Parent = sectionFrame
            sectionInners.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            sectionInners.BackgroundTransparency = 1.000
            sectionInners.Position = UDim2.new(0, 0, 0.15, 0)

            sectionElListing.Name = "sectionElListing"
            sectionElListing.Parent = sectionInners
            sectionElListing.SortOrder = Enum.SortOrder.LayoutOrder
            sectionElListing.Padding = UDim.new(0, 4)

            -- Theme updates for sections
            coroutine.wrap(function()
                while wait() do
                    sectionFrame.BackgroundColor3 = themeList.Background
                    sectionHead.BackgroundColor3 = themeList.SchemeColor
                    sectionName.TextColor3 = Color3.fromRGB(255, 255, 255)
                end
            end)()

            local function updateSectionFrame()
                local innerSc = sectionElListing.AbsoluteContentSize
                sectionInners.Size = UDim2.new(1, 0, 0, innerSc.Y)
                local frameSc = sectionlistoknvm.AbsoluteContentSize
                sectionFrame.Size = UDim2.new(0, 370, 0, frameSc.Y)
            end
            
            updateSectionFrame()
            UpdateSize()
            
            local Elements = {}
            
            function Elements:NewButton(bname, tipINf, callback)
                local ButtonFunction = {}
                tipINf = tipINf or "Click to execute this button's function"
                bname = bname or "Button"
                callback = callback or function() end

                local buttonElement = Instance.new("TextButton")
                local UICorner = Instance.new("UICorner")
                local btnInfo = Instance.new("TextLabel")
                local touch = Instance.new("ImageLabel")

                table.insert(modules, bname)

                -- Modern Button Styling
                buttonElement.Name = bname
                buttonElement.Parent = sectionInners
                buttonElement.BackgroundColor3 = themeList.ElementColor
                buttonElement.ClipsDescendants = true
                buttonElement.Size = UDim2.new(0, 370, 0, 38)  -- Taller buttons
                buttonElement.AutoButtonColor = false
                buttonElement.Font = Enum.Font.SourceSans
                buttonElement.Text = ""
                buttonElement.TextColor3 = Color3.fromRGB(0, 0, 0)
                buttonElement.TextSize = 14.000
                Objects[buttonElement] = "BackgroundColor3"

                UICorner.CornerRadius = UDim.new(0, 8)
                UICorner.Parent = buttonElement

                -- Modern Icon
                touch.Name = "touch"
                touch.Parent = buttonElement
                touch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                touch.BackgroundTransparency = 1.000
                touch.Position = UDim2.new(0.025, 0, 0.21, 0)
                touch.Size = UDim2.new(0, 22, 0, 22)
                touch.Image = "rbxassetid://3926305904"
                touch.ImageColor3 = themeList.SchemeColor
                touch.ImageRectOffset = Vector2.new(84, 204)
                touch.ImageRectSize = Vector2.new(36, 36)

                btnInfo.Name = "btnInfo"
                btnInfo.Parent = buttonElement
                btnInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                btnInfo.BackgroundTransparency = 1.000
                btnInfo.Position = UDim2.new(0.1, 0, 0.26, 0)
                btnInfo.Size = UDim2.new(0, 320, 0, 18)
                btnInfo.Font = Enum.Font.GothamSemibold
                btnInfo.Text = bname
                btnInfo.RichText = true
                btnInfo.TextColor3 = themeList.TextColor
                btnInfo.TextSize = 15.000
                btnInfo.TextXAlignment = Enum.TextXAlignment.Left

                updateSectionFrame()
                UpdateSize()

                local ms = game.Players.LocalPlayer:GetMouse()

                -- Modern button click with ripple effect
                buttonElement.MouseButton1Click:Connect(function()
                    if not focusing then
                        callback()
                        
                        -- Modern click animation
                        local ripple = Instance.new("Frame")
                        ripple.Name = "Ripple"
                        ripple.Parent = buttonElement
                        ripple.BackgroundColor3 = themeList.SchemeColor
                        ripple.BackgroundTransparency = 0.5
                        ripple.Size = UDim2.new(0, 0, 0, 0)
                        ripple.Position = UDim2.new(0.5, 0, 0.5, 0)
                        ripple.AnchorPoint = Vector2.new(0.5, 0.5)
                        
                        local rippleCorner = Instance.new("UICorner")
                        rippleCorner.CornerRadius = UDim.new(1, 0)
                        rippleCorner.Parent = ripple
                        
                        game.TweenService:Create(ripple, TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                            Size = UDim2.new(0, 400, 0, 400),
                            BackgroundTransparency = 1
                        }):Play()
                        
                        game:GetService("Debris"):AddItem(ripple, 0.6)
