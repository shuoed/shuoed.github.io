# 美亚杯 2020 团体赛题解


容器密码: `FvIDu!WZvamS!gdT3fV9ju#T*LWkLv$G`


## 背景故事

你的电子数据取证调查结果发现一个国际黑客组织牵涉这宗案件. 经深入调查后, 调查队伍相信该黑客组织入侵了一个名为 Zello 的本地网上商店官网, 黑客组织也针对另一家网上商店 Xeno 发动网络攻击, 使其系统产生故障. 调查期间发现三名男子: 张伟华、冯启礼及罗俊杰疑与该案有关. 警方在搜查他们的住宅及公司后扣押了数十台电子设备. 请分析电子数据证据并重建入侵痕迹.

**1.由 Zello 提供的数据**

| 编号 | 详情                  | 档案路径                                                                        |
| ---- | --------------------- | ------------------------------------------------------------------------------- |
| 1    | Zello服务器的镜像文件 | Image/Zello-onlineshop webserver/Zello-onlineshop webserver.e01 |

**2.由 Xeno 提供的数据**

| 编号 | 详情                       | 档案路径                                                    |
| ---- | -------------------------- | ----------------------------------------------------------- |
| 1    | Xeno 提供的web服务访问日志 | Image/xeno access.log_20200929-20201006.zip |

**3.与张伟华(Bob)有关的资料**

| 编号 | 详情                         | 档案路径                                                                                |
| ---- | ---------------------------- | --------------------------------------------------------------------------------------- |
| 1    | 证物照片                     | Photo/Bob                                                               |
| 2    | 一部桌上计算机的镜像文件     | Image/Bob/Bob Desktop                                                   |
| 3    | 一部笔记本计算机的镜像       | Image/Bob/Bob laptop                                                    |
| 4    | 从路由器提取的存取日志及原则 | Image/Bob/Router Log.xlsx                                               |
| 5    | 一部iMac的镜像文件           | Image/Bob/Bob iMac_OS<br><br>Image/Bob/Bob_iMac         |
| 6    | iPhone的镜像文件             | Image/Bob/Bob IPHONE 5/UFED Apple iPhone 5 (A1429) 2020_10_05 (001).zip |
| 7    | 安卓手机的镜像               | Image/Bob/Bob S2/DumpData.bin                                           |
| 8    | 调查报告                     | 調查報告/案件调查报告-被捕人张伟华(Bob).docx                          |

**4.与冯启礼(Cole)有关的资料**

| 编号 | 详情                       | 档案路径                                                        |
| ---- | -------------------------- | --------------------------------------------------------------- |
| 1    | 证物照片                   | Photo/Cole                                      |
| 2    | 一部桌上计算机的镜像文件   | Image/Cole/Cole_Desktop/Cole_Desktop.e01        |
| 3    | Raspberry Pi 4的镜像文件   | Image/Cole/Cole_PI/COLE_PI.e01                  |
| 4    | 网络储存装置的镜像文件     | Image/Cole/Cole NAS/Cole_NAS.e01                |
| 5    | 笔记本计算机的内存镜像文件 | Image/Cole/Ram dump from Cole/coleramdump.mem   |
| 6    | 笔记本计算机的镜像文件     | Image/Cole/Cole Laptop                          |
| 7    | 手机的镜像文件             | Image/Cole/Cole_Nexus 5/blk32_mmcblk0rpmb.bin   |
| 8    | 调查报告                   | 調查報告/案件调查报告-被捕人冯启礼(Cole).docx |

**5.与罗俊杰(Daniel)有关的资料**

| 编号 | 详情                     | 档案路径                                          |
| ---- | ------------------------ | ------------------------------------------------- |
| 1    | 证物照片                 | Photo/Daniel                                      |
| 2    | 一部桌上计算机的镜像文件 | Image/Daniel/Daniel_Desktop/Daniel_Desktop.e01    |
| 3    | Macbook Pro的镜像文件    | Image/Daniel/Daniel_Macbook/Daniel_Macbook.e01    |
| 4    | 手机的镜像文件           | Image/Daniel/Daniel_iPhone/iPhoneBackup.tar       |
| 5    | 调查报告                 | 調查報告/案件调查报告-被捕人罗俊杰(Daniel).docx |


## Zello & Xeno 服务器部分


### Zello 服务器镜像仿真

Zello 服务器使用了 LVM2 硬盘, 导致火眼仿真程序生成的虚拟机文件无法直接启动, 需要手动在配置中将"EFI 引导"更改为"BIOS(Legacy)引导".

镜像文件的 GPT 分区类型也指出该分区为 BIOS 引导分区. 参见[GPT 分区详解](https://blog.csdn.net/humanof/article/details/88644691). 

![image-20201121201412956](./attachments/01-GPT.png)

此外, 还可以将LVM2分区直接挂载在物理机上, 再用火眼对LVM2分区进行仿真操作.  


### 01 Zello 服务器的哈希值(SHA256)是什么

对整个镜像进行 SHA256 计算即可.


### 02 卷组是何时创建的

LVM 在每个物理卷头部都维护了一个 metadata, 其中包含有关于分区的基本信息. 参见[LVM2 - Logical Volume Manager](https://blog.csdn.net/weixin_41843699/article/details/106467864)。

通过对 LVM2 分区进行 Hex 查看即可得到相关信息, 其中包含有分区名称\分区创建时间\物理卷的 PV UUID\物理卷的 VG UUID 等信息. 同样的信息可以在 `/etc/lvm/backup/` 目录下找到.

![image-20201121202624067](./attachments/02-LVM2metadata.png)


### 03 卷组的名称是

除了在02题中所述的metadata中以外，还可以通过使用火眼证据分析软件自动识别出LVM2分区的名称（该软件也可以直接读取LVM2分区中的文件）。

![image-20201121203321975](./attachments/03-hlyyds.png)


### 04 物理卷的 PV UUID 是

### 05 卷组的 VG UUID 是

除了第 02 题所述的 metadata 中以外, 通过火眼仿真后还可以使用 lvm 命令进行查看:

```shell
sudo lvdisplay -a
sudo pvdisplay
sudo vgdisplay
```

![image-20201121204553414](./attachments/04-lvm.png)


### 06 Zello 服务器的 Linux 内核版本是

### 07 Zello 服务器的操作系统版本是

- 通过`uname -a`或`uname -r`查看内核版本.
- 查看`/proc/version`文件.
- 查看`/etc/lsb-release`文件.

![image-20201121205654186](./attachments/06-LinuxCore.png)


### 08 Zello服务器的主机名是

通过 `uname -a` 或 `uname -n` 查看主机名, 或查看 `/etc/hostname` 文件。

![image-20201121210208273](./attachments/08-ZelloCore.png)


### 09 Zello 服务器的计算器 ID 是

> "计算器"其实就是"计算机", 是香港那边的表达方式.
> 

查看 `/etc/machine-id` 文件.


### 10 Zello 服务器中使用的 wordpress 版本是

仿真之后访问网站后台即可在右下角看到版本号. 而火狐浏览器的历史记录中就包含了网站的后台地址, 甚至打开浏览器之后恢复的上一次异常关闭页面中就有后台页面.

![image-20201121211444808](./attachments/10-Lwordpressversion.png)

或者在 `/var/www/html/wordpress/wp-include/version.php` 中查看.

![image-20201121211745288](./attachments/10-wordpressversion.png)


### 11 Zello 服务器与之同步的主机名是

查看 hosts 或 `/etc/ntp.conf` 文件。

关于 `ntp.conf` 文件的作用, 详见[ntp.conf 配置文件详解](https://blog.csdn.net/qq_35663625/article/details/103064495).

![image-20201121212400794](C:\Users\Noah\AppData\Roaming\Typora\typora-user-images\image-20201121212400794.png)


### 12 Zello 服务器的时区是

通过 `date` 命令或查看 `/etc/timezone` 文件.

![image-20201121212853024](./attachments/12-timezone.png)


### 13 有多少个本地用户已登录到 Zello服务器

查看 `/etc/passwd` 文件。

其中每行各个字段含义如下:

![image](./attachments/13-section.jpeg)

普通用户有两个特征: 1) UID 介于 500 ~ 65535 之间; 2) shell 的起始位置为 `/bin` 中的 shell, 例如 `bash`, `zsh`, `fish` 等, 本题中使用的是 `bash`.

![image-20201121214137347](./attachments/13-users.png)


### 14 植入网络目录的网页壳层(Web Shell)的哈希值(MD5)是

将 `/var/www/html/wordpress/` 目录下的全部文件导出, 使用杀毒软件查杀(Windows Defender 在导出时就会报毒).

![image-20201121214538928](./attachments/14-hryyds.png)

或者以 `eval(` 为关键词检索导出文件中的 php 文件, 这里使用的搜索工具为 FileLocator Pro.

![image-20201121214932752](./attachments/14-searcheval.png)


### 15 `\var\www\html\wordpress\net\2020\Login\index.php` 有什么作用

### 16 钓鱼网站伪装成什么网站

查看 `index.php` 可以发现这个页面是伪造的 Netflix 的登录页面, 其中第一行包含了 `crypt.php`, 结合上一题杀毒软件对 `crypt.php` 的报毒, 判断是钓鱼网页.


### 17 下列哪个 IP 对 Zello 服务器进行了蛮力攻击

> 蛮力攻击 = 暴力破解
> 

查看 `/var/log/apache2/` 目录下的 `access.log.x` 文件, 被压缩的旧日志需要解压. 可以在 `access.log.3` 文件中发现 `203.186.94.68` 对服务器进行了 1432 次请求.

![image-20201121221501272](./attachments/17-searchip.png)


### 18 Zello Web 服务器的 URL 是

参见第 10 & 11 题.


### 19 LVM2 容器的第一个扇区是

### 20 Zello 服务器中 LVM2 容器的大小是

在取证大师中查看没有识别出来的 LVM2 分区(显示为"未分配簇")的相关信息.

![image-20201121221958633](./attachments/19-LVM2.png)


### 21 在 Zello 服务器以及 Alice 的装置中可以找到什么共同文件

可以在 Zello 镜像的 `/var/www/html/wordpress/net/2020/login/`目 录下找到 `R3ZZ.txt`.


### 22 2020 年 8 月 29 日在 Xeno 服务器中发现的攻击类型是

查看日志可以发现当天服务器收到了大量的 GET/POST 请求, 并且请求的为某几个特定页面, 攻击方式应为 HTTP GET/POST Flood.


### 23 哪个 IP 地址在日志中条目数量最多

先去除日志中所有损坏的行, 然后写一个简单的 python 脚本对出现的 IP 的次数进行统计即可.

也可以使用搜索工具对每个选项中的 IP 进行搜索. ~~不懂取证警告~~

```python
dic = {}
with open("1.txt", "r", encoding='utf-8') as f:
    for i in f:
        ip = i.split(' ')[0]
        if ip in dic:
            dic[ip] += 1
        else:
            dic[ip] = 1
print(dic)
```


### 24 这个登录次数最多的 IP 地址, 它访问最多的是哪个页面

继续写 python 脚本. 

也可以使用搜索工具进行正则匹配, 对每个选项中的页面进行搜索. ~~不懂取证警告+1~~

```python
times = {
    'A': 0,
    'B': 0,
    'C': 0,
    'D': 0,
    'E': 0,
}
with open("1.txt", "r", encoding='utf-8') as f:
    for i in f:
        if "14.102.184.0" in i:
            if "/listen.icepush.xml HTTP/1.1\" 200" in i:
                times['A'] += 1
            elif "/risk.xhtml HTTP/1.1\" 200" in i:
                times['B'] += 1
            elif "/explorer.xhtml HTTP/1.1\" 200" in i:
                times['C'] += 1
            elif "/login.jsp HTTP/1.1\" 200" in i:
                times['D'] += 1
            elif "/listViewRisjs.xhtml HTTP/1.1\" 200 " in i:
                times['E'] += 1
print(times)
```


### 25 这个登录次数最多的 IP 地址来自哪个国家或地区

使用离线 IP 查询工具进行查询, 得知是香港的 IP

实际上, 这个 IP 地址就是 Daniel 家的 IP 地址...

![image-20201121230407289](./attachments/26-danielyyds.png)


### 26 这个登录次数最多的 IP 地址, 合共有多少次成功登录

python脚本:

```python
time = 0
with open("1.txt", "r", encoding='utf-8') as f:
    for i in f:
        if "14.102.184.0" in i and "login" in i:
            dd = i.split(' ')
            if '200' in dd:
                time += 1
print(time)
```

但因为损坏部分中也可能存在登陆成功的日志, 所以实际登录成功次数会略高一些.


### 27 除 DDoS 之外, 还可能涉及其他攻击吗


### 28 从该网站下载了多少数据？

python脚本:

```python
data = 0
with open("1.txt", "r", encoding='utf-8') as f:
    for i in f:
        if "14.102.184.0" in i:
            dd = i.split(' ')[-2]
            if dd.isdigit():
                data += int(dd)    
print(data)
```


## Bob 部分


![image-20201126180411889](./attachments/image-20201126180411889.png)

![image-20201126180435037](./attachments/image-20201126180435037.png)

![image-20201126180456048](./attachments/image-20201126180456048.png)

![image-20201126180514275](./attachments/image-20201126180514275.png)

![image-20201126180536156](./attachments/image-20201126180536156.png)

![image-20201126180604832](./attachments/image-20201126180604832.png)

![image-20201126180628475](./attachments/image-20201126180628475.png)

![image-20201126180036988](./attachments/image-20201126180036988.png)

![image-20201126180053994](./attachments/image-20201126180053994.png)

![image-20201126180111962](./attachments/image-20201126180111962.png)

![image-20201126180136832](./attachments/image-20201126180136832.png)

![image-20201126180156265](./attachments/image-20201126180156265.png)

![image-20201126180213637](./attachments/image-20201126180213637.png)

![image-20201126180235523](./attachments/image-20201126180235523.png)

![image-20201126180258562](./attachments/image-20201126180258562.png)

![image-20201126180327446](./attachments/image-20201126180327446.png)

![image-20201126180334821](./attachments/image-20201126180334821.png)


## Cole部分


![image-20201126175500759](./attachments/image-20201126175500759.png)

![image-20201126175552675](./attachments/image-20201126175552675.png)

![image-20201126175600690](./attachments/image-20201126175600690.png)

![image-20201126175608005](./attachments/image-20201126175608005.png)

![image-20201126175623733](./attachments/image-20201126175623733.png)

![image-20201126175630018](./attachments/image-20201126175630018.png)

![image-20201126175651870](./attachments/image-20201126175651870.png)

![image-20201126175659374](./attachments/image-20201126175659374.png)

![image-20201126175742964](./attachments/image-20201126175742964.png)

![image-20201126175807548](./attachments/image-20201126175807548.png)

![](./attachments/image-20201126175821261.png)

![image-20201126175856587](./attachments/image-20201126175856587.png)

![image-20201126175922187](./attachments/image-20201126175922187.png)

![](./attachments/image-20201126175934675.png)

![image-20201126175951144](./attachments/image-20201126175951144.png)

![image-20201126180003193](./attachments/image-20201126180003193.png)


## Daniel 部分

### 127 Daniel 的桌上计算机的哈希值(SHA-256)是什么

在取证大师中计算 SHA256 即可.

推荐 konge 师傅写的快速快速哈希计算工具: [EWF-FastHash](https://github.com/zkonge/EWF-FastHash)


### 128 该桌上计算机操作系统储存在哪个分区上

在火眼取证软件或取证大师中查看.

但是存在问题, 两个软件看到的分区编号不同, 火眼中直接跳到了分区3.

![image-20201123084054897](./attachments/128-hy.png)

![image-20201123085936529](./attachments/128-fmt.png)


### 129 在桌上计算器机中找到 Daniel 的电子邮件地址是

在火眼或取证大师中查看, 也可以仿真后打开 Outlook 查看.

![image-20201123084922661](./attachments/129-mailaddr.png)

![image-20201123090044615](./attachments/129-mailaddr2.png)


### 130 该恶意软件感染源是

邮箱中可以看到一个主题为"Paypal Upadate"的邮件的发件地址并非官方邮箱. 邮件内容在引导用户访问一个带有密码的短网址. 使用火眼的跳转到源文件功能即可找到邮件文件.

![image-20201123084957210](./attachments/130-malsource.png)

![image-20201123085002971](./attachments/130-malsource2.png)

当使用取证大师查看邮件时, 经常会出现崩溃的情况~~辣鸡取证大师~~

---

### 131 在 Daniel 的桌面上发现了甚么恶意软件

在 Download 文件夹中找到了名为 `video viewer 3.1.2.4.exe` 的恶意软件(并不在桌面上). 在 Chrome 的历史记录中可以看到在打开邮件后一分钟之内, 访问了 Google Drive, 文件名为 `videoviewer3.1.2.4.zip`.

![image-20201123091342880](./attachments/131-malname3.png)

![image-20201123092116553](./attachments/131-malname4.png)


### 132 该恶意软件的哈希值(SHA-256)是


### 133 该恶意软件的功能是

在 IDA 中加载, 看到程序在 PowerShell 中执行了 Base64 解码的命令. 解码之后可以看到该程序调用了系统内核 DLL.

![image-20201123085248302](./attachments/132-malfunc.png)

![image-20201123085253406](./attachments/132-malfunc2.png)

如果导出文件, 在导出的过程中查毒软件就会拦截, 并指出这是一个木马病毒.

![image-20201123093313500](./attachments/image-20201123093313500.png)

---

### 134 Daniel 的 MacBook 计算机的哈希值(SHA-1)是

---

### 135 Daniel 的 MacBook 计算机中有多少个分区

使用火眼加载查看即可。

---

### 136 Daniel 的 iPhone 的操作系统是什么版本

### 137 Daniel 的 iPhone 的 wifi mac 地址是

### 138 Daniel 的 iPhone 的 IMEI 是

iphone备份有密码, 密码为弱口令 1234. 自动分析后在基本信息中查看. 

![image-20201123095043288](./attachments/138-iphone.png)

如果无法猜解密码, 则需要查看备份文件中的 `info.plist`

![image-20201123095339587](./attachments/138-iphone2.png)

手机的 MAC 地址在火眼中无法自动识别, 需要查看 `\lockdown\device_values.plist` 文件.

![image-20201123095723341](./attachments/138-iphone3.png)


### 139 iPhone 上次连接 WIFI 的 SSID 是什么

猜解备份密码后在火眼中查看网络信息.


### 140 根据调查结果, 以下哪项关于 Daniel 的选项是正确的

结合电子邮件 & 木马等因素, 可以判断出 Daniel 只是个电脑被种马的受害者.
