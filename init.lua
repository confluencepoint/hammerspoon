local fennel = require("Fennel/Fennel")
fennel.dofile("init.fnl")

-- Hyper+key for all the below are handled in some other software
-- "fall through".
config.hyper_fall_through = {'c', 'space', '\\', 'p', '\'', 't'}

local hyper = require 'hyper'

require 'autolayout'
require 'movewindows'
require 'pomodoro'

hyper:bind({}, 'r', nil, function() hs.reload() end)
