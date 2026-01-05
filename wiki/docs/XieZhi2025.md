---
Title: 2025_XiezhiCup_WalkThrough
Author: NoahTie @ 猫猫啥也不会, kakahuote
date: 2025-09-25 23:00:00
tags:
- 电子数据取证
- wp
description: 2025年第二届獬豸杯题解
---

# 2025年第二届獬豸杯题解

!!! info "Author"
    NoahTie@猫猫啥也不会 & kakahuote

    Reference: [獬豸杯2025取证总结](https://blog.928330.xyz/p/%E7%8D%AC%E8%B1%B8%E6%9D%AF2025%E5%8F%96%E8%AF%81%E6%80%BB%E7%BB%93/) 


## 比赛信息

!!! note "说明"
    检材下载连接等信息来自于 [DIDCTF 平台](https://exam.didctf.com), 感谢 DIDCTF 平台提供的比赛资料与在线练习环境.

### 写在前面

> kakahuote:
> 
> 不愧是经常做题的人出的题目，水平确实高，题目质量相比去年也提升了很多很多
> 
> 美中不足的是我没看见案件背景，感觉就是纯粹的做题
> 

这份 WP 是我在看过 kakahuote 的 WP 的基础上完成的, 手机和计算机取证部分大体上参考了 kakahuote 的思路, 主要解决了一下服务器取证部分的问题. 这些问题大致包括:

1. k8s 服务无法正常运行
    * 检材内 k8s 的证书已经过期(有效期至 2025 年 6 月).
    * 我们做这套题的时间在 25 年 9 月, 因此遇到了先前发布的 WP 中都没有遇到过的证书过期问题.
2. 服务器中 Nginx 的异常
    * 服务器上安装了 2 个不同的 Nginx, 分别来自 yum 安装和宝塔面板下载.
    * 2 个 Nginx 均通过服务自启动, 并且绑定了相同的端口

~~终于看到学弟/学妹的取证 WP 了, 可以安心退休了~~

### 检材信息

容器密码: `}2N|n_yxdt!G/Ru}|_zdn$@?6@CD8E`

容器 SHA-256: c0b92e1d2f22e26b9ff22451e49e23cd5b6e7ec4a4b655f4698d36faf162d8b0

## 手机取证

先跑一遍应用识别, 看到一些可能有价值的应用:

![Pasted image 20250923093734.png](./attachments/Pasted%20image%2020250923093734.png)

![Pasted image 20250923093800.png](./attachments/Pasted%20image%2020250923093800.png)

![Pasted image 20250923093918.png](./attachments/Pasted%20image%2020250923093918.png)

### 1 登录的直播 APP 的 IDX 是

!!! info "答案"
    35248617

设备上安装的第三方影音类应用有以下 3 个:

![Pasted image 20250923094110.png](./attachments/Pasted%20image%2020250923094110.png)

在"烟雨直播"的应用数据目录 `/data/com.huodong.yanyu/databases/miao.db` 中的表 `login` 中存储着用户信息, 其中 `idx` 字段的值为"35248617":

![Pasted image 20250923094806.png](./attachments/Pasted%20image%2020250923094806.png)

### 2 目前直播的等级名称是

!!! info "答案"
    一无所有

在小米相册(com.miui.gellery)的略缩图缓存目录 `/media/0/Android/data/com.miui.gallery/files/gallery_disk_cache` 中, 存在相关图片:

![Pasted image 20250923103748.png](./attachments/Pasted%20image%2020250923103748.png)

可通过火眼的特征分析 + 图片文本识别工具快速找到该文件:

![Pasted image 20250923104148.png](./attachments/Pasted%20image%2020250923104148.png)

### 3 地图中哪座山有绝望坡

!!! info "答案"
    武功山

在上题提到的缓存目录中, 存在一张疑似地图应用的截图:

![Pasted image 20250923104257.png](./attachments/Pasted%20image%2020250923104257.png)

其中提及到"武功山绝望坡".

使用 FTK Imager 挂载手机镜像(实际上是 Tar 压缩包, 也可以直接解压)后, 将挂载目录导入到 XWF 中, 使用同步搜索查找"绝望坡":

![Pasted image 20250923155524.png](./attachments/Pasted%20image%2020250923155524.png)

发现在白马地图(com.xykj.yydhbmdt)的应用数据目录的 `/data/com.xykj.yydhbmdt/shared_prefs/share_data.xml` 中保存着相关数据.

### 4 手机的历史 SIM 卡中, 中国电信卡的 IMSI 

!!! info "答案"
    460115143563428

![Pasted image 20250923105507.png](./attachments/Pasted%20image%2020250923105507.png)

### 5 1 月 22 日 16:40 的会议号

!!! info "答案"
    312-118-071

还是在上述缓存目录中:

![Pasted image 20250923105808.png](./attachments/Pasted%20image%2020250923105808.png)

该会议号也可以在网易会议的应用数据目录 `/data/com.netease.yunxin.meeting/shared_prefs/FlutterSharedPreferences.xml` 中找到:

![Pasted image 20250923111241.png](./attachments/Pasted%20image%2020250923111241.png)

在 XWF 中使用同步搜索搜索时间"2025-01-22 16:40"可以找到网易会议的日志:

![Pasted image 20250923162725.png](./attachments/Pasted%20image%2020250923162725.png)

![Pasted image 20250923162826.png](./attachments/Pasted%20image%2020250923162826.png)

### 6 网易会议中个人会议号

!!! info "答案"
    267-982-3922

还是在上述缓存目录中:

![Pasted image 20250923111656.png](./attachments/Pasted%20image%2020250923111656.png)

或者在上题中找到的日志文件中, 搜索关键字"meetingNum"可以找到"privateMeetingNum":

![Pasted image 20250923163026.png](./attachments/Pasted%20image%2020250923163026.png)

这里还可以找到用户的手机号码: 17751125237.

### 7 记账软件中一共记了几笔

!!! info "答案"
    4

还是在上述缓存目录中:

![Pasted image 20250923111933.png](./attachments/Pasted%20image%2020250923111933.png)

在"记账小能手"(com.csmountainaccount.easy)的应用数据目录 `/data/com.csmountainaccount.easy/databases/app_database.db_manager` 中的表 `AccountRecordBean` 中也可看到相关信息:

![Pasted image 20250923112245.png](./attachments/Pasted%20image%2020250923112245.png)

### 8 谁给了机主 100000

!!! info "答案"
    勇哥

还是在上述缓存目录中:

![Pasted image 20250923112428.png](./attachments/Pasted%20image%2020250923112428.png)

或者在上题提到的数据库中也可以看到.

### 9 聊天软件是否需要手机号登录

!!! info "答案"
    否

手机上安装的聊天软件是"盒子 IM", 应用描述中提供了开源地址 `https://gitee.com/bluexsx/box-im/`:

![Pasted image 20250923113438.png](./attachments/Pasted%20image%2020250923113438.png)

该应用是一个可由用户部署服务端的 IM, 注册时并不需要手机号:

![Pasted image 20250923114049.png](./attachments/Pasted%20image%2020250923114049.png)

在"盒子 IM"的应用数据目录的 `/data/com.boxim/database/DCStorage` 数据库中可以看到存储在本地的一些数据:

![Pasted image 20250923164538.png](./attachments/Pasted%20image%2020250923164538.png)

可以看到数据库也只保存了用户名和口令, 而没有保存手机号码.

### 10 机主的给对方的活有多少钱

!!! info "答案"
    3 万

接上题, 在数据库的表 `DC_137389484_storage` 中可以看到用户的聊天记录:

![Pasted image 20250923164856.png](./attachments/Pasted%20image%2020250923164856.png)

### 11 机主的手机号

!!! info "答案"
    17751125237

参考手机取证第 6 题.

或者在安卓电话服务的数据目录 `/user_de/0/com.android.server.telecom/files/phone-account-registrar-state.xml` 中也可以找到:

![Pasted image 20250923165208.png](./attachments/Pasted%20image%2020250923165208.png)

### 12 手机的 IMEI1 后四位

!!! info "答案"
    1055

![Pasted image 20250923165548.png](./attachments/Pasted%20image%2020250923165548.png)

### 13 手机上一共有几个地图软件

!!! info "答案"
    3

筛选"地图导航"分类的应用:

![Pasted image 20250923170016.png](./attachments/Pasted%20image%2020250923170016.png)

## 计算机取证

### 1 网卡的 Mac 地址

!!! info "答案"
    00-0C-29-BF-8B-30

计算机安装了 2 张物理网卡:

![Pasted image 20250923175622.png](./attachments/Pasted%20image%2020250923175622.png)

使用 Windows Registry Recovery 查看 `ROOT\ControlSet001\Services\Tcpip\Linkage` 中存储的网卡绑定顺序:

![Pasted image 20250923182205.png](./attachments/Pasted%20image%2020250923182205.png)

按照网卡绑定的先后顺序, 名称为"Intel(R) 82574L Gigabit Network Connection"的网卡为默认网卡:

![Pasted image 20250923182249.png](./attachments/Pasted%20image%2020250923182249.png)

仿真之后通过 `IPCONFIG` 指令也能看到默认网卡信息.

### 2 系统内部版本号

!!! info "答案"
    18363

### 3 计算机系统开机密码

!!! info "答案"
    WAXD9128@

便签中保存着 1 条口令:

![Pasted image 20250923182803.png](./attachments/Pasted%20image%2020250923182803.png)

重新分析浏览器数据, 可以验证该口令正确.

### 4 分析计算机检材中手机流量包, 黑客虚拟身份的密码

!!! info "答案"
    a12345678

在 Documents 目录里发现了 1 个 NOX 的备份 `backup20240625153457.npbk` 和 1 个 Fiddler 的 Session Archive(.saz) 文件 `dididi.saz`:

![Pasted image 20250923184813.png](./attachments/Pasted%20image%2020250923184813.png)

用 Fiddler 加载 saz 文件, 搜索"login"关键字, 在命中流量包中可以看到 POST 请求中包含了明文的口令:

![Pasted image 20250924111958.png](./attachments/Pasted%20image%2020250924111958.png)

### 5 分析计算机检材中手机流量包, 黑客人员使用的夜神模拟器的手机型号

!!! info "答案"
    SM-G955N

搜索"device"关键字, 在命中流量包中看到向 NOX 的服务器发送的模拟器信息:

![Pasted image 20250924112346.png](./attachments/Pasted%20image%2020250924112346.png)

### 6 分析计算机检材中手机流量包, 黑客看视频的时间是几月份

!!! info "答案"
    5

搜索"video"关键字, 在命中流量包中看到访问了抖音的流量包, `mime_type` 为 `video_mp4`:

![Pasted image 20250924112720.png](./attachments/Pasted%20image%2020250924112720.png)

### 7 分析计算机检材中手机流量包, “天戮宇宙”出自哪个小说平台

!!! info "答案"
    起点中文网

搜索"book"关键字, 在命中流量包中看到从 `bookcover.yuewen.com` 获取到的小说封面图片:

![Pasted image 20250924113025.png](./attachments/Pasted%20image%2020250924113025.png)

该域名为"阅文"的域名, 小说封面上包含的 LOGO "起点中文网"是其旗下的小说网站.

### 8 在手机模拟器中勒索软件 APK 包的 sha256 值

!!! info "答案"
    340bd211955996c5d62bbde94a0bed4eb3a7965b23af52114991bca02346928e

导出在 Documents 目录中找到的 NOX 备份文件, 将其解压即可得到模拟器的 vmdk 虚拟磁盘文件. 使用 FTK Imager 打开虚拟磁盘, 并导出 `/app/com.fankes.tmoreplus-1/base.apk`.

![Pasted image 20250924113950.png](./attachments/Pasted%20image%2020250924113950.png)

该模拟器备份文件与 2024 年龙信杯计算机取证部分的 NOX 模拟器备份文件一致. 解题思路参考 [龙信杯 2024 题解 #19](https://forensics.xidian.edu.cn/wiki/Longxin2024/#19-apk-sha256).

### 9 接上题, 勒索软件的解锁密码

!!! info "答案"
    `anzhuo.com`

解题思路参考 [龙信杯 2024 题解 #20](https://forensics.xidian.edu.cn/wiki/Longxin2024/#20-apk).

### 10 signed_xz.exe 程序 SHA1 后 6 位

!!! info "答案"
    8955b1

!!! note "非预期的方法"
    由于出题人使用 VMware Tools 传输文件, 导致其缓存目录 `/Users/TTT/AppData/Local/Temp/vmware-TTT/VMwareDnD` 下存在题目中提及的文件.

    ![Pasted image 20250924114959.png](./attachments/Pasted%20image%2020250924114959.png)

    在该目录下还存在后续题目中提及到的"澳门新葡京 APK".


通过火眼的特征分析可以找到一个加密容器, 火眼识别为 TrueCrypt 容器, 实际上为 VeraCrypt 容器:

![Pasted image 20250924103055.png](./attachments/Pasted%20image%2020250924103055.png)

在桌面上的 `mm.txt` 中可以看到关于"容器密码"的提示:

![Pasted image 20250924115944.png](./attachments/Pasted%20image%2020250924115944.png)

挂载加密容器时使用 `新建文本文档.txt` 作为密钥文件. 在容器内找到 `signed_xz.exe` 文件:

![Pasted image 20250924120518.png](./attachments/Pasted%20image%2020250924120518.png)

计算其 SHA1 哈希:

![Pasted image 20250924120603.png](./attachments/Pasted%20image%2020250924120603.png)

### 11 signed_xz.exe 程序中的函数名为 curl_version_info 的函数地址

!!! info "答案"
    0x004393c0

用 DIE 加载该应用程序. 查看导出表, 在其中找到 `curl_version_info` 函数, 其相对虚拟地址(RVA)为 `0x000393c0`:

![Pasted image 20250924120946.png](./attachments/Pasted%20image%2020250924120946.png)

查看内存映射, 看到应用程序的基址(虚拟地址)为 `0x00400000`:

![Pasted image 20250924121351.png](./attachments/Pasted%20image%2020250924121351.png)

函数地址为 `基址 + RVA = 0x004393c0`.

### 12 signed_xz.exe 程序中节名为 .reloc 的虚拟地址

!!! info "答案"
    0x035b5000

查看节信息, 看到 `.reloc` 节的虚拟地址:

![Pasted image 20250924122418.png](./attachments/Pasted%20image%2020250924122418.png)

### 13 澳门新葡京 APK 包名

!!! info "答案"
    com.suijideszzuiji.cocosandroid

在 `Partition 4` 目录中存储着 1 个 APK 文件 `base.apk`, 将其导出并用雷电 APP 智能分析工具加载:

![Pasted image 20250924131846.png](./attachments/Pasted%20image%2020250924131846.png)

在 JEB 中查看 Manifest:

![Pasted image 20250924133626.png](./attachments/Pasted%20image%2020250924133626.png)

### 14 澳门新葡京 APK 是否加固, 加固则说明是什么加固

!!! info "答案"
    未加固

![Pasted image 20250924131932.png](./attachments/Pasted%20image%2020250924131932.png)

### 15 澳门新葡京 APK 是否会往手机的 SD 卡中写入数据, 若是则该权限的名称为

!!! info "答案"
    android.permission.WRITE_EXTERNAL_STORAGE

![Pasted image 20250924132029.png](./attachments/Pasted%20image%2020250924132029.png)

在 JEB 中查看 Manifest:

![Pasted image 20250924133703.png](./attachments/Pasted%20image%2020250924133703.png)

### 16 澳门新葡京 APK 登录的 api 地址

!!! info "答案"
    `https://168js.bvocftd.com/ky188/member/memberManager/login`

在 JEB 中查看 Manifest, 找到应用的 MainActivity:

![Pasted image 20250924133901.png](./attachments/Pasted%20image%2020250924133901.png)

JEB 里面静态找了半天, 没找到硬编码或者在配置里的 API. 装模拟器里发现服务居然没挂, 于是开始用雷电抓包.

![Pasted image 20250924141156.png](./attachments/Pasted%20image%2020250924141156.png)

看到请求的调用栈才反应过来, 这个应用是用 cocos2d 做的, 游戏的核心代码应该都在加密过的 JSC 文件里. 解密很容易, 只需要导出 APK 包中的 `Libraries/arm64-v8a/libcoco2djs.so`, 使用 IDA 加载并找到 `.rodata` 段. 段的起始位置附近就有 xxtea 的密钥:

![Pasted image 20250924144051.png](./attachments/Pasted%20image%2020250924144051.png)

使用 [OEDx/cocos-jsc-endecryptor at v2.0](https://github.com/OEDx/cocos-jsc-endecryptor/tree/v2.0) 对 `assets/src/project.jsc` 进行解密.

在 `Userservice` 中可以看到关于"login"的字符串:

![Pasted image 20250924151638.png](./attachments/Pasted%20image%2020250924151638.png)

接着在 `t.Login` 函数中看到调用 `l.default.aesPost` 函数, 参数之一为 `a.httpGameUrls.LOGIN_URL`:

![Pasted image 20250924151847.png](./attachments/Pasted%20image%2020250924151847.png)

声明 `l` 与 `a` 的代码为:

```js
var s = e("./BaseService"),
    a = e("./NetStr"),
    c = e("../config/DataConfig"),
    l = e("../common/HttpClient")
```

找到声明 `NetStr` 的位置, 在其中找到 `LOGIN_URL`:

![Pasted image 20250924152341.png](./attachments/Pasted%20image%2020250924152341.png)

接着找到声明 `HttpClient` 的位置, 并找到 `aesPost` 函数:

![Pasted image 20250924152734.png](./attachments/Pasted%20image%2020250924152734.png)

可以看到该函数对数据进行 `AES-ECB` 加密之后, 再调用 `HttpClient.request` 函数发起请求. 再定位到 `request` 函数的位置:

![Pasted image 20250924153328.png](./attachments/Pasted%20image%2020250924153328.png)

可以看到, 后续请求实际传递的 url 是 `"" + e.baseUrl + n`, 再定位到

`baseUrl` 在 `setBaseUrl` 函数中被设置:

![Pasted image 20250924154122.png](./attachments/Pasted%20image%2020250924154122.png)

`setBaseUrl` 在 `APIUtil.setCDNAPI` 函数中被调用:

![Pasted image 20250924154158.png](./attachments/Pasted%20image%2020250924154158.png)

`setCDNAPI` 函数在 `APIUtil.validUrl` 函数中被调用:

![Pasted image 20250924154302.png](./attachments/Pasted%20image%2020250924154302.png)

并且类的构造函数中对 Url 进行了构造 `"https://"+t[0]+":"+t[1]+"/"+o.default.COMPANYCODE+"/"`:

![Pasted image 20250924162010.png](./attachments/Pasted%20image%2020250924162010.png)

`validUrl` 函数在 `APICDN.getValidDomainFromCDNS` 函数中被调用:

![Pasted image 20250924154516.png](./attachments/Pasted%20image%2020250924154516.png)

!!! note "如何确定应用调用了哪个类来获取 CDN?"
    `validUrl` 一共在 4 个类中被调用, 分别是 `APICDN`, `APIDynamicCDN`, `APIAliyunBucket`, `APINormalDynamicCDN`. 在 `ReverseService` 类的 `sortUseMethod` 函数中可以看到, 应用会获取 `HallConfig.default.APIMETHODS` 字符串并以 `,` 分割, 生成数组.

    ![Pasted image 20250924162755.png](./attachments/Pasted%20image%2020250924162755.png)

    接着试着按照 `APIMETHODS` 中的顺序, 依次调用几个获取 CDN 的类, 并测试是否有可用的 CDN:

    ![Pasted image 20250924162514.png](./attachments/Pasted%20image%2020250924162514.png)

    可以在 `HallConfig.default` 中看到 `APIMETHODS` 为 `c,d,n,a`, 因此应用将先使用 `APICDN` 类检测存活 CDN:

    ![Pasted image 20250924162600.png](./attachments/Pasted%20image%2020250924162600.png)

    参考下述的测试, 可以判断该类会成功获取到存活的 CDN.
    

该函数对 `allCDNs` 数组中的所有成员进行检测(`s.APIUtil.validUrl`), 并返回通过检测的成员. `allCNDs` 数组的构造位于 `APICDN` 的构造函数中, 通过对 `o.default.APICDNS` 字符串按 `,` 进行分割得到. 而 `o` 被声明为 `Hallconfig`:

![Pasted image 20250924155656.png](./attachments/Pasted%20image%2020250924155656.png)

找到 `HallConfig` 的声明, 在其中的 `default` 中找到 `APICDNS` 和 `COMPANYCODE` 字符串:

![Pasted image 20250924160100.png](./attachments/Pasted%20image%2020250924160100.png)

实际登录时访问的 API 会随 CDN 站点的可访问性变化而变化. 本 WP 编写时(2025 年 9 月 24 日)实际测试结果为:

![Pasted image 20250924160420.png](./attachments/Pasted%20image%2020250924160420.png)

![Pasted image 20250924160436.png](./attachments/Pasted%20image%2020250924160436.png)

因此, 应用登陆时将使用第一个可用的 CDN 地址 `168js.bvocftd.com`, API 地址为 `https://168js.bvocftd.com:443/ky188/member/memberManager/login`

### 17 澳门新葡京 APK 其中关于腾讯运营商的服务留存的 QQ 号

!!! info "答案"
    1108221663

在 MainActivity `org.cocos2dx.javascript.AppActivity` 中硬编码了一个常量 `qqAppId`:

![Pasted image 20250924181532.png](./attachments/Pasted%20image%2020250924181532.png)

### 18 请分析 Navicat 中 root 用户的密码

!!! info "答案"
    `(=3]Zwjt#W`

![Pasted image 20250924182834.png](./attachments/Pasted%20image%2020250924182834.png)

## 服务器取证

对 3 个镜像都进行仿真, 将 VMware 的 NAT 虚拟网卡的网段设置为与服务器内静态 IP 一致的 `192.168.2.0/24`.

![Pasted image 20250925111311.png](./attachments/Pasted%20image%2020250925111311.png)

3 个虚拟机的信息如下:

| HostName   | IP            |
| ---------- | ------------- |
| k8s-master | 192.168.2.199 |
| k8s-node1  | 192.168.2.200 |
| k8s-node2  | 192.168.2.201 | 

k8s 服务的修复参考第 4 题. Nginx 冲突的解决参考第 6 题.

### 1 该集群主节点操作系统版本

!!! info "答案"
    7.9.2009

仿真之后查看 `k8s-master` 主机的 `/etc/redhat-release` 文件:

![Pasted image 20250925110056.png](./attachments/Pasted%20image%2020250925110056.png)

其实 3 个镜像中系统版本一样.

### 2 该集群创建时间(GMT)

!!! info "答案"
    2024-06-24 11:28:12

尝试用 `kubectl` 查看集群信息, 但遇到了报错:

![Pasted image 20250925113812.png](./attachments/Pasted%20image%2020250925113812.png)

通过 `kubeadm` 查看证书信息, 发现证书已过期:

![Pasted image 20250925113919.png](./attachments/Pasted%20image%2020250925113919.png)

修证书比较复杂, 可以参考博客文章: [k8s-kubeadm证书过期续订解决方法_kubeadm certs renew all-CSDN博客](https://blog.csdn.net/Harry_z666/article/details/128015175?spm=a2c6h.12873639.article-detail.4.47e41d1eQGQQwU). 这里采取一种更取巧, 更简单的办法: 修改系统时间.

可以在仿真之后手动修改系统时间, 也可以在使用火眼仿真时, 在高级设置中指定系统时间:

![Pasted image 20250925114520.png](./attachments/Pasted%20image%2020250925114520.png)

查看节点信息, 此时 2 个节点依然处于 NotReady 状态:

![Pasted image 20250925114816.png](./attachments/Pasted%20image%2020250925114816.png)

查看节点详情, 其中的"CreationTimestamp"即为集群的创建时间:

![Pasted image 20250925115007.png](./attachments/Pasted%20image%2020250925115007.png)

### 3 该集群共有多少个命名空间

!!! info "答案"
    7

查看命名空间详情, 共有 7 个命名空间:

![Pasted image 20250925115259.png](./attachments/Pasted%20image%2020250925115259.png)

### 4 该集群所有命名空间内总共有多少个 pod

!!! info "答案"
    16

接下来需要修复 2 个 Node 节点才能获取到全部的 pod 信息.

查看 2 个 Node 节点的 kubelet 服务状态, 发现服务无法正常启动:

![Pasted image 20250925115819.png](./attachments/Pasted%20image%2020250925115819.png)

![Pasted image 20250925115917.png](./attachments/Pasted%20image%2020250925115917.png)

看一下 kubelet 的日志, 报错是 kubelet 不能在开启 SWAP 的情况下运行:

![Pasted image 20250925120331.png](./attachments/Pasted%20image%2020250925120331.png)

看一眼 `fstab`, 发现 `/www/swap` 开着:

![Pasted image 20250925120441.png](./attachments/Pasted%20image%2020250925120441.png)

手动注释掉这一行, 再通过 `swapoff -a` 指令关闭 SWAP. 再启动 kebulet 服务:

![Pasted image 20250925120916.png](./attachments/Pasted%20image%2020250925120916.png)

回到 k8s-master 主机查看节点信息, 发现 k8s-node1 已经就绪了:

![Pasted image 20250925120938.png](./attachments/Pasted%20image%2020250925120938.png)

对 k8s-node2 进行相同的操作:

![Pasted image 20250925121109.png](./attachments/Pasted%20image%2020250925121109.png)

查看 pod 的详情:

![Pasted image 20250925122713.png](./attachments/Pasted%20image%2020250925122713.png)
 
### 5 请给出该集群所使用的 cni 网络插件及其版本

!!! info "答案"
    flannel-cni-plugin:v1.0.0

在 pod 信息中查找"cni-plugin":

![Pasted image 20250925125642.png](./attachments/Pasted%20image%2020250925125642.png)

### 6 打金平台的后台登录地址跳转文件

!!! info "答案"
    WIdbdgd1Us.php

在 k8s-node1 的 `/root` 目录中可以看到宝塔面板的 `install.sh`:

![Pasted image 20250925131316.png](./attachments/Pasted%20image%2020250925131316.png)

查看面板信息 & 修改面板密码:

![Pasted image 20250925131458.png](./attachments/Pasted%20image%2020250925131458.png)

![Pasted image 20250925131559.png](./attachments/Pasted%20image%2020250925131559.png)

可以看到 2 个宝塔面板都运行着网站:

![Pasted image 20250925131739.png](./attachments/Pasted%20image%2020250925131739.png)

启动 Nginx 并修改本地的 Hosts 文件, 使用域名访问这几个网站时发现报 404 或 502.

```hosts
192.168.2.201	www.jiaoyoumf0up.com
192.168.2.201	www.jiedai0rmr.com
192.168.2.200	www.gsjksu2kig.com
192.168.2.200	www.mtbtsdafda.com
```

执行 `nginx -t` 发现服务器上还安装了一个 nginx, 与宝塔的 nginx 冲突:

![Pasted image 20250925135228.png](./attachments/Pasted%20image%2020250925135228.png)

宝塔的 nginx 是:

![Pasted image 20250925135255.png](./attachments/Pasted%20image%2020250925135255.png)

删除服务器上多余的 Nginx:

![Pasted image 20250925135353.png](./attachments/Pasted%20image%2020250925135353.png)

在 `/www/server/nginx/sbin` 目录下手动启动 Nginx `./nginx -c conf/nginx.conf` 之后就可以使用域名正常访问网站了:

![Pasted image 20250925142645.png](./attachments/Pasted%20image%2020250925142645.png)

![Pasted image 20250925142652.png](./attachments/Pasted%20image%2020250925142652.png)

![Pasted image 20250925143516.png](./attachments/Pasted%20image%2020250925143516.png)

![Pasted image 20250925143525.png](./attachments/Pasted%20image%2020250925143525.png)

查看每个网站的 Nginx 日志, 找到后台地址.

`www.gsjksu2kig.com` 的后台地址是 `/admin.php/login/index.html`:

![Pasted image 20250925143805.png](./attachments/Pasted%20image%2020250925143805.png)

访问之后从标题可以看出来是个 CMS:

![Pasted image 20250925144508.png](./attachments/Pasted%20image%2020250925144508.png)

`www.mtbtsdafda.com` 的后台地址原本是 `/admin.php`, 后来被修改为访问 `/WIdbdgd1Us.php` 后重定向至 `/index.php/systemlogined/login/index`:

![Pasted image 20250925143956.png](./attachments/Pasted%20image%2020250925143956.png)

可以在网站源码根目录中找到该 php 文件:

![Pasted image 20250925145532.png](./attachments/Pasted%20image%2020250925145532.png)

访问之后看到后台标题为"打金平台后台管理":

![Pasted image 20250925144552.png](./attachments/Pasted%20image%2020250925144552.png)

`www.jiaoyoumf0up.com` 的后台地址是 `/admin/login.php`:

![Pasted image 20250925144146.png](./attachments/Pasted%20image%2020250925144146.png)

网站标题叫"盲盒", 应该是个抽奖网站的后台:

![Pasted image 20250925144700.png](./attachments/Pasted%20image%2020250925144700.png)

`www.jiedai0rmr.com` 的后台地址是 `/admin.php` 之后重定向到 `/index.php?g=Admin&m=Index&a=login`:

![Pasted image 20250925144255.png](./attachments/Pasted%20image%2020250925144255.png)

这个不知道是个啥:

![Pasted image 20250925144636.png](./attachments/Pasted%20image%2020250925144636.png)

### 7 打金平台密码加密算法

!!! info "答案"
    sha1

在网站源码的 `APP/Module/Index/Action/LoginAction.php` 中可以看到处理用户登录的代码, 其中对密码的处理为:

![Pasted image 20250925150140.png](./attachments/Pasted%20image%2020250925150140.png)

### 8 打金平台中"13067137585"用户的累计产量

!!! info "答案"
    43853.21

在网站源码的 `APP/Module/Systemlogined/Action/LoginAction.class.php` 中可以看到处理管理员登录的代码:

![Pasted image 20250925150658.png](./attachments/Pasted%20image%2020250925150658.png)

数据库的用户名 & 密码信息可以在宝塔的数据库配置页面或网站源码根目录的 `App/Conf/config.php` 中找到. Navicat 连接数据库, 找到存放管理员信息的表 `ds_user`:

![Pasted image 20250925151003.png](./attachments/Pasted%20image%2020250925151003.png)

将 admin 的密码修改为 `sha1("123456") = 7c4a8d09ca3762af61e59520943dc26494f8941b`, 之后使用 admin/123456 登录后台:

![Pasted image 20250925151215.png](./attachments/Pasted%20image%2020250925151215.png)

后台的"会员管理"页面中可以搜索到用户, 但没有显示"累计产量":

![Pasted image 20250925151539.png](./attachments/Pasted%20image%2020250925151539.png)

再次修改用户表 `ds_member` 中的密码:

![Pasted image 20250925151728.png](./attachments/Pasted%20image%2020250925151728.png)

登录用户平台, 在"会员中心"页面看到"累计产量"信息:

![Pasted image 20250925151817.png](./attachments/Pasted%20image%2020250925151817.png)

### 9 打金平台会员组最高溢价比例

!!! info "答案"
    1.70

在后台的"会员等级列表"页面中可以看到:

![Pasted image 20250925151955.png](./attachments/Pasted%20image%2020250925151955.png)

### 10 打金平台会员推广人数最多的会员姓名

!!! info "答案"
    李奕欣

后台有树状图, 但是访问时超了 PHP 的内存上限. 按理来说不该超的, 怀疑是代码有问题.

![Pasted image 20250925152116.png](./attachments/Pasted%20image%2020250925152116.png)

直接去数据库看, 用户有一个字段 `parent` 应该是推广人的用户名. 写个 SQL 语句统计一下:

![Pasted image 20250925153104.png](./attachments/Pasted%20image%2020250925153104.png)

找到用户的展示姓名:

![Pasted image 20250925153318.png](./attachments/Pasted%20image%2020250925153318.png)

### 11 打金平台最早一次备份数据库的时间（Asia/Shanghai）

!!! info "答案"
    2019-05-06-22:27:57

在后台的"操作日志"页面, 查看最早的记录, 其中最早的"备份数据库"在"2019-05-06 22:27:57":

![Pasted image 20250925153846.png](./attachments/Pasted%20image%2020250925153846.png)

### 12 金瑞币（JINRUI COIN）平台图片上传平台是哪种类型

!!! info "答案"
    阿里云OSS

上题中后台标题为"JRB CMS"的网站应该是金瑞币平台. 从宝塔的数据库配置里面拿到用户名和密码:

![Pasted image 20250925173637.png](./attachments/Pasted%20image%2020250925173637.png)

连接数据库之后, 看到管理员表:

![Pasted image 20250925173351.png](./attachments/Pasted%20image%2020250925173351.png)

![Pasted image 20250925173709.png](./attachments/Pasted%20image%2020250925173709.png)

密码长度看起来是 MD5, 不知道有没有加盐. 在网站源码的 `application/admin/controller/Login.php` 中看到有关登录的代码:

![Pasted image 20250925174452.png](./attachments/Pasted%20image%2020250925174452.png)

数据库中保存的是 `MD5(password+salt)`, `salt` 从 ThinkPHP 的配置文件中获取. 在 `application/config.php` 中可以找到 `salt` 的设置:

![Pasted image 20250925174730.png](./attachments/Pasted%20image%2020250925174730.png)

本来想把密码改成 123456 的, 结果发现原始密码就是 123456:

![Pasted image 20250925174900.png](./attachments/Pasted%20image%2020250925174900.png)

使用 admin/123456 登录后台:

![Pasted image 20250925174958.png](./attachments/Pasted%20image%2020250925174958.png)

不过后台中并没有关于图床的配置, 或许要在源码或配置文件里找. 在源码中搜索关键字"upload"之后, 在 `application/api/config.php` 中找到了相关设置:

![Pasted image 20250925175321.png](./attachments/Pasted%20image%2020250925175321.png)

### 13 金瑞币平台手机直充接口

!!! info "答案"
    `http://op.juhe.cn/ofpay/mobile/onlineorder`

后台中也没有相关信息, 还是在源码或配置文件中找. 在源码中搜索关键字"recharge"之后, 在 `extend/driver/oilrecharge/JuheOil.php` 中找到了 API 接口 URL:

![Pasted image 20250925175744.png](./attachments/Pasted%20image%2020250925175744.png)

### 14 金瑞币平台后台登录地址

!!! info "答案"
    `http://www.gsjksu2kig.com/admin.php/login/index.html`

参考服务器取证部分第 6 题.

### 15 金瑞币平台中密码加密盐值

!!! info "答案"
    GWwRbMOPJYZCvE5gembG

参考服务器取证部分第 12 题.

### 16 其中金瑞币平台中交易手续费是百分之多少

!!! info "答案"
    36

在后台的"系统配置"->"基础配置"页面中:

![Pasted image 20250925180144.png](./attachments/Pasted%20image%2020250925180144.png)

### 17 其中金瑞币平台中目前有几种充值方式

!!! info "答案"
    3

充值管理中可以看到 3 中方式:

![Pasted image 20250925180601.png](./attachments/Pasted%20image%2020250925180601.png)

### 18 二号集群节点有源代码的网站目录有几个（正在运行的除外）

!!! info "答案"
    3

!!! warning "本题存疑"
    官方答案为 3, 但实际上检材中存放了源码的目录不只 3 个.

在宝塔的数据目录中, `wwwroot` 中有 1 个未在运行的网站源码目录, `backup/file_history/www/wwwroot` 中有 2 个未在运行的网站源码目录:

![Pasted image 20250925181901.png](./attachments/Pasted%20image%2020250925181901.png)

但在 `/opt` 目录下还有几个目录中有网站源码:

![Pasted image 20250925182717.png](./attachments/Pasted%20image%2020250925182717.png)

![Pasted image 20250925182754.png](./attachments/Pasted%20image%2020250925182754.png)

![Pasted image 20250925182804.png](./attachments/Pasted%20image%2020250925182804.png)

### 19 二号集群节点 memcached 端口

!!! info "答案"
    11211

memcached 的服务信息:

![Pasted image 20250925183244.png](./attachments/Pasted%20image%2020250925183244.png)

或者查看网络信息:

![Pasted image 20250925183329.png](./attachments/Pasted%20image%2020250925183329.png)

### 20 盲盒平台中余额最多的用户

!!! info "答案"
    ZrAuyMT1tyo

在网站的源码 `/admin/login.php` 中可以看到, 使用了 ajax 请求向 `ajax.php` 提交登录请求:

![Pasted image 20250925222323.png](./attachments/Pasted%20image%2020250925222323.png)

在 `/admin/ajax.php` 中可以看到登录时验证了 `md5(name+pwd)` 与通过 `config("pwd")` 的值相等:

![Pasted image 20250925222420.png](./attachments/Pasted%20image%2020250925222420.png)

`config` 函数在 `/core/function.php` 中定义, 从数据库的 `pre_config` 表(`pre_` 将被替换成 `config.php` 中设置的表名前缀)中读取数据:

![Pasted image 20250925222901.png](./attachments/Pasted%20image%2020250925222901.png)

数据库的连接信息可在宝塔面板或 `/config.php` 中找到:

![Pasted image 20250925223414.png](./attachments/Pasted%20image%2020250925223414.png)

需要注意, 该数据库位于 k8s-node1 服务器上.

![Pasted image 20250925223725.png](./attachments/Pasted%20image%2020250925223725.png)

修改管理员密码:

![Pasted image 20250925223843.png](./attachments/Pasted%20image%2020250925223843.png)

另外, 还需要在 `/config.php` 中将 `host` 的值修改为 k8s-node1 服务器的 IP 地址, 之后网站才能连接上数据库. 使用 admin/123456 登录后台:

![Pasted image 20250925224956.png](./attachments/Pasted%20image%2020250925224956.png)

在"用户列表"页面中可以看到用户的账号和余额:

![Pasted image 20250925225039.png](./attachments/Pasted%20image%2020250925225039.png)

### 21 盲盒平台可选二级域名有多少

!!! info "答案"
    13

在"系统管理"->"盲盒信息配置"界面可以看到已设置的二级域名有 `9yx.xyz,3rd.xyz,g3h.xyz,524f.fit,ze3g.fit,xa43.fit,scv4g.xyz,cxse.xyz,ddv.xyz,awev.xyz,eafv.fit,zxee3g.fit,zsefg.fit`:

![Pasted image 20250925225128.png](./attachments/Pasted%20image%2020250925225128.png)

### 22 盲盒平台的支付密钥

!!! info "答案"
    LDAWIucAQQGQp7rEE4nSlvzQMKZxTxopqNSwjL8PcAIBbVLJkh

在后台的"系统管理"->"在线支付配置"页面中可以看到:

![Pasted image 20250925225256.png](./attachments/Pasted%20image%2020250925225256.png)

### 23 盲盒平台中拥有分站的用户名

!!! info "答案"
    5432ef

在后台的"分站列表"页面中可以看到:

![Pasted image 20250925225340.png](./attachments/Pasted%20image%2020250925225340.png)

### 24 借贷平台(`www.jiedai0Rmr.com`)中验证码发送接口域名

!!! info "答案"
    `http://api.smsbao.com/`

在源码的 `/App/Lib/Action/Admin/IndexAction.php` 中看到处理管理员登录的代码:

![Pasted image 20250925225832.png](./attachments/Pasted%20image%2020250925225832.png)

在 `/App/Lib/Action/Admin/CommonAction.php` 中看到 `getpass` 函数的定义:

![Pasted image 20250925225929.png](./attachments/Pasted%20image%2020250925225929.png)

其中的 `C("cfg_adminkey")` 位于 `/App/Conf/config.db.php` 中. 数据库的连接信息可以在宝塔面板或 `/App/Conf/config.db.php` 中看到:

![Pasted image 20250925230201.png](./attachments/Pasted%20image%2020250925230201.png)

需要注意, 该数据库位于 k8s-node1 服务器上. 在数据库的 `admin` 表中可以看到管理员信息:

![Pasted image 20250925230325.png](./attachments/Pasted%20image%2020250925230325.png)

修改 `admin` 用户的密码:

![Pasted image 20250925230909.png](./attachments/Pasted%20image%2020250925230909.png)

使用 admin/123456 登录后台:

![Pasted image 20250925230942.png](./attachments/Pasted%20image%2020250925230942.png)

不过短信平台的地址不在后台中, 需要在源码/配置文件中寻找. 在 `/App/Conf/config.site.php` 中可以看到短信平台的一些设置:

![Pasted image 20250925231203.png](./attachments/Pasted%20image%2020250925231203.png)

在源码中搜索 `cfg_sms_user`, 发现发送短信的函数调用了 `Smsapi`:

![Pasted image 20250925231301.png](./attachments/Pasted%20image%2020250925231301.png)

在 `/App/Lib/Class/Smsapi.class.php` 中看到发码平台的 URL:

![Pasted image 20250925231437.png](./attachments/Pasted%20image%2020250925231437.png)

### 25 借贷平台后台登录密码的加密算法中共使用了多少次 hash 函数

!!! info "答案"
    4

见上题.

### 26 接上题, 借贷平台中后台登录的密码额外加密字符串

!!! info "答案"
    `26XBAmVMs+n_`

见上题.

### 27 借贷平台中一共有多少借款订单

!!! info "答案"
    43

在后台的"借款列表"界面可以看到:

![Pasted image 20250925231646.png](./attachments/Pasted%20image%2020250925231646.png)

### 28 借贷平台中"包玉莲"的收款账号

!!! info "答案"
    6227001756030083140

在后台的"借款列表"页面可以找到该用户:

![Pasted image 20250925231747.png](./attachments/Pasted%20image%2020250925231747.png)

点击"查看打款信息"即可看到银行卡信息:

![Pasted image 20250925231919.png](./attachments/Pasted%20image%2020250925231919.png)

### 29 借贷平台中贷款最大限额是多少

!!! info "答案"
    350000

在后台的"系统设置"页面中可以到设置的贷款最大金额:

![Pasted image 20250925232018.png](./attachments/Pasted%20image%2020250925232018.png)

### 30 请综合该集群一共有多少个网站数据库

!!! info "答案"
    7

在宝塔中可以看到数据库的 root 用户密码:

![Pasted image 20250925232211.png](./attachments/Pasted%20image%2020250925232211.png)

使用该密码连接位于 k8s-node1 的数据库, 除 MySQL 的默认数据库外有 7 个数据库:

![Pasted image 20250925232400.png](./attachments/Pasted%20image%2020250925232400.png)