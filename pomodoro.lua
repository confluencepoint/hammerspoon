-- on start should close list of distractions
-- on pause/stop should open distractions back up
-- ideally changes the /etc/hosts too
-- preferably puts a "25m..." menubar item, updates once a minute

local hyper = require("hyper")
local hsApp = require("hs.application")

local pomoMode = hs.hotkey.modal.new()
hyper:bind({}, 'p', nil, function() pomoMode:enter() end)

local defaultPomodoroLength = 25

local timer = hs.timer.new(1, function() update() end)
local closedDistractions = {}
local string = ""

-- UI

function showPrompt(str)
  hs.alert.closeAll()
  hs.fnutils.imap(hs.screen.allScreens(), function(screen)
    return hs.alert.show(str, hs.alert.defaultStyle, screen, true)
  end)
end

function pomoMode:entered()
  if timerRunning then

    showPrompt("🍅: " .. string .. "\nPress Enter to stop\nPress Space to pause")
  else
    showPrompt("🍅 Press Enter to start Pomorodo! 🍅")
  end
end

function pomoMode:exited()
  hs.alert.closeAll()
end

function startOrStopPomodoro()
  if not timerRunning then
    startPomodoro()
  else
    stopPomodoro()
  end
end

function stopPomodoro()
  showPrompt("Stopping pomodoro!")
  timerRunning = false
  for _, app in pairs(closedDistractions) do
    hsApp.launchOrFocus(app)
  end
  closedDistractions = {}
  timer:stop()
end

function startPomodoro()
  showPrompt("Pomodoro started...")
  timerRunning = true
  for _, app in pairs(config.applications) do
    pid = hsApp.find(app.name)
    if pid and app.distraction then
      table.insert(closedDistractions, app.name) -- keep track of it
      pid:kill()
    end
  end
  setupTimer()
  timer:start()
end

function pausePomodoro()
  if timer:running() then
    showPrompt("Pausing pomodoro...")
    timer:stop()
  else
    showPrompt("Resuming pomodoro...")
    timer:start()
  end
end

function setupTimer()
  timeLeft = hs.timer.minutes(defaultPomodoroLength)
end

-- Timer

update = function()
  local minutes = math.floor(timeLeft / 60)
  local seconds = timeLeft - (minutes * 60)
  string = string.format("%02d:%02d", minutes, seconds)

  if not timer then return end
  timeLeft = timeLeft - 1
  if timeLeft <= 0 then
    stopPomodoro()
  end
end

pomoMode:bind('', 'escape', function() pomoMode:exit() end)
pomoMode:bind('', 'return', startOrStopPomodoro)
pomoMode:bind('', 'space', pausePomodoro)
