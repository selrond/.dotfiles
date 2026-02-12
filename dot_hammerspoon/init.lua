local function isMaximized(win)
  local winFrame = win:frame()
  local screenFrame = win:screen():frame()
  local tolerance = 5
  return math.abs(winFrame.x - screenFrame.x) <= tolerance and
      math.abs(winFrame.y - screenFrame.y) <= tolerance and
      math.abs(winFrame.w - screenFrame.w) <= tolerance and
      math.abs(winFrame.h - screenFrame.h) <= tolerance
end

hs.hotkey.bind({ "cmd", "ctrl", "shift", "alt" }, "\\", function()
  local frontmost = hs.application.frontmostApplication()
  if frontmost:name() == "Ghostty" then
    frontmost:hide()
  else
    hs.application.launchOrFocus("Ghostty")
    hs.timer.doAfter(0.1, function()
      local ghostty = hs.application.find("Ghostty")
      if ghostty then
        local win = ghostty:mainWindow()
        if win and not isMaximized(win) then
          win:maximize()
        end
      end
    end)
  end
end)
