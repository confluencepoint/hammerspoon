local fennel = require("Fennel/Fennel")
fennel.dofile("init.fnl")

local hyper = require 'hyper'

require 'autolayout'
require 'movewindows'
require 'pomodoro'

hyper:bind({}, 'r', nil, function() hs.reload() end)
