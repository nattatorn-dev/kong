# Initial Plugin directory

```
mkdir -p hello/kong/plugins/hello
touch hello/kong/plugins/hello/{handler,schema}.lua
cd hello/
luarocks write_rockspec
```


sudo apt-get install -y lua
sudo apt-get install -y luarocks