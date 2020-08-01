package = "hello"
version = "0.1.0-1"
source = {
   url = "git+https://github.com/nattatorn-dev/kong.git"
}
description = {
   homepage = "https://github.com/nattatorn-dev/kong",
   license = "MIT"
}
build = {
   type = "builtin",
   modules = {
      ["kong.plugins.hello.handler"] = "kong/plugins/hello/handler.lua",
      ["kong.plugins.hello.schema"] = "kong/plugins/hello/schema.lua"
   }
}
