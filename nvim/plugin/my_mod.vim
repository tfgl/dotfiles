fun! MyMod()
  lua for k in pairs(package.loaded) do if k:match("^my_mod") then package.loaded[k] = nil end end
  lua require("my_mod").pop()
endfun

aug MyMod
  autocmd!
aug END 
