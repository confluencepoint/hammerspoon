local fennel = require("Fennel/Fennel")
table.insert(package.loaders or package.searchers, fennel.searcher)
fennel.dofile("init.fnl")
