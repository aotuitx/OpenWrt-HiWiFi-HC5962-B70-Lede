感谢各位18CM的先遣者

全部参考各位18CM的先遣者，然后自己理解瞎编一通还能运行。



Luci-App-Bypass + AdGuard Home 的食用方法记录：

如果想一起用，首先 AdGuard Home 的转发端口不能用：53
如果想一起用，首先 AdGuard Home 的转发端口不能用：53
如果想一起用，首先 AdGuard Home 的转发端口不能用：53
如果不用Bypass，那端口是哪个就无所谓了。

### AdGuard Home 设置
![image](https://github.com/aotuitx/B70/blob/main/Images/AdGuardHome1.png?raw=true)

![image](https://github.com/aotuitx/B70/blob/main/Images/AdGuardHome2.png?raw=true)

### DHCP/DNS 设置


![image](https://github.com/aotuitx/B70/blob/main/Images/DHCP.png?raw=true)

### Bypass 设置
![image](https://github.com/aotuitx/B70/blob/main/Images/Bypass.png?raw=true)












自定义文件 “files 大法”是把你自定义的配置编译到固件里。这样升级或恢复出厂设置都不需要保留配置，缺省值就是自定义的配置。
如你现在的network设置编译进固件：首先提取路由固件下的\etc\config\network 然后在项目根目录下创建files目录并push 到 \files\etc\config\network ，
最后编译出来的固件就是现在设置的network。
