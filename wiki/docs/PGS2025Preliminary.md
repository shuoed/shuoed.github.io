---
Title: PGS2025_Preliminary_WalkThrough
Author: NoahTie, BlackBird, Hypnotics@猫猫啥也不会
Date: 2025-05-10 11:00:00
tags:
- 电子数据取证
- wp
description: 2025年第三届盘古石杯电子取证竞赛初赛题解
---

# 2025年第三届盘古石杯电子取证竞赛初赛题解

!!! info "Author"
    - BlackBird @ 猫猫啥也不会 (APK 逆向部分) 
    - NoahTie @ 猫猫啥也不会 (其余部分)


---

> 3D 案情容器密码: `9f8L2kP7mQv3RzX1tB5n6yH4CwJp9TqEa2rF1xSbD0LcKjZ`
> 
> 检材容器密码：`01tn0GdE0]BF00pT0T&f00&u0k-q0Up41UhA00N,0\-L0kRr0j-p0T&R1F&=0\Ni1GR]`
> 


## 写在前面

这是我唯一一场打完后彻底怀疑"取证不存在了"的比赛. 整个过程仿佛在云里雾里晃荡了一圈——案情引导几乎为零, 找证据全靠蒙. 我们原本已经全员达成共识, 这 WP 不写也罢, 感觉也没什么价值. 结果后来:

![Image_810866974022813.png](./attachments/Image_810866974022813.png)

~~最有动力写 WP 的一集~~

小作文有点长, 为了避免影响观感, 放在最后面了.


## UE5 解包及解包文件中的 3D 模型读取

之前两次用的 UE 引擎版本都在 `4.2x`, 可以直接用 `Umodel` 解包并查看 `UAsset` 文件. 但这次是 `UE 5.3.2`, 新增并修改了很多资源文件的标识符, `Umodel` 对其支持较差, 无法正常查看资源文件.  

好在 `UnrealPakViewer` 还能用, 因为它只读取并导出原始 `UAsset` 文件和 `Uexp` 文件, 并不进行更进一步的处理, 可以正常解包. 然后在 UE 里面用 `UAssetBrowser` 插件批量导入就可以了. UE 引擎是向下兼容的, 保证自己安装的是最新版的 UE5 就一定可以正常导入. ~~做 Misc 的电脑上有 UE 引擎也是合理的吧.~~

`FModel` 更好用一些, 基本上支持到了最新的 UE 引擎版本, 甚至对一些知名游戏还有专门的优化. 但是对盘古的这个不能正常处理, 不知道是对 map 做了什么处理, 还是别的什么问题, `FModel` 没有自动识别到. 


## 3D 案情中的信息

- 电脑开机密码: `NOtep@d++`
- 手机锁屏密码: `147258`
- 容器及vmx加密规则: `Pgs+4位数字+d3j`


## 贾韦码的 Android 手机

参考检材 `贾韦码\安卓手机\Image.zip`.

> 不是哥们, 真用自己手机出题啊, 数据也不清一下? 这通讯录, 盘古石的人快齐活了... 
> 
> ![Pasted image 20250513142002.png](./attachments/Pasted%20image%2020250513142002.png)
>


### 1 手机的 IMSI 是

!!! note "答案"
    460036641292715


![Pasted image 20250513141613.png](./attachments/Pasted%20image%2020250513141613.png)

!!! note "IMSI & IMEI"
  
    以往的取证比赛中更常见的是问 IMEI, 很少见到 IMSI.
    
    原因在于:
    
    - IMEI 是设备基带中存储的信息, 由设备(通讯模块)生产厂家写入, 与设备绑定.
    - IMSI 是 SIM 卡中保存的信息, 由通信运营商写入, 与 SIM 卡绑定. 
    
    以往的出题人会在出题前清空设备中的数据,并取出 SIM 卡, 因此在检材中无法提取到 SIM 卡相关的信息. 但这次出题人并没有进行这一操作. 



### 2 养鱼诈骗投资 1000, 五天后收益是

!!! note "答案"
    175


![Pasted image 20250513145627.png](./attachments/Pasted%20image%2020250513145627.png)

![Pasted image 20250513145510.png](./attachments/Pasted%20image%2020250513145510.png)


## 钟无声的 iPhone

参考检材 `钟无声\苹果手机\Image.zip`.

部分题目与钟无声的 Mac 电脑有关, 参考检材 `钟无声\mac电脑\mac.E01`.


### 3 手机的 IDFA

!!! note "答案"
    E477D4C7-BD02-4979-BC9D-5C5DE7BD1F17


![Pasted image 20250513150349.png](./attachments/Pasted%20image%2020250513150349.png)

!!! note "IDFA"
    
    Identifier for Advertiser, iOS 14.5 版本后引入的个性化广告标识符. 可由用户重置或关闭.
    

这就属于无效信息. 虽然确实存在这个信息, 但是对取证工作毫无意义. 难不成还能拿着 IDFA 去苹果公司调证?


### 4 Telegram 应用的卸载时间

!!! note "答案"
    2025-04-17 10:51:39


![Pasted image 20250513150824.png](./attachments/Pasted%20image%2020250513150824.png)


### 5 机主的 hotmail 邮箱地址

!!! warning "本题存疑"
    
    可以在检材中找到 2 个不同的 hotmail 邮箱地址:
    
    - ==xtest901234@hotmail.com==
    - ==hostsixer@hotmail.com==
    


其一是来自于 iOS 系统自动保存的表单信息中的邮箱地址, 且保存在了多个不同的应用的自动填入中:

![Pasted image 20250513152133.png](./attachments/Pasted%20image%2020250513152133.png)

另一是来自于 Telegram 聊天记录中发送的邮箱地址:

![Pasted image 20250513153051.png](./attachments/Pasted%20image%2020250513153051.png)


### 6 苹果电脑开机密码

!!! note "答案"
    12345678


在系统截屏(系统为任务切换视图自动生成的截图)中可以看到两个白板应用的截图:

![Pasted image 20250513152522.png](./attachments/Pasted%20image%2020250513152522.png)

其中之一记录了 MacBook 的开机密码:

![Pasted image 20250513152811.png](./attachments/Pasted%20image%2020250513152811.png)


### 7 Telegram 加密通讯中, 加密聊天信息用到的第二个解密载体是

!!! note "答案"
    2.mp4


Telegram 的聊天记录中提及到"邮箱接收蜜语规则".

![Pasted image 20250513154338.png](./attachments/Pasted%20image%2020250513154338.png)

但在查看手机上的邮箱工具(iOS 自带邮箱和网易邮箱大师)后发现并没有邮件信息. 在 MacBook 上发现使用 Safari 浏览器登录了网页端的邮箱.

在手机的备忘录中可以看到与"蜜语规则"相关的记录:

![Pasted image 20250513154555.png](./attachments/Pasted%20image%2020250513154555.png)

在手机上的"概念画板"应用的数据中, 看到一张图片, 内容与"蜜语规则"相关:

![Pasted image 20250513154505.png](./attachments/Pasted%20image%2020250513154505.png)

在 MacBook 的检材中, 存在笔记的数据, 但是火眼没能自动解析出来存在图片附件, 需要手动进行解析.

![Pasted image 20250513182349.png](./attachments/Pasted%20image%2020250513182349.png)

首先找到笔记应用的数据路径 `Macintosh HD - Data/Users/apple/Library/Group Containers/group.com.apple.notes/`, 导出其中的数据库文件:

![Pasted image 20250513155452.png](./attachments/Pasted%20image%2020250513155452.png)

打开数据库, 在表 `ZICNOTEDATA` 中的字段 `ZDATA` 中存储了笔记正文:

![Pasted image 20250513155645.png](./attachments/Pasted%20image%2020250513155645.png)

用 Hex 编辑器保存为文件(gzip 压缩), 用任意工具解压即可看到原始文件:

![Pasted image 20250513155846.png](./attachments/Pasted%20image%2020250513155846.png)

可以看到, 这里引用了一个图片文件. 在笔记的数据目录中可以看到这个图片文件:

![Pasted image 20250513160006.png](./attachments/Pasted%20image%2020250513160006.png)

综合上述信息, 可以分析得知:

```text
蜜语规则：pgs cup@2025
规则邮件中

1.mp3
2.mp4
3.png
```

可以猜测题目中说到的"第二个解密载体"是指 `2.mp4`. 这些文件在 MacBook 的检材中可以找到.


### 8 贾韦码的内部代号

!!! note "答案"
    48

这里开始的题目有两种做法: 一是根据上题中找到的文件, 对 Telegram 中的消息进行解密; 二是找到在 Telegram 的缓存文件中的解密后的消息:

![Pasted image 20250513162611.png](./attachments/Pasted%20image%2020250513162611.png)

~~太谜语人了~~

解密的方式参考之后的"钟无声的 MacOS 计算机"部分.


### 9 特快专递的收货地址

!!! note "答案"
    西红市中山路35号PGS健身房


接上题.


## 二进制分析(APK)

参考检材 `贾韦码\安卓手机\Image.zip`.


### 1 远控工具包名

!!! note "答案"
    com.carriez.flutter_hbb

查看检材, 首先最直接的远控工具是向日葵远程控制, 但是和下面的题目对不上, 查看聊天记录, 根据上下文, 确定为远控软件.

![image-20250514205103428.png](./attachments/image-20250514205103428.png)

![image-20250514205429897.png](./attachments/image-20250514205429897.png)

也在手机的应用安装列表中看到该应用:

![image-20250514205722092.png](./attachments/image-20250514205722092.png)


### 2 远控工具中继服务器 IP

!!! note "答案"
    59.110.10.229

查看 `/data/user/0//{packageName}/` 路径下应用相关数据, 首先查看 `files` 和 `shared_prefs` 两个路径, 看到配置相关内容:

![image-20250514210258296.png](./attachments/image-20250514210258296.png)

查看`/data/user/0/com.carriez.flutter_hbb/app_flutter`路径：

![image-20250514210354439.png](./attachments/image-20250514210354439.png)

存在多个 `toml` 配置文件, 配置中有多个相关的服务器内容, 但是无法对应中继服务器 / ID 服务器, 安装到模拟器上做如下设置:

![image-20250514210639635.png](./attachments/image-20250514210639635.png)

![image-20250514210819363.png](./attachments/image-20250514210819363.png)

确定在 `RustDesk2.toml` 文件 `options` 选项中, `custom-rendezvous-server` 为 ID 服务器, `relay-server` 为中继服务器, `Key` 为中继服务器的 `Key` 值.


### 3 远控工具 ID 服务器端口

!!! note "答案"
    21116

见上题.


### 4 远控工具中继服务器 Key

!!! note "答案"
    WIUqzRq1Ocx4QNnsF26dZQijKdyd2L9OfaT55hDlQCI=

见上题.


### 5 远控工具中收藏的远程 ID

!!! note "答案"
    1807892422

在 `/data/user/0/com.carriez.flutter_hbb/app_flutter` 路径下 `RustDesk_local.toml` 文件中, 看到 `fav` 选项，推测为收藏记录:

![image-20250514213040752.png](./attachments/image-20250514213040752.png)

### 6 远程控制该手机的手机型号

!!! note "答案"
    google-Pixel

在 `/data/user/0/com.carriez.flutter_hbb/app_flutter` 路径下 `1807892422.toml` 文件中, 该文件名也对应收藏的远程 ID, 记录连接设备相关信息: 

![image-20250514213306277.png](./attachments/image-20250514213306277.png)


### 7 监听工具包名

!!! note "答案"
    com.example.liekai

浏览手机安装的软件, 其中除了黄色软件, 仅剩一个陌生应用: 

![image-20250514213819782.png](./attachments/image-20250514213819782.png)

导出该应用, 进行分析(手快截图):

![image-20250514214209984.png](./attachments/image-20250514214209984.png)

确认该程序为监听工具.


### 8 监听工具代码主入口

!!! note "答案"
    com.example.liekai

![image-20250514214534638.png](./attachments/image-20250514214534638.png)


### 9 监听工具的签名算法

!!! note "答案"
    SHA256-RSA

![image-20250514214608567.png](./attachments/image-20250514214608567.png)


### 10 监听工具运行多少秒后会跳转成黑色幕布

!!! note "答案"
    1

查看源码, 知道该程序是 flutter 应用: 

![image-20250515094216913.png](./attachments/image-20250515094216913.png)

使用[blutter: Flutter Mobile Application Reverse Engineering Tool](https://github.com/worawit/blutter)进行逆向分析, `asm/liekai` 路径下为该项目核心的逻辑代码，我们对其进行分析。

![image-20250515094348959.png](./attachments/image-20250515094348959.png)

在 `screen` 路径下存在 `black_overlay.dart` 文件, 推测该文件为黑色幕布相关内容. 在给 IDA 添加符号之后, 也印证该推测: 

![image-20250515094604255.png](./attachments/image-20250515094604255.png)

重点查看 `BlackOverlayState` 类中的信息, 在 `initState` 方法中, 可以看到如下内容: 

![image-20250515101917194.png](./attachments/image-20250515101917194.png)

首先设置一个时间持续对象 `Duration Object`, 然后再调用延迟方法 `Future::Future.delayed`, 设置持续时间. 根绝时间持续对象 `Duration Object`, 在 `objs.txt` 文件中定位 `Obj!Duration@453341` 对象: 

![image-20250515102454399.png](./attachments/image-20250515102454399.png)

因此监听工具运行 1 秒后会跳转成黑色幕布.


### 11 监听工具运行后, 黑色幕布上字符串

!!! note "答案"
    pgs比武专用

根据 flutter 官网中的 Case, 如果想在幕布上显示字符, 需要首先创建一个 `Widget` 对象, 并在 `Widget` 对象中填充 `Text` 对象: 

![image-20250515104228526.png](./attachments/image-20250515104228526.png)

因此直接在 `objs.txt` 文件中搜索 `Text@` 关键词, 便可获得如下内容: 

![image-20250515104332283.png](./attachments/image-20250515104332283.png)

进一步全项目检索 `Obj!Center@44e251` 对象, 引用于 `black_overlay.dart` 文件中, 上下文也符合页面组件的特征, 因此该内容为正确答案.

![image-20250515104508780.png](./attachments/image-20250515104508780.png)


### 12 监听工具检测到多少分贝开始录音

!!! note "答案"
    70

参考第 7 题.

根据文件名称, 监听相关服务应该在 `SoundDetectorService` 中. 查看 `startMonitoring` 方法: 

![image-20250515110537474.png](./attachments/image-20250515110537474.png)

该方法首先检查应用录音权限, 然后调用匿名方法:

![image-20250515110938709.png](./attachments/image-20250515110938709.png)

匿名方法中, 首先设定监听阈值 `d0 = 70` 分贝, 然后获取当前分贝大小存储为 `d1`. 比较 `d0` & `d1`, 如果 `d0 < d1`, 跳转到 `0x362da0`, 否则顺序执行, 调用 `SoundDetectorService::_handleNoise` 处理.


### 13 监听工具录音连续几秒没有检测到声音停止录音

!!! note "答案"
    4

参考第 7 题.

在匿名方法里面, 首先设置除数 `x0 = 1000000`, 然后获取当前没有检测到声音的时间为 `x1`, 用 `x1 / x0`(参考第 10 题), 结果存储在 `x2` 中. 再将 `x2` 与 `4` 进行比较. 因此监听工具录音连续 4 秒没有检测到声音停止录音.

![image-20250515112517702.png](./attachments/image-20250515112517702.png)


### 14 监听工具保存文件存储路径的数据库名称

!!! note "答案"
    recordings.db

在 `/data/user/0/com.example.liekai/databases` 路径下存在 `recording.db`: 

![image-20250515114857582.png](./attachments/image-20250515114857582.png)

在 `database_helper.dart` 文件中 `_initDatabase` 方法中记录着数据库文件名称: 

![image-20250515115150201.png](./attachments/image-20250515115150201.png)

![image-20250515120311254.png](./attachments/image-20250515120311254.png)

跟着调用链一路向上, `[package:liekai/database_helper.dart] DatabaseHelper::_initDatabase` -> `[package:sqflite_common/sqflite.dart] ::getDatabasesPath` -> `[package:sqflite_platform_interface/src/factory_platform.dart] _SqfliteDatabaseFactoryImpl&Object&SqfliteDatabaseFactoryMixin::getDatabasesPath`. 

在 `[package:sqflite_platform_interface/src/factory_platform.dart] _SqfliteDatabaseFactoryImpl&Object&SqfliteDatabaseFactoryMixin::getDatabasesPath` 中, 又通过 `safeInvokeMethod` 调用[getDatabasesPath function](https://pub.dev/documentation/sqflite/latest/sqflite/getDatabasesPath.html): 

![image-20250515124350525.png](./attachments/image-20250515124350525.png)

![image-20250515124533127.png](./attachments/image-20250515124533127.png)

最终拼接路径为 `data/data/<package_name>/databases` + `recordings.db`, 即 `/data/user/0/com.example.liekai/databases/recordings.db`.


### 15 监听工具保存录像文件的文件夹

!!! note "答案"
    `/storage/emulated/0/Android/data/com.example.liekai/files/video`

在 `video_service.dart` 文件中: 

![image-20250515124746741.png](./attachments/image-20250515124746741.png)

跟着调用链到 `[package:liekai/database_helper.dart] DatabaseHelper::insertAudioRecording`: 

![image-20250515124825530.png](./attachments/image-20250515124825530.png)

再到 `[package:path_provider/path_provider.dart] ::getExternalStorageDirectory`, 这里是通过 `invokeMethod` 调用.

[getExternalStorageDirectory()](https://blog.csdn.net/Harrison509/article/details/108880592)是一个弃用的 API, 用于返回 `/storage/emulated/0/Android/data/<PackageName>/files` 路径.


### 16 监听工具数据库中保存音视频文件的路径使用什么加密

!!! note "答案"
    Salsa20

在 `video_service.dart` 文件中 `stopRecording` 方法中, 分别对文件路径和文件进行了加密: 

![image-20250515150617059.png](./attachments/image-20250515150617059.png)

根据 `[package:liekai/encryption_utils.dart] EncryptionUtils::encryptPath`, 这里使用的是 `Salsa20` 加密算法.

![image-20250515150956204.png](./attachments/image-20250515150956204.png)


### 17 录音的文件采用什么加密方式

!!! note "答案"
    AES

查看 `recording_service.dart` 的 `stopRecording` 方法, 可以看到对录音文件加密使用的方法是 `[package:liekai/encryption_utils.dart]`.

![image-20250515151435844.png](./attachments/image-20250515151435844.png)

在 `EncryptionUtils::encryptFile` 中, 调用的是 `AES`: 

![image-20250515151528952.png](./attachments/image-20250515151528952.png)

进一步对其密钥以及 IV 进行分析. 追踪调用链,  `_audioKey` 由 `_audioKeyBytes` 得到: 

![image-20250515153020953.png](./attachments/image-20250515153020953.png)

可以看到大量的赋值操作, 这里基本上没有其他的函数调用, 这里我们在 IDA 里面查看: 

![image-20250515153234977.png](./attachments/image-20250515153234977.png)

Key 一共是 32 次赋值, 但是这里每一次赋值都是一个 int 类型(4 Bytes), 但在之后每个 int 都被转换成 UInt8 类型(2 Bytes). 参考[Aura's Blog](https://jasmineaura.github.io/AuraBlog/cybersecurity/huk3a01a/#question-18)的分析:

![image-20250515161949577.png](./attachments/image-20250515161949577.png)

参考上述思路, `EncryptionUtils` 的 `videoKeyBytes`、`videoIvBytes`、`pathKeyBytes`、`pathIvBytes`、`audioKeyBytes`、`audioIvBytes` 中均有调用`dart_typed_data___Uint8List__TypedList__IntListMixin__TypedIntListMixin::_slowSetRange_276ddc` 方法，根据名字大致猜测该方法实现了 int 数组转为 Uint8 数组的功能。

但是无法从 asm 文件夹中发现该方法的实现, 推测可能是库函数, 但是也未找到相关实现, 尝试各种骚操作, 只能获得这样一个伪代码(也不一定对):

```c++
// 该函数是一个 Dart 语言中 Uint8List 类型的底层实现方法，主要用于处理字节数组(Uint8Array)的慢速范围设置操作。它的核心功能是在特定条件下对字节数组进行数据复制或填充操作。

static void _slowSetRange_276ddc(
    const TypedData& target_list,
    const Object& source_data,
    intptr_t target_start,
    intptr_t target_end,
    intptr_t source_start,
    intptr_t source_length,
    intptr_t flags) {
  const intptr_t target_length = target_end - target_start;
  if (target_list.IsTypedData()) {
    const TypedData& target_data = TypedData::Cast(target_list);
    if (source_data.IsTypedData()) {
      const TypedData& source_data_ = TypedData::Cast(source_data);
      if (target_data.ElementType() == source_data_.ElementType()) {
        if (target_length == 0) {
          return;
        }
        if (!IsType_List_int(source_data)) {
          if (target_length != (target_length << 1) >> 1) {
            ThrowStubError(kInteger32ToInteger64ConversionError);
          }
        } else {
          if (target_length != (target_length << 1) >> 1) {
            ThrowStubError(kInteger32ToInteger64ConversionError);
          }
        }
        const intptr_t array_length = target_length;
        const Array& array = Array::Handle(Array::New(array_length, Heap::kOld));
        intptr_t i = 0;
        while (i < array_length) {
          const intptr_t element =
              source_data_.At(source_start + i);
          if (!array.SetAt(i, element)) {
            ThrowStubError(kRangeError);
          }
          i++;
        }
        i = 0;
        while (i < array_length) {
          const intptr_t element = array.At(i);
          if (!target_data.SetAt(target_start + i, element)) {
            ThrowStubError(kRangeError);
          }
          i++;
        }
      } else {
        intptr_t i = 0;
        while (i < target_length) {
          const intptr_t element = source_data.At(source_start + i);
          if (!target_data.SetAt(target_start + i, element)) {
            ThrowStubError(kRangeError);
          }
          i++;
        }
      }
    } else {
      intptr_t i = 0;
      while (i < target_length) {
        const intptr_t element = source_data.At(source_start + i);
        if (!target_data.SetAt(target_start + i, element)) {
          ThrowStubError(kRangeError);
        }
        i++;
      }
    }
  } else {
    if (!target_list.IsArray()) {
      ThrowStubError(kUnsupported);
    }
    const Array& target_array = Array::Cast(target_list);
    if (source_data.IsTypedData()) {
      const TypedData& source_data_ = TypedData::Cast(source_data);
      if (target_array.IsTypeFixedLength()) {
        if (target_length != 0) {
          if (target_length != (target_length << 1) >> 1) {
            ThrowStubError(kInteger32ToInteger64ConversionError);
          }
        }
        const intptr_t array_length = target_length;
        const Array& array = Array::Handle(Array::New(array_length, Heap::kOld));
        intptr_t i = 0;
        while (i < array_length) {
          const intptr_t element =
              source_data_.At(source_start + i);
          if (!array.SetAt(i, element)) {
            ThrowStubError(kRangeError);
          }
          i++;
        }
        i = 0;
        while (i < array_length) {
          const intptr_t element = array.At(i);
          if (!target_array.SetAt(target_start + i, element)) {
            ThrowStubError(kRangeError);
          }
          i++;
        }
      } else {
        intptr_t i = 0;
        while (i < target_length) {
          const intptr_t element = source_data.At(source_start + i);
          if (!target_array.SetAt(target_start + i, element)) {
            ThrowStubError(kRangeError);
          }
          i++;
        }
      }
    } else {
      if (target_array.IsTypeFixedLength()) {
        if (target_length != 0) {
          if (target_length != (target_length << 1) >> 1) {
            ThrowStubError(kInteger32ToInteger64ConversionError);
          }
        }
        const intptr_t array_length = target_length;
        const Array& array = Array::Handle(Array::New(array_length, Heap::kOld));
        intptr_t i = 0;
        while (i < array_length) {
          const intptr_t element = source_data.At(source_start + i);
          if (!array.SetAt(i, element)) {
            ThrowStubError(kRangeError);
          }
          i++;
        }
        i = 0;
        while (i < array_length) {
          const intptr_t element = array.At(i);
          if (!target_array.SetAt(target_start + i, element)) {
            ThrowStubError(kRangeError);
          }
          i++;
        }
      } else {
        intptr_t i = 0;
        while (i < target_length) {
          const intptr_t element = source_data.At(source_start + i);
          if (!target_array.SetAt(target_start + i, element)) {
            ThrowStubError(kRangeError);
          }
          i++;
        }
      }
    }
  }
}
```

看不懂思密达... 所以这个题及以后的题理论上都是不可做的, 除了猜, 但是这又有什么意义呢? 

!!! note "info" 
    如果这个逆向有逆明白的, 欢迎来讨论! —— BlackBird


### 18 录像文件加密秘钥的最后一位是

### 19 原始文件 MD5 为 `3b4d****55ae` 的创建时间是

## 贾韦码的 Windows 计算机

参考检材 `贾韦码\计算机\pc-disk.E01`.


### 1 计算机系统 Build 版本为

!!! note "答案"
    18362.356

![Pasted image 20250513163324.png](./attachments/Pasted%20image%2020250513163324.png)


### 2 计算机最后一次正常关机的时间(UTC+0)

!!! note "答案"
    2025-04-18 11:20:54

![Pasted image 20250513163355.png](./attachments/Pasted%20image%2020250513163355.png)


### 3 计算机网卡的 MAC 地址

!!! note "答案"
    00-0C-29-0F-69-00

![Pasted image 20250513163443.png](./attachments/Pasted%20image%2020250513163443.png)


### 4 计算机用户"贾韦码"的 SID

!!! note "答案"
    S-1-5-21-3733482367-3411043098-2536183883-1001

![Pasted image 20250513163531.png](./attachments/Pasted%20image%2020250513163531.png)


### 5 计算机默认浏览器

!!! note "答案"
    Google Chrome

![Pasted image 20250513170025.png](./attachments/Pasted%20image%2020250513170025.png)


### 6 计算机默认浏览器版本

!!! note "答案"
    135.0.7049.96

![Pasted image 20250513170054.png](./attachments/Pasted%20image%2020250513170054.png)


### 7 机主通过浏览器搜索国外社交软件

!!! note "答案"
    Telegram

![Pasted image 20250513170201.png](./attachments/Pasted%20image%2020250513170201.png)


### 8 机主的邮箱账号

!!! note "答案"
    `tqmdavidjohnson300@gmail.com`

![Pasted image 20250513170244.png](./attachments/Pasted%20image%2020250513170244.png)


### 9 计算机装过一款反取证软件

!!! note "答案"
    VeraCrypt

![Pasted image 20250513170324.png](./attachments/Pasted%20image%2020250513170324.png)


### 10 计算机通过 Xshell 远程连接的 ip 地址

!!! note "答案"
    192.168.56.129

![Pasted image 20250513170430.png](./attachments/Pasted%20image%2020250513170430.png)


### 11 机主曾买过一个美国的 Telegram 账号, 请给该账号的原两步验证密码

!!! note "答案"
    13770603

在邮箱中: 

![Pasted image 20250513170545.png](./attachments/Pasted%20image%2020250513170545.png)


### 12 给出其电脑内加密容器的解密密码

!!! note "答案"
    Pgs8521d3j

加密容器可以通过火眼的"特征分析"插件来识别到.

![Pasted image 20250513173107.png](./attachments/Pasted%20image%2020250513173107.png)

或者在用户目录中查看所有文件, 过滤文件并按照文件大小降序排序可以看到一个大小正好为 4 GB 的文件:

![Pasted image 20250513171945.png](./attachments/Pasted%20image%2020250513171945.png)

!!! note
    
    顺便还能看到 Windows 虚拟机的虚拟硬盘文件和 UnraidOS 的文件. 以及 X-Ways Forensics/WinHex 生成的缓存文件:
    
    ![Pasted image 20250513172146.png](./attachments/Pasted%20image%2020250513172146.png)
    
    看了一下 7Zip 的缓存, 确定是 WinHex 了, 曾经打开了桌面上的一个叫"3pgscup.rar"的文件和某个磁盘文件并生成了簇缓存和目录结构.
    

接下来导出 VC 容器并根据案情中的提示"Pgs+4位数字+d3j"进行掩码爆破.

首先导出 VC 容器的 Hash(容器的前 512 Bytes):

```shell
dd if=.\dsf2wecasdcqwed12434 of=./vc_hash bs=512 count=1
```

再用 HashCat 爆破, VeraCrypt 的默认加密方式是 `SHA-512 + XTS-512`. 只花不到 30 秒就爆出来了:

```shell
.\hashcat.exe -a 3 -w 1 -m 13721 -d 1 G:\CaseFile\PGS2025\FileOutput\vc_hash Pgs?d?d?d?dd3j
```

![Pasted image 20250513175716.png](./attachments/Pasted%20image%2020250513175716.png)

Passware 也能爆, 但表现实在不咋样.


### 13 给出其电脑内加密容器挂载的盘符

!!! note "答案"
    F

在最近访问的路径中可以看到访问了 F 盘符, 可根据访问的文件存在于 vc 容器中判断是该盘符.

![Pasted image 20250513180517.png](./attachments/Pasted%20image%2020250513180517.png)


### 14 给出其电脑内存放了多少张伪造身份证

!!! note "答案"
    1023

容器里面存储的全是假的, 有效期全部都不正常. 文件名从 1 到 1023.

![Pasted image 20250513180939.png](./attachments/Pasted%20image%2020250513180939.png)


### 15 找出任敏的身份证编号

!!! note "答案"
    430529195112085460

在 `id_cards_info.xlsx` 文件中可以看到任敏的身份证号:

![Pasted image 20250513181032.png](./attachments/Pasted%20image%2020250513181032.png)


### 16 找出其电脑内存放的密钥文件, 计算其 MD5

!!! note "答案"
    1022cc083a4a5a9e2036065e2822c48e

结合之后 UnraidOS 服务器部分的题目, 这里要找的应该是 luks 的解密密钥.

但是并没有找到文件名为 `keyfile` 的文件. 不过在前面提到了, WinHex 打开了一个压缩文件 `pgscup.zip`, 并且读取了磁盘. 在最近访问的文件中看到了比较有意思的情况:

![Pasted image 20250513204855.png](./attachments/Pasted%20image%2020250513204855.png)

感觉像是用 WinRAR 打开了 `pgscup.zip` 之后又创建了一个压缩文件 `3pgscup.rar`. 在这一过程中还用到了 WinHex, 猜测是直接用 WinHex 将压缩包或其中的文件写在了磁盘中的某个位置.

用 X-Ways Forensics 打开镜像, 发现磁盘在最后的几个簇恰巧存在一个大小为 1 MB 的空闲空间, 其中存储了一个 RAR 文件: 

![Pasted image 20250513212710.png](./attachments/Pasted%20image%2020250513212710.png)

能看出来存储的文件名为 `keyfile.keyfile` 且压缩级别为 Store, 文件内容为 Base64: `emZz5Yqg5a+GcG9vbOWvhumSpeaWh+S7tg==`, 解码之后是 `zfs加密pool密钥文件`.

恢复出来的 rar 压缩包大小为 115 Bytes, 与先前提到的 `3pgscup.rar` 大小一致:

![Pasted image 20250513213340.png](./attachments/Pasted%20image%2020250513213340.png)

如果使用 Zip Store 来压缩解压出的 `keyfile.keyfile` 文件, 会发现其大小恰为 200 Bytes. 与先前提及的 `pgscup.zip` 的大小一致:

![Pasted image 20250513213647.png](./attachments/Pasted%20image%2020250513213647.png)

这也印证了之前对 WinRAR 和 WinHex 使用过程的猜测.

对解压后的密钥文件计算 MD5:

![Pasted image 20250513214221.png](./attachments/Pasted%20image%2020250513214221.png)


### 17 找出其电脑内存放的密钥文件, 解密此密钥文件, 给出其内容

!!! note "答案"
    zfs加密pool密钥文件

见上题.

另外, 纠正一点: Base64 是编码, 不是加密.


## 二进制分析(PE)

!!! note
    对于做题来说, 部分题目使用动态分析结合查看源码更快. 
    
    这里稍微多写一些逆向的方法, 毕竟在离线环境下, 既无法使用在线沙箱也无法在 GitHub 寻找源码.

    另外: 我不是逆向手, 所以有些地方可能会出错. 

    这道题有混淆, 可以通过 [de4dot](https://github.com/de4dot/de4dot) 去混淆. 
    
    然而 Noah 在复盘的时候根本不知道有这个工具, 直接对着一堆乱码硬做的. 


参考检材 `贾韦码\计算机\pc-disk.E01`.

惯例启动火绒:

![Pasted image 20250515120516.png](./attachments/Pasted%20image%2020250515120516.png)

找到了原始病毒文件 `pc-disk.E01\分区7\Users\贾韦码\Documents\lupg\lupg.exe`, 还找到了疑似病毒释放的文件 `pc-disk.E01\分区7\Users\贾韦码\AppData\Roaming\SubDir\BwAcr.exe`, 是个间谍木马. 

DIE 查一下, 是个 .NET 程序:

![Pasted image 20250515120823.png](./attachments/Pasted%20image%2020250515120823.png)

dnSpy 加载, 看到入口点. 基类里面不知道是编码问题还是有混淆, 符号表全是乱码:

![Pasted image 20250515121152.png](./attachments/Pasted%20image%2020250515121152.png)

在资源里面看到了远控端的名称 `Quaser.Client`:

![Pasted image 20250515121530.png](./attachments/Pasted%20image%2020250515121530.png)

在 GitHub 可以搜到源码 [quasar/Quasar: Remote Administration Tool for Windows](https://github.com/quasar/Quasar).

在入口点看到: 

![Pasted image 20250515144247.png](./attachments/Pasted%20image%2020250515144247.png)

跟进类, 类加载时处理: 

![Pasted image 20250515144328.png](./attachments/Pasted%20image%2020250515144328.png)

接着跟进其中的自定义方法: 

![Pasted image 20250515144800.png](./attachments/Pasted%20image%2020250515144800.png)

![Pasted image 20250515145030.png](./attachments/Pasted%20image%2020250515145030.png)

新线程用于记录键盘操作并输出到文件 `%APPDATA%\\Logs\\`.

![Pasted image 20250515145448.png](./attachments/Pasted%20image%2020250515145448.png)

跟进之后可以看到与字符串使用相同的加解密方法:

![Pasted image 20250515155408.png](./attachments/Pasted%20image%2020250515155408.png)

PC 检材上有键盘记录文件 `pc-disk.E01/分区7/Users/贾韦码/AppData/Roaming/Logs/2025-04-18`, 解密之后可以看到记录内容:

![Pasted image 20250515155512.png](./attachments/Pasted%20image%2020250515155512.png)

![Pasted image 20250515155734.png](./attachments/Pasted%20image%2020250515155734.png)

运行窗口中记录的键盘输入说明出题人在出题时访问了缓存目录 `%tmp%`.

此处获取控制端信息的代码分析参考第 1 题解析.

![Pasted image 20250515145836.png](./attachments/Pasted%20image%2020250515145836.png)

跟进其中加载模块的方法:

![Pasted image 20250515145930.png](./attachments/Pasted%20image%2020250515145930.png)

第 1 个模块用于连接控制和被控端卸载:

![Pasted image 20250515150048.png](./attachments/Pasted%20image%2020250515150048.png)

第 2 个模块用于文件管理:

![Pasted image 20250515150157.png](./attachments/Pasted%20image%2020250515150157.png)

第 3 个模块用于读取被控端日志.

第 4 个模块用于显示信息弹窗.

第 5 个模块用于获取本地程序保存的密码, 这部分分析参考第 4 题:

![Pasted image 20250515150408.png](./attachments/Pasted%20image%2020250515150408.png)

第 6 个模块用于读取 & 修改注册表:

![Pasted image 20250515150548.png](./attachments/Pasted%20image%2020250515150548.png)

第 7 个模块用于远控, 可以获取屏幕内容和控制键鼠.

第 8 个模块用于终端命令执行, 跟进几次后发现这里会直接获取一个 cmd 终端:

![Pasted image 20250515150859.png](./attachments/Pasted%20image%2020250515150859.png)

第 9 个模块用于反代连接(反弹 Shell).

第 10 个模块用于关机或重启.

第 11 个模块用于增/删/改开机启动项.

第 12 个模块用于获取系统信息, 这部分分析参考第 5 题.

第 13 个模块用于进程管理.

第 14 个模块用于建立/关闭网络连接.

第 15 个模块用于获取 http 网络资源.


### 1 控制端 IP 是

!!! note "答案"
    104.18.45.79

大概查看一下类的导入包, 发现 020001D3 位置的类导入了 Socket 类, 并且有一个方法的参数是 `List<Obj> hosts`:

![Pasted image 20250515122409.png](./attachments/Pasted%20image%2020250515122409.png)

分析一下这个方法在哪里被使用了:

![Pasted image 20250515122441.png](./attachments/Pasted%20image%2020250515122441.png)

跟进, 这段代码用到了好几个字段:

![Pasted image 20250515122620.png](./attachments/Pasted%20image%2020250515122620.png)

跟进, 发现有好几个 Base64 编码的字符串:

![Pasted image 20250515122700.png](./attachments/Pasted%20image%2020250515122700.png)

尝试解码发现有加密. 在字符串所在的类中可以看到一段代码, 对所有字符串都用同一个方法进行了处理:

![Pasted image 20250515123640.png](./attachments/Pasted%20image%2020250515123640.png)

跟进这个方法, 发现其作用是将参数的 Base64 字符串解码, 并用另外一个方法进行处理, 再将方法返回的字节流以 UTF-8 编码编码并返回:

![Pasted image 20250515123832.png](./attachments/Pasted%20image%2020250515123832.png)

处理 Base64 编码内容的方法就在这个方法下面:

![Pasted image 20250515123910.png](./attachments/Pasted%20image%2020250515123910.png)

可以看到方法进行了解密操作. 参数如下:

```c#
aesCryptoServiceProvider.KeySize = 256;
aesCryptoServiceProvider.BlockSize = 128; 
aesCryptoServiceProvider.Mode = CipherMode.CBC; 
aesCryptoServiceProvider.Padding = PaddingMode.PKCS7;
aesCryptoServiceProvider.Key = ...; 
// Token: 0x040005D4 RID: 1492
```

在解密方法上, 可以看到使用 MasterKey 生成 AES 密钥的方法. AES 密钥是通过 `rfc2898DeriveBytes.GetBytes(32)` 生成的:

![Pasted image 20250515124216.png](./attachments/Pasted%20image%2020250515124216.png)

seed 在类的最后:

![Pasted image 20250515132854.png](./attachments/Pasted%20image%2020250515132854.png)

再分析生成密钥的方法, 找到 MasterKey:

![Pasted image 20250515140022.png](./attachments/Pasted%20image%2020250515140022.png)

![Pasted image 20250515140006.png](./attachments/Pasted%20image%2020250515140006.png)

以源程序中的解密方法为基础, 稍作修改, 写一个 C# 的解密程序:

```c#
#pragma warning disable
using System.Security.Cryptography;
using System.Text;

namespace QuaserDecode
{
    class Program
    {
        private static byte[]? RSAKey;
        private static byte[]? HMACKey;
        private static readonly byte[] seeds = new byte[]
        {
            191, 235, 30, 86, 251, 205, 151, 59, 178, 25,
            2, 36, 48, 165, 120, 67, 0, 61, 86, 68,
            210, 30, 98, 185, 212, 241, 128, 231, 230, 195,
            57, 65
        };

        static void GenerateKey(string masterKey)
        {
            using (Rfc2898DeriveBytes pbkdf2 = new Rfc2898DeriveBytes(
                masterKey,
                seeds,
                50000
                ))
            {
                RSAKey = pbkdf2.GetBytes(32);
                HMACKey = pbkdf2.GetBytes(64);
            }
        }

        static string Decrypt(string? encrypted)
        {
            byte[] array6;
            using (MemoryStream memoryStream = new MemoryStream(Convert.FromBase64String(encrypted)))
            {
                using (AesCryptoServiceProvider aes = new AesCryptoServiceProvider())
                {
                    aes.KeySize = 256;
                    aes.BlockSize = 128;
                    aes.Mode = CipherMode.CBC;
                    aes.Padding = PaddingMode.PKCS7;
                    aes.Key = RSAKey;

                    using (HMACSHA256 hmac = new HMACSHA256(HMACKey))
                    {
                        byte[] array = hmac.ComputeHash(memoryStream.ToArray(), 32, memoryStream.ToArray().Length - 32);
                        byte[] array2 = new byte[32];
                        memoryStream.Read(array2, 0, array2.Length);
                    }

                    byte[] array3 = new byte[16];
                    memoryStream.Read(array3, 0, 16);
                    aes.IV = array3;

                    using (CryptoStream cryptoStream = new CryptoStream(memoryStream, aes.CreateDecryptor(), CryptoStreamMode.Read))
                    {
                        byte[] array4 = new byte[memoryStream.Length - 16L + 1L];
                        byte[] array5 = new byte[cryptoStream.Read(array4, 0, array4.Length)];
                        Buffer.BlockCopy(array4, 0, array5, 0, array5.Length);
                        array6 = array5;
                    }
                }
            }
            return Encoding.UTF8.GetString(array6);
        }

        static void Main(string[] args)
        {
            GenerateKey("85C93D66AAD8EE9E1BC3DEC15329110306011A06");

            while (true)
            {
                Console.Write("> ");
                string? input = Console.ReadLine();
                try
                {
                    Console.WriteLine(Decrypt(input));
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error: {ex.Message}");

                }
            }
        }
    }
}
```

对字符串解密之后得到的字符串:

![Pasted image 20250515141041.png](./attachments/Pasted%20image%2020250515141041.png)

![Pasted image 20250515141128.png](./attachments/Pasted%20image%2020250515141128.png)

其中包含 IP 地址, 是之前找到的通过 Socket 连接的方法中使用的字符串.


### 2 软件会复制自身到哪个文件夹下

!!! note "答案"
    SubDir

火绒扫描到了 `%APPDATA%\SubDir\BwAcr.exe` 是病毒的复制. 在上题解密出来的字符串中也可以看到相关信息:

![Pasted image 20250515141449.png](./attachments/Pasted%20image%2020250515141449.png)

分析一下字符串的读取, 发现在方法(`Token: 0x06000296`)中对字符串进行了拼接, 且字符串开头为用户的 `%APPDATA%` 目录:

![Pasted image 20250515141706.png](./attachments/Pasted%20image%2020250515141706.png)

![Pasted image 20250515141924.png](./attachments/Pasted%20image%2020250515141924.png)

拼接的结果分别为 `%APPDATA%\\Logs\\` 和 `%APPDATA%\\SubDir\\BwAcr.exe`.

如果想要更确切地分析, 可以分析拼接后的字符串的读取位置, 找到复制文件的方法. 这里不多赘述了, 最终找到的方法是:

![Pasted image 20250515142844.png](./attachments/Pasted%20image%2020250515142844.png)

以及将可执行文件设置为开机启动项的方法:

![Pasted image 20250515142352.png](./attachments/Pasted%20image%2020250515142352.png)


### 3 接上题, 复制后软件名称是

!!! note "答案"
    BwAcr.exe

见上题.


### 4 软件一共可以窃取多少种浏览器的信息

!!! note "答案"
    8

稍微翻一下基类, 看到含有 IE 浏览器名称的类:

![Pasted image 20250515143107.png](./attachments/Pasted%20image%2020250515143107.png)

分析一下实例化该类的位置, 看到在一个 List 中添加了若干个类的实例:

![Pasted image 20250515143333.png](./attachments/Pasted%20image%2020250515143333.png)

依次查看, 发现每个类都获取 1 种应用的信息:

![Pasted image 20250515143430.png](./attachments/Pasted%20image%2020250515143430.png)

依次是: `Brave`, `Chrome`, `Opera`, `Opera GX`, `Microsoft Edge`, `Yandex`, `Firefox`, `Internet Explorer`, `FileZilla`, `WinSCP`. 其中 `FileZilla` 和 `WinSCP` 并非浏览器, 而是文件传输工具.


### 5 软件查询安装的杀毒软件出错或异常会返回什么字符串

!!! note "答案"
    Unknown

类(`Token: 0x02000068`)用于获取系统信息:

![Pasted image 20250515152348.png](./attachments/Pasted%20image%2020250515152348.png)

在获取的信息中有一项是防病毒软件信息(antivirus):

![Pasted image 20250515152321.png](./attachments/Pasted%20image%2020250515152321.png)

跟进之后看到获取方式是利用 .NET 提供的接口获取 Windows 的管理信息中对防病毒软件的记录. 如果存在, 将所有防病毒软件的名称拼接并返回; 不存在则返回"N/A"; 这个过程中出现异常则返回"Unknown".

![Pasted image 20250515152531.png](./attachments/Pasted%20image%2020250515152531.png)


## 钟无声的 MacOS 计算机

参考检材 `钟无声\mac电脑\mac.E01`.

### 18 登陆的电子邮件服务是谁提供的

!!! note "答案"
    Outlook

这题还是有些模糊的, 不知道到底答案是 Microsoft 还是 OutLook.

![Pasted image 20250513191947.png](./attachments/Pasted%20image%2020250513191947.png)


### 19 系统备忘录的包名

!!! note "答案"
    com.apple.Notes

### 20 图片中隐藏的内容

!!! note "答案"
    位移加密 正向位移操作

虽然 LSB 是图片隐写的基本操作, 但我真的觉得不用工具就能看出来 LSB 的嫌疑人是真的牛逼. 这道题已经完全脱离了取证的逻辑了, 纯纯的 Misc 题.

![Pasted image 20250513192508.png](./attachments/Pasted%20image%2020250513192508.png)

隐写二维码在 R 的最低位. 识别出来内容是"位移加密 正向位移操作".

在 `2.mp4` 中插入了一张图片:

![Pasted image 20250513194123.png](./attachments/Pasted%20image%2020250513194123.png)

```text
偏移计算：将总和与26取模后加1，生成1-26区间的固定位移量
```

虽然到这里为止还有一个 mp3 文件包含的信息没有找到, 但也大概能猜出来解密的方法了. 应该是:

- 先将 `pgs cup@2025` 的每一个字符的 ASCII 码相加模 26 的余数得到位移量
- 再对密文的每个字符在 ASCII 码可见字符范围内循环右移

```python
def decrypt(ciphertext, key):
    ascii_min = 32
    ascii_max = 126
    ascii_range = ascii_max - ascii_min
    total = sum(ord(c) for c in key)
    offset = (total % 26) + 1
    plaintext = ''
    for char in ciphertext:
        if ascii_min <= ord(char) <= ascii_max:
            decrypted_ord = (ord(char) - ascii_min + offset + ascii_range) % ascii_range + ascii_min
            plaintext += chr(decrypted_ord)
        else:
            print(char)
            plaintext += char
    return plaintext

ciphertext = r"5W:bF3AS:0SSPYXbN32zFC=SP3TX53:bNYF\F3BaP3XTN3XzQ?.TF}6XFC{XNZ=a51XaMD>\ED>X53:bNZ>eEC:z54>XOY{\NY2zMC%a8U5"
key = "pgs cup@2025"
print(decrypt(ciphertext, key))
```


### 21 被加密文件的扩展名

!!! note "答案"
    enc

在桌面上可以看到 1 个 MacOS 的软件包和 1 个被加密的文件:

![Pasted image 20250513215426.png](./attachments/Pasted%20image%2020250513215426.png)


### 22 被加密的文件总共有几个

!!! note "答案"
    1


### 23 贾韦码家使用的智能门锁品牌型号

!!! warning "此题存疑"
    
    不同检材中的 2 个文件中出现了不同的型号:
    
    - 金刚I号
    - 金刚III号
    

在钟无声的 iPhone 手机的 `Image.tar/private/var/mobile/Containers/Shared/AppGroup/9BE37656-12EF-4B83-9434-83C19E9A8858/telegram-data/temp/app/temp-713350a88c23151d/5/聊天话术V3.docx` 文件中贾韦码家的门锁型号为"金刚I号":

![Pasted image 20250514184930.png](./attachments/Pasted%20image%2020250514184930.png)

但在 MacOS 中被加密的文件 `贾韦码资料.rar.enc` 解密后的文件中, 又提到另外一个型号"金刚III号":

![Pasted image 20250514213804.png](./attachments/Pasted%20image%2020250514213804.png)


## 二进制分析(MacOS 中的 Python 脚本打包)

参考检材 `钟无声\mac电脑\mac.E01`.


### 分析及文件解密

在软件包里可以看到软件是个打包的 Python 脚本:

![Pasted image 20250513215524.png](./attachments/Pasted%20image%2020250513215524.png)

在 zsh 的历史记录中可以看到打包的过程:

![Pasted image 20250513215707.png](./attachments/Pasted%20image%2020250513215707.png)

`gui_wrapper.py` 是软件的主入口, 其中存在缺失的导入:

![Pasted image 20250514185507.png](./attachments/Pasted%20image%2020250514185507.png)

这个包在 `\文件加密器.app\Contents\Resources\lib\python38.zip` 中, 是个 pyc 文件. 解压之后用工具把字节码还原成 py 源码, `uncompyle6` 和 `decompyle3` 均在还原 `encrypt_fileParse` 函数时出现了错误:

![Pasted image 20250514190307.png](./attachments/Pasted%20image%2020250514190307.png)

`pylingual` 可以正常还原, 加密部分核心代码:

```python
class EncryptionTool:
    def __init__(self):
        self._generate_key()

    def _generate_key(self):
        seed_values = [(19, 7, 83), (5, 31, 69), (13, 11, 86), (41, 3, 76), (2, 57, 55), (23, 5, 96), (17, 13, 58), (29, 7, 94), (11, 19, 102), (7, 17, 42), (43, 3, 48), (37, 11, 51), (3, 43, 52), (59, 7, 53), (47, 5, 54)]
        key_parts = []
        for a, b, base in seed_values:
            val = (a * b % 60 + base) % 256
            if val % 2 == 0:
                val = (val + 13) % 256
            else:
                val = (val + 7) % 256
            key_parts.append(chr(val))
        scrambled = []
        indices = [3, 7, 2, 12, 0, 11, 5, 14, 9, 1, 6, 4, 10, 8, 13]
        for idx in indices:
            scrambled.append(key_parts[idx])
        raw_key = ''.join(scrambled)
        timestamp = int(time.time()) % 1000
        random_val = random.randint(1, 255)
        entropy = chr(timestamp % 256) + chr(random_val)
        temp_key = hashlib.sha256((raw_key + entropy).encode()).digest()
        self._descramble_key(temp_key)


    def _descramble_key(self, temp_key):
        mixed_base = b''.join([bytes([b ^ 42]) for b in temp_key[:10]])
        actual_key = 'SecureKey123456'
        self.enhanced_key = self.enhance_key(actual_key)
  
    def enhance_key(self, key):
        round1 = self._add_salt(key)
        round2 = self._ascii_transform(round1)
        round3 = self._xor_transform(round2)
        round4 = round3[::-1]
        final_key = hashlib.md5(round4.encode()).digest()
        return final_key

    def _add_salt(self, key):
        salt_components = ['salt', '_', 'value']
        return key + ''.join(salt_components)

    def _ascii_transform(self, text):
        result = ''
        for i in range(len(text)):
            ascii_val = ord(text[i])
            if i % 3 == 0:
                result += chr((ascii_val + 7) % 256)
            elif i % 3 == 1:
                result += chr((ascii_val ^ 15) % 256)
            else:
                result += chr(ascii_val * 5 % 256)
        return result

    def _xor_transform(self, text):
        xor_keys = ['XorKey123456789', 'AnotherKey987654']
        result = text
        for xor_key in xor_keys:
            temp = ''
            for i in range(len(result)):
                temp += chr(ord(result[i]) ^ ord(xor_key[i % len(xor_key)]))
            result = temp
        return result

    def pad_data(self, data):
       ...

    def unpad_data(self, data):
       ...

    def encrypt_file(self, input_file, output_file=None):
        if not output_file:
            output_file = input_file + '.enc'
        try:
            cipher = AES.new(self.enhanced_key, AES.MODE_CBC)
            iv = cipher.iv
            with open(input_file, 'rb') as f:
                file_data = f.read()
            padded_data = self.pad_data(file_data)
            encrypted_data = cipher.encrypt(padded_data)
            with open(output_file, 'wb') as f:
                f.write(iv + encrypted_data)
            return (True, output_file)
        except Exception as e:
            return (False, str(e))
```

加密部分代码就是 AES 加密, 不过进行了很长一串对密钥的预处理. `_generate_key` 函数里面生成了一个随机的临时密钥, 但在 `_descramble_key` 函数中, 并没有使用之前生成的随机密钥, 而是直接使用了字符串 `SecureKey123456` 作为密钥, 传递给 `enhance_key`. 接着对密钥进行了几轮的操作, 包括加盐(固定值 `salt_value`) & 置换 & 异或, 所有操作都是固定的, 因此最终会生成一个固定的密钥. IV 存储在加密文件的头部.

可以直接导入类后访问 `enhanced_key` 拿到密钥之后, 去 CyberChef 里解密:

![Pasted image 20250514213216.png](./attachments/Pasted%20image%2020250514213216.png)

![Pasted image 20250514213321.png](./attachments/Pasted%20image%2020250514213321.png)

![Pasted image 20250514213444.png](./attachments/Pasted%20image%2020250514213444.png)

也可以直接在类里加一个解密函数, 只需要对加密函数微调即可:

```python
def decrypt_file(self, input_file, output_file=None):
    if not output_file:
        output_file = input_file[:-4]
    with open(input_file, 'rb') as f:
        iv = f.read(16)
        encrypted_data = f.read()
    cipher = AES.new(self.enhanced_key, AES.MODE_CBC, iv)
    decrypted_data = self.unpad_data(cipher.decrypt(encrypted_data))
    with open(output_file, 'wb') as f:
        f.write(decrypted_data)
```

解密之后的压缩包中有 2 个文件:

![Pasted image 20250514213515.png](./attachments/Pasted%20image%2020250514213515.png)

图片文件是智能冰箱检材中出现的照片之一, word 文档是贾韦码的自传(?):

![Pasted image 20250514213651.png](./attachments/Pasted%20image%2020250514213651.png)


### 1 使用了一个特定的数作为密钥生成的种子, 请问这个数是什么

!!! warning "此题存疑"
    
    不知道出题人在问什么
    

没看懂题目什么意思. 生成密钥的种子是列表 `seed_values`, 在之后处理 seed 生成临时密钥的时候用到了一堆数字, 不知道在问什么. 大模型也这么觉得:

![Pasted image 20250514214707.png](./attachments/Pasted%20image%2020250514214707.png)

非要按照答案格式里面写 4 位数的话, 那就是 1000. 但这多少有点扯了. 


### 2 分析文件头部元素并确定它们的正确顺序

!!! note "答案"
    iv + encrypted_data

![Pasted image 20250514214837.png](./attachments/Pasted%20image%2020250514214837.png)


### 3 密钥派生过程中使用了几个算法步骤. 其中一个函数使用了与其实际功能不符的名称

!!! note "答案"
    `_descramble_key`

见上述分析.


### 4 程序中实现了一个故意减慢加密过程的机制, 延迟值是多少

!!! warning "此题存疑"
    在 Python 代码中没有看到延迟机制. 


### 5 程序中隐藏了一个版本标识符, 请找出版本号

!!! warning "此题存疑"
    v3.8.10
    

那版本标识符可太多了. Python 就有个 `v3.8.10`,


## 贾韦码的 Linux 服务器(Unraid OS)

参考检材 `贾韦码\服务器\server1.001` 及 `贾韦码\服务器\server2.001`. 


### 文件系统解析

在 X-Ways Forensics 中加载第一个镜像 `server1.001` 可以看到这是个系统盘, 其中安装了 UnraidOS. 在分区 3(卷标为"UNRAID")中可以看到系统版本信息:

![Pasted image 20250514095935.png](./attachments/Pasted%20image%2020250514095935.png)

第二个镜像 `server2.001` 是有 LUKS 加密的 ZFS 文件系统, 可以在 UFS 中进行解密. 需要用到"贾韦码的 Windows 计算机"部分的第 16 题"找出其电脑内存放的密钥文件, 计算其 MD5"中找到的 `keyfile.keyfile` 中的 Base64 字符串 `emZz5Yqg5a+GcG9vbOWvhumSpeaWh+S7tg==` 进行解密.

在 UFS 中挂载镜像, 可以看到识别到了 LUKS 加密, 点击解密:

![Pasted image 20250513224902.png](./attachments/Pasted%20image%2020250513224902.png)

选择使用 LUKS 元数据解密:

![Pasted image 20250513224915.png](./attachments/Pasted%20image%2020250513224915.png)

输入 Base64 串作为密码之后解密:

![Pasted image 20250513224951.png](./attachments/Pasted%20image%2020250513224951.png)


### 仿真

这系统是有点奇特的, 有点类似于 Windows CE 系统, 专门为了给便携启动媒介设计的. 在官网[Unraid | Getting Started with Unraid](https://unraid.net/getting-started)中明确提及了, 需要将系统写入可移动 USB 设备中.

VMware Workstation 的图形化界面并没有提供将虚拟硬盘作为 USB 设备挂载的方法, 但可以通过直接修改 VMX 文件来实现, 参考: [Create a Virtual USB Drive in VMware Workstation](https://onlinecomputertips.com/support-categories/software/vmware-workstation-virtual-usb/).

使用火眼仿真软件将服务器的 2 个镜像仿真. 先不要启动虚拟机, 打开虚拟机目录, 用任意文本编辑器打开生成的 VMX 文件.

首先确保 VMX 中有以下 2 行:

```python
ehci.present = "TRUE"
ehci.pciSlotNumber = "35"
```

在火眼生成的 VMX 文件中, 缺少 `ehci.pciSlotNumber`, 查看其他的 `pciSlotNumber`, 为 `ehci.pciSlotNumber` 设置一个不同的插槽编号.

接着在 VMX 中添加以下内容:

```python
ehci:0.present = "TRUE"  
ehci:0.deviceType = "disk"  
ehci:0.fileName = "disk0-000002.vmdk"  
ehci:0.readonly = "FALSE"
```

其中的 `disk0-000002.vmdk` 是火眼生成的系统盘虚拟硬盘.

还要将原本的 IDE 硬盘配置删除:

```python
ide0:0.filename = "disk0-000002.vmdk"
ide0:0.present = "TRUE"
```

接着启动虚拟机, 如果出现无法识别到引导分区的情况的话, 在刚开启虚拟机后按下 `Delete` 键, 手动选择 `EFI USB Device`.

至此已经可以正常启动系统了:

![Pasted image 20250515091148.png](./attachments/Pasted%20image%2020250515091148.png)

以下是手动解密 LUKS 分区的操作. UnRAID 的 WebUI 有自动解密功能, 所以不需要手动执行.

> 查看硬盘信息, `sdb1` 为 LUKS 加密分区:
> 
> ![Pasted image 20250515094138.png](./attachments/Pasted%20image%2020250515094138.png)
> 
> `cryptsetup luksDump` 查看分区的加密信息:
> 
> ![Pasted image 20250515094157.png](./attachments/Pasted%20image%2020250515094157.png)
> 
> 创建新的 `VMDK`, 用来存放 `keyfile` 和其它文件. 挂载新的虚拟硬盘并重启虚拟机之后, 先挂载新的分区:
> 
> ```shell
> mkdir /mnt/disk2
> mount /dev/sdc /mnt/disk2
> ```
> 
> 用 `keyfile` 进行解密:
> 
> ```shell
> cryptsetup luksOpen /dev/sdb1 disk -d /mnt/disk2/keyfile
> ```

使用 `ip addr add <VMware NAT IP Addr> dev br0` 来为服务器添加 IP 地址. 不知道 VMware 虚拟网卡的 IP 地址的情况下, 可以在虚拟机中运行 `dhcpd` 指令, 再查看 `ip addr`, 其中 `eth0` 的 IP 地址会被自动修改.

可以访问 WebUI 了:

![Pasted image 20250515104800.png](./attachments/Pasted%20image%2020250515104800.png)

但 Unraid 保存了先前的硬盘识别符, 导致硬盘无法读取. 需要先去清除硬盘配置:

![Pasted image 20250515105639.png](./attachments/Pasted%20image%2020250515105639.png)

重新配置硬盘:

![Pasted image 20250515105916.png](./attachments/Pasted%20image%2020250515105916.png)

上传密钥文件:

![Pasted image 20250515105928.png](./attachments/Pasted%20image%2020250515105928.png)

接着点击启动, 稍等之后可以看到硬盘上线:

![Pasted image 20250515110111.png](./attachments/Pasted%20image%2020250515110111.png)

在 Docker 选项卡可以看到正在运行的 Docker 容器:

![Pasted image 20250515110206.png](./attachments/Pasted%20image%2020250515110206.png)

在共享选项卡可以看到服务器目前通过 SMB 共享的目录:

![Pasted image 20250515110257.png](./attachments/Pasted%20image%2020250515110257.png)

另外, 服务器的 `sshd` 是正常工作的, 可以直接连接.


### 1 找出服务器系统启动盘的 GUID

!!! note "答案"
    223DCB83-82B0-4C62-864A-DB28D84735B8

在分区 3 的 `/config/go` (sh 脚本)中:

![Pasted image 20250514100658.png](./attachments/Pasted%20image%2020250514100658.png)


### 2 找出服务器网关 IP

!!! note "答案"
    192.168.56.128

在分区 3 的 `/config/network.cfg` 中:

![Pasted image 20250514100218.png](./attachments/Pasted%20image%2020250514100218.png)

结合 PC 中的浏览器记录, 这个路由器刷入了 OpenWRT 系统.


### 3 找出服务器数据盘的文件系统格式

!!! note "答案"
    zfs

在分区 3 的 `/config/disk.cfg` 中可以看到采取的是 luks 加密的 zfs 文件系统:

![Pasted image 20250514100056.png](./attachments/Pasted%20image%2020250514100056.png)

在分区 3 的 `/logs/tower-diagnostics-20250416-0148.zip` 中可以看到系统日志, 其中的 `/system/zfs-info.txt` 也保存了 zfs 的挂载信息:

![Pasted image 20250514102240.png](./attachments/Pasted%20image%2020250514102240.png)


### 4 找出服务器数据盘的解密密钥文件名

!!! note "答案"
    keyfile

见上题.


### 5 找出服务器密码

!!! note "答案"
    P@ssw0rd

在分区 3 的 `/config/shadow` 中找到密码的哈希:

![Pasted image 20250514100858.png](./attachments/Pasted%20image%2020250514100858.png)

没有其它关于密码的信息, 应该是弱口令爆破, 找个弱口令字典.

```shell
.\hashcat.exe -m 1800 -a 0 '$6$xeMY8O4VOHMbbNqA$XEUOl1pPRwgud/rKwDbIeH9f7khOTmuUQwND3P9T35p14j9I0/Et4R9KdvwhW4AD1xKMve6K7Fwrab4MuPCPp.' .\dict\password-attacks\top19576.txt
```

![Pasted image 20250514101809.png](./attachments/Pasted%20image%2020250514101809.png)


### 6 找出服务器版本号

!!! note "答案"
    7.0.1

在分区 3 的 `changes.Txt` 中可以看到系统版本信息:

![Pasted image 20250514095935.png](./attachments/Pasted%20image%2020250514095935.png)

在分区 3 的 `/logs/tower-diagnostics-20250416-0148.zip` 中的 `/system/vars.txt` 也可以看到系统版本:

![Pasted image 20250514103344.png](./attachments/Pasted%20image%2020250514103344.png)


### 7 找出服务器内 Docker 虚拟硬盘位置

!!! note "答案"
    `/mnt/disk1/docker.img`

在分区 3 的 `/config/docker.cfg` 中可以看到 Docker 配置信息:

![Pasted image 20250514102042.png](./attachments/Pasted%20image%2020250514102042.png)


### 8 找出服务器启动盘的启动标识

!!! note "答案"
    U210

在分区 3 的 `/logs/tower-diagnostics-20250416-0148.zip` 中的 `/system/vars.txt` 可以看到有两块盘:

![Pasted image 20250514102812.png](./attachments/Pasted%20image%2020250514102812.png)

![Pasted image 20250514102729.png](./attachments/Pasted%20image%2020250514102729.png)

![Pasted image 20250514102749.png](./attachments/Pasted%20image%2020250514102749.png)

sda (usb 设备)的硬盘大小为 `7864288 Bytes` ≈ `7.5 GB`, 与检材中的系统盘的大小一致. sdb (VMware 虚拟硬盘)则与数据盘的大小一致.

sda 设备的 `id` 值为 `U210`.


### 9 找出服务器内共有多少个容器镜像

!!! note "答案"
    9

本题及之后的题目需要解密 LUKS 或者仿真服务器之后才能做.

在解密后的分区的根目录中看到 `docker.img`:

![Pasted image 20250514104308.png](./attachments/Pasted%20image%2020250514104308.png)

将其作为硬盘镜像挂载, 并找到 BTRFS 的根目录位置:

![Pasted image 20250514104337.png](./attachments/Pasted%20image%2020250514104337.png)

![Pasted image 20250514104408.png](./attachments/Pasted%20image%2020250514104408.png)

在 `/$//image/btrfs/imagedb/content/sha256` 目录下看到 Docker 镜像的信息:

![Pasted image 20250514104522.png](./attachments/Pasted%20image%2020250514104522.png)

共有 9 个镜像.

仿真之后:

![Pasted image 20250515110751.png](./attachments/Pasted%20image%2020250515110751.png)


### 10 找出服务器内网站服务器所用数据库运行的容器名

!!! note "答案"
    www-db-1

在 `/$//containers` 目录下可以看到一共有 5 个容器:

![Pasted image 20250514104711.png](./attachments/Pasted%20image%2020250514104711.png)

依次查看每个目录中的 `config.v2.json` 文件, 发现容器 `182b0d619b1a09ea37e1d20d6c0776be561aaf0a5b187beb96eef11763254905` 是 MySQL 数据库容器:

![Pasted image 20250514105115.png](./attachments/Pasted%20image%2020250514105115.png)

![Pasted image 20250514105259.png](./attachments/Pasted%20image%2020250514105259.png)

并且可以看到容器的名称:

![Pasted image 20250514105342.png](./attachments/Pasted%20image%2020250514105342.png)

这道题的答案也可以从 Unraid 的系统日志中推断出来. 在分区 3 的 `/logs/tower-diagnostics-20250416-0148.zip` 中的 `/logs/syslog.txt` 可以搜索 `rc.docker` 也可以看到 `www-db-1` 的容器名:

![Pasted image 20250514105802.png](./attachments/Pasted%20image%2020250514105802.png)

仿真之后, 在 WebUI 的容器选项卡中可以看到全部的容器, 可以点击"全部启动".

![Pasted image 20250515110926.png](./attachments/Pasted%20image%2020250515110926.png)

![Pasted image 20250515111100.png](./attachments/Pasted%20image%2020250515111100.png)


### 11 找出服务器内虚拟币容器对外暴露的端口号

!!! note "答案"
    22556

在容器 `9f6a38d4d773f3f790b50f87fdb225a871fed6b99d5cbc176fbd49ddbe2de6f9` 目录的 `config.v2.json` 文件中可以看到是狗狗币的容器:

![Pasted image 20250514110125.png](./attachments/Pasted%20image%2020250514110125.png)

在 `hostconfig.json` 看到端口映射:

![Pasted image 20250514110229.png](./attachments/Pasted%20image%2020250514110229.png)


### 12 找出投资理财网站的域名

!!! note "答案"
    `panguite.cup`

在容器 `feec46efa56655d3a5f824bf9119042a4067eaf861f83dcd99993af659672fdc` 目录的 `config.v2.json` 文件中可以看到是 Apache 服务器:

![Pasted image 20250514110431.png](./attachments/Pasted%20image%2020250514110431.png)

并且有一个文件挂载点:

![Pasted image 20250514110636.png](./attachments/Pasted%20image%2020250514110636.png)

ZFS 卷的 `/www` 目录是容器的文件挂载点, 是个 ThinkPHP 框架的网站:

![Pasted image 20250514110727.png](./attachments/Pasted%20image%2020250514110727.png)

在 `/$//volumes/www_mysql_data/_data` 目录下找到 MySQL 容器的数据:

![Pasted image 20250514110948.png](./attachments/Pasted%20image%2020250514110948.png)

导出之后本地起一个 MySQL 服务连上之后进行数据库分析, 密码在 MySQL 容器的配置文件中可以看到. 这里我偷懒, 直接用了火眼的数据库取证工具. 在表 `info` 中可以看到 APP 的域名:

![Pasted image 20250514111604.png](./attachments/Pasted%20image%2020250514111604.png)

在 PC 的浏览器历史记录中也可以看到这个网站域名.

服务器仿真之后, Docker 启动之后, 可以访问 8080 端口:

![Pasted image 20250515111242.png](./attachments/Pasted%20image%2020250515111242.png)


### 13 找出投资理财网站内连接数据库的密码

!!! note "答案"
    www_dkewl_com

在网站目录 `/$/www/Public` 中:

![Pasted image 20250514112217.png](./attachments/Pasted%20image%2020250514112217.png)


### 14 找出投资理财网站后台访问地址

!!! note "答案"
    `http://2025.pgscup.com:8080/www9nwcc/login.html`

在 APP 的日志 `/$/www/App/Runtime/Logs/Index/25_04_17.log` 中可以看到访问后台并登录的记录:

![Pasted image 20250514113137.png](./attachments/Pasted%20image%2020250514113137.png)

访问的 URI 是 `/www9nwcc/login.html`. 在 Apache 的日志 `/$//containers/feec46efa56655d3a5f824bf9119042a4067eaf861f83dcd99993af659672fdc/feec46efa56655d3a5f824bf9119042a4067eaf861f83dcd99993af659672fdc-json.log` 中可以看到登录后台的记录:

![Pasted image 20250514114022.png](./attachments/Pasted%20image%2020250514114022.png)

服务器仿真之后访问该 URI:

![Pasted image 20250515111447.png](./attachments/Pasted%20image%2020250515111447.png)

查看数据库, 密码是个 MD5 哈希:

![Pasted image 20250515112105.png](./attachments/Pasted%20image%2020250515112105.png)

先假设它只是最简单的 `md5(pwd)`, 试着修改一下数据:

![Pasted image 20250515113007.png](./attachments/Pasted%20image%2020250515113007.png)

登录成功:

![Pasted image 20250515112925.png](./attachments/Pasted%20image%2020250515112925.png)

但是这个网站后台的加载速度慢到令人发指. 不如直接去看数据库.


### 15 找出投资理财网站会员等级设置存放在那个数据库表内

!!! note "答案"
    user_member

![Pasted image 20250514114216.png](./attachments/Pasted%20image%2020250514114216.png)


### 16 找出投资理财网站提现成功的金额

!!! note "答案"
    5769477

数据库中提现记录的表是空的.

![Pasted image 20250514114435.png](./attachments/Pasted%20image%2020250514114435.png)

在 `/$/www/mysql_data` 目录下可以看到几个 sql 文件, 其中的 `dkewl.sql` 是数据库的备份文件. 将 sql 文件导入到正在运行的 mysql 数据库中. 这里我还是用了火眼的数据库取证工具:

![Pasted image 20250514114826.png](./attachments/Pasted%20image%2020250514114826.png)

里面虽然有银行卡信息, 但是没有提现记录. 看了一下另外几个 sql 文件, 除了 `generate_10k_records.sql` 之外应该都是出题的时候留下的. `generate_10k_records.sql` 里面保存的是提现记录, 再次导入.

可以看到字段的备注:

![Pasted image 20250514115536.png](./attachments/Pasted%20image%2020250514115536.png)

计算一下状态为"已提现"的金额总和:

![Pasted image 20250514115854.png](./attachments/Pasted%20image%2020250514115854.png)


### 17 找出投资理财网站内用户王欣的银行卡号

!!! note "答案"
    2114313505182218

![Pasted image 20250514120121.png](./attachments/Pasted%20image%2020250514120121.png)


### 18 找出投资理财网站用户的最低提现金额

!!! note "答案"
    100

在表 `info` 中:

![Pasted image 20250514120456.png](./attachments/Pasted%20image%2020250514120456.png)


### 19 给出存放投资理财用户表内 clock 为 0 表示用户处于那种状态

!!! note "答案"
    未锁定

在表 `user` 中:

![Pasted image 20250514120551.png](./attachments/Pasted%20image%2020250514120551.png)


### 20 找出投资理财网站内通过支付宝支付充值状态为未支付的金额

!!! note "答案"
    11642201

字段 `status` 值为 `0` 的订单为未充值:

![Pasted image 20250514120914.png](./attachments/Pasted%20image%2020250514120914.png)

查询:

![Pasted image 20250514121039.png](./attachments/Pasted%20image%2020250514121039.png)


## 贾韦码的 Windows 服务器(虚拟机)

参考检材 `贾韦码\计算机\pc-disk.E01`.

贾韦码的 Windows 计算机检材中有一个 Windows 虚拟机.

![Pasted image 20250513170750.png](./attachments/Pasted%20image%2020250513170750.png)

可以导出虚拟机文件之后, 通过 vmx2john 和 hashcat 爆破虚拟机密码. 但这有点太慢了, 火眼现在已经支持将 vmx 文件作为检材导入了, 可以直接将 vmx 文件作为检材导入火眼, 接着进行仿真, 从而绕过 vmx 的加密.

帐本系统位于 `Windows 10 x64.vmdk/新加卷/crm` (`D:\crm`) 目录下.


### 21 账本系统使用的 web 框架是什么

!!! note "答案"
    vue

在前端文件目录中的 `node_modules` 中看到 `vue` 的文件:

![Pasted image 20250514121648.png](./attachments/Pasted%20image%2020250514121648.png)

且前端文件目录中有 `vue` 的配置文件:

![Pasted image 20250514121808.png](./attachments/Pasted%20image%2020250514121808.png)


### 22 账本系统使用的数据库版本是多少

!!! note "答案"
    5.0.3

在后端的 `server.js` 中看到使用的是 MongoDB:

![Pasted image 20250514121953.png](./attachments/Pasted%20image%2020250514121953.png)

MongoDB 的配置信息在环境变量中, 环境变量自动加载自 `.env` 文件:

![Pasted image 20250514122057.png](./attachments/Pasted%20image%2020250514122057.png)

MongoDB 的安装目录在 `Windows 10 x64.vmdk/分区6/Program Files/MongoDB/Server/5.0`. 查看 `/bin/mongo.exe` 的文件信息:

![Pasted image 20250514122836.png](./attachments/Pasted%20image%2020250514122836.png)


### 23 账本系统使用的数据库名称是

!!! note "答案"
    crm

在上题的 `.env` 文件中的 `MONGODB_URI` 中, URL 的最后一部分就是使用的数据库名称.

可以仿真之后用数据库管理工具链接, 或者直接用火眼的数据库取证工具分析数据库文件.


### 24 用户手机号码在数据库中的加密方法是

!!! note "答案"
    aes-128-cbc

在数据库的 `customers` 表中可以看到地址 & 身份证号 & 电话号码都被加密, 在数据库中存储为 Base64 字符串:

![Pasted image 20250514123241.png](./attachments/Pasted%20image%2020250514123241.png)

在后端的 `models` 目录中的 `Customers.js` 中存储着用户的数据模型. 使用了 `utils/crypto.js` 中提供的加密函数, 并且在几个属性设置时对属性值自动调用:

![Pasted image 20250514123504.png](./attachments/Pasted%20image%2020250514123504.png)

打开 `crypto.js` 后发现对方法调用进行了混淆, 使用[JavaScript Deobfuscator](https://deobfuscate.io/)去一下混淆, 手动还原一下变量名称, 再去掉两处控制流混淆:

```js
const ALGORITHM = "aes-128-cbc";
const DEFAULT_IV = Buffer.alloc(16, 0);
const cipher = () => {
    try {
        const AESKey = keyManager.getAesKey();
        return { k: AESKey, a: "aes-128-cbc", i: Buffer.alloc(16, 0) };
    } catch (error) {
        console.error("获取加密密钥失败:", error.message);
        return { k: crypto.randomBytes(16), a: ALGORITHM, i: DEFAULT_IV };
    }
};

const encrypt = (() => 
    let AESCipher;
    return text => {
        if (!text) return "";
        try {
            if (!AESCipher) AESCipher = cipher();
            const AES = crypto.createCipheriv(AESCipher.a, AESCipher.k, AESCipher.i);
            let text_enc;
            if (text.length > 0) {
                text_enc = Buffer.concat([AES.update(text.toString(), "utf8"), AES.final()]);
            } else {
                return "";
            }
            return text_enc.toString("base64");
        } catch (_0x5e3d) {
            console.error("加密处理异常");
            return "";
        }
    };
})();
```


### 25 分析 `crypto.js` 中的 `_0x3ad7` 函数, 找出返回加密数据的编码格式

!!! note "答案"
    utf-8

见上题.


### 26 分析 `crypto.js` 中的 `_0x3ad7` 函数, 找出使用异常作为控制流的触发语句

!!! note "答案"
    continue

代码中有一处用于控制流混淆的 `try{}catch{}` 语句, 实际执行的是 `catch` 中的代码.

```js
try {
        throw new Error("continue");
      } catch (_0x1c93) {
        if (_0x1c93.message !== "continue") return "";
// [snip]
}
```

### 27 分析 `keyManager.js` 中 `initializeKeys` 函数的密钥获取优先级是什么

!!! note "答案"
    AES_SECRET_KEY = JWT_SECRET > MASTER_PASSWORD

在 `initializeKeys` 可以看到以下代码:

```js
if (process.env.AES_SECRET_KEY && process.env.JWT_SECRET) {
    return {
      aesKey: Buffer.from(process.env.AES_SECRET_KEY, 'utf8'),
      jwtKey: process.env.JWT_SECRET
    };
  }

  const masterPassword = process.env.MASTER_PASSWORD;
  if (!masterPassword) {
    console.error('警告: 未提供主密码或加密密钥。使用随机生成的一次性密钥（不适用于生产环境）');
    return {
      aesKey: crypto.randomBytes(KEY_DERIVATION_KEY_LENGTH),
      jwtKey: crypto.randomBytes(JWT_KEY_LENGTH).toString('hex')
    };
  }
const salt = getMachineSalt();
  if (fs.existsSync(KEY_STORAGE_FILE)) {
    try {
      const fileKey = deriveKey(masterPassword, salt, 32);
      const encryptedKeys = JSON.parse(fs.readFileSync(KEY_STORAGE_FILE, 'utf8'));
      const decryptedData = decryptWithKey(encryptedKeys, fileKey);
      const keys = JSON.parse(decryptedData);
      return {
        aesKey: Buffer.from(keys.aesKey, 'hex'),
        jwtKey: keys.jwtKey
      };
    } catch (err) {
      console.error('从文件加载密钥出错:', err.message);
    }
// snip
}
```

- 先获取环境变量中的 `AES_SECRET_KEY` 和 `JWT_SECRET`
    - 如果有, 返回这两个密钥
    - 否则, 在环境变量中查找 `MASTER_PASSWORD`
        - 如果有, 通过 `MASTER_PASSWORD` 生成 AES 和 JWT 密钥
        - 否则随机生成临时的 AES 和 JWT 密钥


### 28 账本记录的用户总数是多少

!!! note "答案"
    2000 

在数据库取证工具中导出 `crm` 数据库的 `customers` 表为 JSON 文件. 在 Python 中读取, 并进行统计:

![Pasted image 20250514130700.png](./attachments/Pasted%20image%2020250514130700.png)


### 29 身份证号"430014197812200986"用户的投资金额是多少

!!! warning "此题存疑"
    

尝试对数据库中的加密数据进行解密(AES-128-CBC, Key=QxK8s4PjZ9LmRvT6BnE3F5, IV=b"\x00"\*16), 发现无法正常解密.

离谱的是, 在 Customer 的 Model 里面, 在获取用户信息的时候, 直接返回了随机数据, 导致重组的服务器中的数据全为随机数据:

![Pasted image 20250514143111.png](./attachments/Pasted%20image%2020250514143111.png)

我不懂这道题想让我干什么. 这个后端根本就是依托.


### 30 姓名为明凤英的客户共有几人

!!! note "答案"
    2

![Pasted image 20250514143258.png](./attachments/Pasted%20image%2020250514143258.png)


## 数据分析

参考检材 `贾韦码\计算机\pc-disk.E01`.

这部分的检材文件在贾韦码的 Windows 计算机里面, 叫做"三张表"的文件夹中有 3 个 csv 文件.

对于 csv 文件, 如果熟悉 Excel 的公式的话, 可以比较快地用 `VLOOKUP` & `XLOOKUP` 等公式完成. 但我不是很熟悉, 所以选择将这些 csv 文件导入到数据库里, 用 SQL 语句进行查询.

这部分一小半的题目描述不清, 导致根本无法确定唯一的答案. 不知道出题人是怎么想的.


### 1 该诈骗集团的最高层领导者的 ID 和姓名

!!! note "答案"
    M020038 杨俊

在 `hierarchy.csv` 中看到 level = 0 的是层级最高的:

![Pasted image 20250514144656.png](./attachments/Pasted%20image%2020250514144656.png)

在 `members.csv` 中查找 id = M020038 的用户:

![Pasted image 20250514145432.png](./attachments/Pasted%20image%2020250514145432.png)


### 2 找出最高领导的所有下线中提现总额最高的成员 ID

!!! note "答案"
    M019024

将 csv 导入到数据库之后查询:

```sql
SELECT payer_id, SUM(amount) as sum
FROM transactions
WHERE type = 'withdrawal'
GROUP BY payer_id
ORDER BY sum DESC;
```

![Pasted image 20250514150415.png](./attachments/Pasted%20image%2020250514150415.png)

### 3 找出从直接下线获得平均佣金最高的成员 ID 及其平均佣金金额

!!! note "答案"
    M029080 999.87

比较复杂, 写个 Python 脚本来处理:

```python
# %%
import csv
from collections import defaultdict

def read_csv_to_dict_list(file_path):
    with open(file_path, mode='r', encoding='utf-8-sig') as f:
        return list(csv.DictReader(f))

# %%
hierarchy = read_csv_to_dict_list('hierarchy.csv')
transactions = read_csv_to_dict_list('transactions.csv')

upline_dict = {row['member_id']: row['upline_id'] for row in hierarchy if row['upline_id']}

commission_transactions = [
    tx for tx in transactions if tx['type'] == 'commission'
]

# %%
upline_commissions = defaultdict(list)

for tx in commission_transactions:
    payer = tx['payer_id']
    payee = tx['payee_id']
    amount = float(tx['amount'])

    if payee in upline_dict and upline_dict[payee] == payer:
        upline_commissions[payee].append(amount)

# %%
upline_avg_commission = {
    member_id: sum(values) / len(values)
    for member_id, values in upline_commissions.items()
}
```

这是一个 IPython NoteBook (ipynb)格式的文件, 建议使用 VS Code 搭配 ipynb 插件和 Data Wrangler 插件使用.

![Pasted image 20250514154656.png](./attachments/Pasted%20image%2020250514154656.png)


### 4 找出注册时间最早的前 10% 成员中，交易次数最少的 5 位成员的 id

!!! warning "此题存疑"
    M003135,M004208,M018368,M016076,M016119
    

这道题是有问题的. 在符合题目条件(注册时间最早的前 10% 成员)的成员中, 按照交易次数降序排列, 可以看到 4 人交易次数为 0, 19 人交易次数为 1:

![Pasted image 20250514155315.png](./attachments/Pasted%20image%2020250514155315.png)

只有按照注册时间顺序排列, 才能找出具体的 5 个成员.

代码如下:

```python
# %%
import math
from datetime import datetime

members = read_csv_to_dict_list('members.csv')

# %%
for member in members:
    member['registration_date'] = datetime.strptime(member['registration_date'], "%Y-%m-%d %H:%M:%S")
members_sorted = sorted(members, key=lambda m: m['registration_date'])

# %%
top_10_percent_count = max(1, math.ceil(len(members_sorted) * 0.10))
top_10_percent_members = members_sorted[:top_10_percent_count]
top_member_ids = set(m['member_id'] for m in top_10_percent_members)

# %%
transaction_count = defaultdict(int)
for tx in transactions:
    transaction_count[tx['payer_id']] += 1
    transaction_count[tx['payee_id']] += 1

# %%
member_tx_counts = [(member_id, transaction_count.get(member_id, 0)) for member_id in top_member_ids]
```


### 5 找出交易次数增长率最高的成员 ID 及其增长率

!!! warning "此题存疑"
    

这道题没办法做, 因为题目中没有明确说明增长率的度量尺度. 是月平均增长率? 是季度平均增长率? 还是年平均增长率? 除非有一个人的增长率足够高, 高到无论如何统计都是最高的, 否则这道题根据对增长率的定义不同, 答案也完全不同.

按照半期增长率计算(前半期和后半期对比):

![Pasted image 20250514160236.png](./attachments/Pasted%20image%2020250514160236.png)

按照月平均增长率计算(忽略前导的交易次数为 0 的月份):

![Pasted image 20250514160521.png](./attachments/Pasted%20image%2020250514160521.png)

可见两种计算方式答案截然不同.

代码如下:

```python

# %%
for tx in transactions:
    tx['timestamp'] = datetime.strptime(tx['timestamp'], "%Y-%m-%d %H:%M:%S")

# %% [markdown]
# ## 统计半期增长率

# %%
sorted_transactions = sorted(transactions, key=lambda x: x['timestamp'])
mid_index = len(sorted_transactions) // 2
mid_time = sorted_transactions[mid_index]['timestamp']

early_counts = defaultdict(int)
late_counts = defaultdict(int)

for tx in transactions:
    payer = tx['payer_id']
    payee = tx['payee_id']
    if tx['timestamp'] <= mid_time:
        early_counts[payer] += 1
        early_counts[payee] += 1
    else:
        late_counts[payer] += 1
        late_counts[payee] += 1

# %%
growth_rates = {}
for member_id in set(early_counts.keys()).union(late_counts.keys()):
    early = early_counts.get(member_id, 0)
    late = late_counts.get(member_id, 0)
    if early > 0:
        growth = (late - early) / early
        growth_rates[member_id] = growth


# %% [markdown]
# ## 统计月平均增长率

# %%
member_month_count = defaultdict(lambda: defaultdict(int))  # {member_id: {YYYY-MM: count}}

for tx in transactions:
    month_str = tx['timestamp'].strftime("%Y-%m")
    for member_id in [tx['payer_id'], tx['payee_id']]:
        member_month_count[member_id][month_str] += 1

# %%

member_growth = {}

for member_id, month_counts in member_month_count.items():
    sorted_months = sorted(month_counts.keys())
    if len(sorted_months) < 2:
        continue

    first_month = sorted_months[0]
    last_month = sorted_months[-1]
    first_count = month_counts[first_month]
    last_count = month_counts[last_month]
    month_span = len(sorted_months) - 1

    if first_count == 0 or month_span == 0:
        continue

    growth_rate = (last_count - first_count) / (first_count * month_span)
    member_growth[member_id] = growth_rate
```


### 6 统计状态为 active, 90 天无交易, 历史交易额前 20% 的成员数

!!! warning "此题存疑"
    4718
    

这个 90 天也非常模糊. 到底是到什么时候为止的 90 天? 是到比赛当天为止的 90 天, 还是到平台最后一笔交易发生为止的 90 天?

我按照截止到比赛当天为止的 90 天统计的结果:

![Pasted image 20250514161436.png](./attachments/Pasted%20image%2020250514161436.png)

```python
# %%
now = datetime.strptime("2025-05-10", "%Y-%m-%d")

active_members = {m['member_id'] for m in members if m['status'] == 'active'}

member_total_amount = defaultdict(float)
member_last_transaction = defaultdict(lambda: datetime.min)

for tx in transactions:
    payer_id = tx['payer_id']
    amount = float(tx['amount'])
    timestamp = tx['timestamp']
    member_total_amount[payer_id] += amount
    if timestamp > member_last_transaction[payer_id]:
        member_last_transaction[payer_id] = timestamp

all_amounts = sorted(member_total_amount.values(), reverse=True)

top_20_percent_index = int(len(all_amounts) * 0.2)
amount_threshold = all_amounts[top_20_percent_index - 1]

qualified_members = []

for member_id in active_members:
    total_amount = member_total_amount.get(member_id, 0)
    last_tx_time = member_last_transaction.get(member_id, datetime.min)
    days_since_last_tx = (now - last_tx_time).days

    if total_amount >= amount_threshold and days_since_last_tx > 90:
        qualified_members.append(member_id)
```


### 7 找出有上线且直接下线最多的成员 ID 及下线数

!!! note "答案"
    M009748 18

![Pasted image 20250514161935.png](./attachments/Pasted%20image%2020250514161935.png)

```python
# %%
members_with_upline = {row['member_id'] for row in hierarchy if row['upline_id']}

upline_downline_count = defaultdict(int)
for row in hierarchy:
    upline = row['upline_id']
    if upline:
        upline_downline_count[upline] += 1

filtered_downlines = {
    upline: count for upline, count in upline_downline_count.items() if upline in members_with_upline
}
```


### 8 比较最早年份 Q1 与 Q4 注册成员的总交易额, 指出哪个更高及具体金额

!!! warning "此题存疑"
    Q1 9054361.47
    

再次看不懂题目, 这个句子结构到底是怎么划分的? 问的到底是 "最早年份的(Q1 or Q4)注册的会员在所有年份的交易" 还是 "最早年份的(Q1 or Q4)注册的会员在最早年份的交易"?

我按照所有年份的交易统计的:

![Pasted image 20250514162235.png](./attachments/Pasted%20image%2020250514162235.png)

```python
# %%
years = [m['registration_date'].year for m in members]
earliest_year = min(years)

q1_members = set()
q4_members = set()
for m in members:
    if m['registration_date'].year == earliest_year:
        month = m['registration_date'].month
        if month in (1, 2, 3):
            q1_members.add(m['member_id'])
        elif month in (10, 11, 12):
            q4_members.add(m['member_id'])

q1_total = sum(float(tx['amount']) for tx in transactions if tx['payer_id'] in q1_members)
q4_total = sum(float(tx['amount']) for tx in transactions if tx['payer_id'] in q4_members)
```


### 9 找出成员地址中最常出现的省份, 并计算居住在该省份的所有成员的总提现金额

!!! note "答案"
    江苏 2301065.13

![Pasted image 20250514163434.png](./attachments/Pasted%20image%2020250514163434.png)

![Pasted image 20250514163358.png](./attachments/Pasted%20image%2020250514163358.png)

```python
from collections import Counter

province_counter = Counter()
member_province = {}  # member_id -> province

for member in members:
    address = member['address']
    if '省' in address:
        province = address.split('省')[0] + '省'
    elif '市' in address:
        province = address.split('市')[0] + '市'
    else:
        continue
    province_counter[province] += 1
    member_province[member['member_id']] = province

most_common_province, _ = province_counter.most_common(1)[0]
target_members = {mid for mid, prov in member_province.items() if prov == most_common_province}
total_withdrawal = sum(
    float(tx['amount']) for tx in transactions
    if tx['type'] == 'withdrawal' and tx['payer_id'] in target_members
)
```


### 10 计算最高层领导者的净资金流

!!! note "答案"
    17443.99

净资金流指资金流入减去资金流出.

```sql
SELECT SUM(amount) FROM transactions WHERE `payer_id` = "M020038"
UNION SELECT SUM(amount) FROM transactions WHERE `payee_id` = "M020038";
```

![Pasted image 20250514164333.png](./attachments/Pasted%20image%2020250514164333.png)

末尾的超长小数部分应该是浮点数误差, 直接忽略掉, `20264.85 - 2820.86 = 17443.99`.


## 物联网取证(冰箱)

参考检材 `贾韦码\智能冰箱\SmartFridge.bin`.

给的甚至不是个固件. 在看过检材中提及的冰箱的型号(Panasonic NR-E46CV1)的详细说明后, 可以确认这部分的检材是生编硬造出来的, 根本不是来自于真实设备的数据.


### 1 分析冰箱，请问智能冰箱的品牌

!!! note "答案"
    Panasonic

![Pasted image 20250514165341.png](./attachments/Pasted%20image%2020250514165341.png)


### 2 请问智能冰箱的型号

!!! note "答案"
    NR-E46CV1

接上题.


### 3 请找智能冰箱的 UUID

!!! warning "本题存疑"
    12345678-90AB-CDEF-1234-567890ABCDEF
    

只能靠猜. 只有 16 Bytes 不知道是什么. 但实际上用1 ~ F 来当作占位填充也完全合理.

![Pasted image 20250514172224.png](./attachments/Pasted%20image%2020250514172224.png)

不知道这种纯靠猜的题目有什么意义.


### 4 请问智能冰箱默认保存几张图片

!!! warning "本题存疑"
    5
    

检材中可以搜索到 5 个 `face` 字符串, 但实际上 `face5` 的位置并没有存储图片. 可以猜测是有 5 个存储位置(默认可以保存至多 5 张), 但实际上只保存了 4 张.

But. 在网上搜索"Panasonic NR-E46CV1"后可以看到松下的日文官网, 其中有对于这台冰箱的详细介绍:

![Pasted image 20250514170724.png](./attachments/Pasted%20image%2020250514170724.png)

该型号的冰箱搭载的摄像模组包含 2 个摄像头, 可以在冰箱门打开时从冰箱外部识别内部的食材, 并且用 AI 给出食谱建议和食品保质期提醒. 摄像头能拍摄到的实际画面是这样的:

![Pasted image 20250514170218.png](./attachments/Pasted%20image%2020250514170218.png)

明确提到了可以保存最新的 1 张照片和最近过去的 5 张照片, 合计 6 张照片. 并且, 在查看过配套 APP 的使用说明之后还会发现, 这些照片并不存在本地, 而是上传到松下的云服务器中.

所以可见, 这部分题目已经完全脱离实际了, 毫无现实意义. 


### 5 请问冰箱中已存的第一张图片上的内容是什么

!!! note "答案"
    盘古石杯贾韦码

用 `foremost` 分离出检材内的已知文件, 包括 4 张 jpg 格式的图片. 第 1 张是:

![Pasted image 20250514172455.png](./attachments/Pasted%20image%2020250514172455.png)


### 6 请问冰箱中已存的第二张图片的名称是什么

!!! warning "本题存疑"
    face2.jpg
    

可以看到在第 1 张图片之前有 `face1` 的字符串, 猜测 `faceX` 是作为图片文件的描述符存在的. 全局搜索 `face` 字符串, 找到 `face2` 的位置:

![Pasted image 20250514172557.png](./attachments/Pasted%20image%2020250514172557.png)

之后就全是猜测了. 标识为 `face2`, 又是 `jpg` 格式, 猜测原始文件名为 `face2.jpg`. 但, 为什么扩展名不能是 `jpeg` 呢? 或者干脆没有扩展名? 而且就算文件在存储内的标识符为 `face2`, 也不代表着原始文件名一定是 `face2`. 又是一道毫无意义的题目.


### 7 请找冰箱中隐藏的内容

!!! note "答案"
    pangushicup

更是逆天. 我很想知道正常情况下, 怎么才能在冰箱的闪存芯片(也许)里写这么一段文字.

strings: 

```shell
strings .\SmartFridge.bin > strings.txt
```

![Pasted image 20250514173317.png](./attachments/Pasted%20image%2020250514173317.png)


### 8 请找出冰箱中嫌疑人图片 MD5 值的后六位

!!! note "答案"
    882564

第 3 张图片是钟无声的照片. 计算 MD5:

![Pasted image 20250514173544.png](./attachments/Pasted%20image%2020250514173544.png)


### 9 请找出冰箱最后一次开门时间

!!! warning "此题存疑"
    

这道题猜都猜不到. 整个检材里就那么多信息, 之前的题目已经全部用完了. 唯一一个没用上的是图片文件的大小:

![Pasted image 20250514174033.png](./attachments/Pasted%20image%2020250514174033.png)


### 10 默认图片的存储限制大小是多少

!!! warning "此题存疑"
    100 KB
    

还是只能猜. 有两种不同的猜测.

第一种是, 每两个相邻的 `face` 之间的距离都为 `102424 Bytes`, 去除相对固定的大小为 `24 Bytes` 的头之后, 其余 `102400 Bytes = 100 KB` 的空间可用于存储图片文件.

![Pasted image 20250514174346.png](./attachments/Pasted%20image%2020250514174346.png)

第二种是, 从文件和字符串的存储来看, 这个文件采取小端序存储, 因此用于描述图片文件的大小的位置是 `2 Bytes` ~ `4 Bytes`:

![Pasted image 20250514174549.png](./attachments/Pasted%20image%2020250514174549.png)

如果只有 `2 Bytes`, 那么图片文件的大小上限就是 `0xffff Bytes ≈ 64 KB`. 在 `3 Bytes` 的情况下, 大小上限为 `0xffffff ≈ 16 MB`. 在 `4 Bytes` 的情况下, 可以达到 `0xffffffff ≈ 4096 MB`.

但考虑到实际情况, 存储限制应该更大一些. 现实中, 该摄像头需要拍摄的是冰箱内部的照片, 并且需要能够清晰分辨冰箱内的物品, 因此图片的像素并不会低, 图片大小不可能限制在 100 KB. 不过这部分题目已经抛开事实不谈了, 纠结这些也没什么意义.


## 物联网取证(监控)

参考检材 `贾韦码\监控\video.E01`.


### 11 被修改的录像 MD5 前 5 位

!!! note "答案"
    EA7BE

挂载之后会发现视频文件的时间非常混乱, 根据文件的修改时间和视频内左上角的时间, 可以判断出来, 视频内的时区与文件修改时间的时区差了 15 小时.

可以看到, `video.E01/分区2/video/00/20250415/2300-2400/233549-00001-M.mp4` 的修改时间是最晚的, 但视频内容却是最早的. 据此可以推断文件被篡改过.

![Pasted image 20250514180700.png](./attachments/Pasted%20image%2020250514180700.png)

如果在或火眼的自动分析中开启了视频逐帧分析, 会在生成的略缩图中看到时间发生了回跳:

![Pasted image 20250514180622.png](./attachments/Pasted%20image%2020250514180622.png)

计算 MD5: 

![Pasted image 20250514180820.png](./attachments/Pasted%20image%2020250514180820.png)


## 小作文

首先是盘古祖传 UE 3A 大作. 往年倒还好, 要么游戏里只有案情, 要么有一些信息但检材里也有. 今年直接开局来个王炸, 电脑密码和 VC 容器口令爆破掩码塞到里面, 还是在 **衣柜里的隐藏房间** 里面? 不是, 哥们在玩 DnD 还是 CoC 还是密室逃脱啊, 隐藏密室都来了? 

而且这个 \*\**仙舟粗口*\*\* 小游戏还卡的一比, 我玩崩铁开高画质大世界好歹能稳定 60 帧吧, 盘古这个 3A 大作低画质只能 20 帧上下波动. 仔细一看, 原来用的是 Vulkan 和 OpenGL. 比赛的时候因为没看到 VC 口令掩码, 一直觉得 VC 容器用的是文件密钥 + 口令(白板里的提示). 

其次是无比模糊的题目描述. 看一道题得先想半天, 这题问的是哪个检材的事. 题目分类还不如不分, 干脆把所有题目一次性显示出来得了. 不说详细到检材了, 你好歹手机把安卓和 iOS 分一下, 服务器好歹把 Linux 和 Windows 分一下吧? 

举个典中典的题: "图片中隐藏的内容是什么",  \*\**龙门粗口*\*\* 电脑上几千张图片, 倒是给个范围啊? 既然有隐写, 那我问你, 嫌疑人是怎么读的信息啊? 检材里又没有工具, 嫌疑人直接肉眼从屏幕上识别 LSB 还顺便扫了个二维码是吧.

其次是 Unraid OS. 我的评价是: 放到 CTF 的 Misc 分类里面挺好的, 可以给 Misc 手充分的参与感. 然后边做边骂: 他呜呜伯的出题人真是个小可爱, 我真想一锤子爱死你. 

一刻也没有为服务器找不到 Keyfile 而哀悼, 紧接着来到战场的是数据分析部分. 题目描述好似丁真同等的文化水平, 几道题根本不知道想问什么. 丢给大模型后, 大模型都得反问我一句到底要干啥. 中文描述看不懂想着看看英文吧, 结果更是重量级, 修饰语根本看不出来是怎么套的, 感觉比案情都复杂一点了.

最后一位那直接是魔幻主义选手. 松下的开发看了都得摸着后脑勺问句"なにこれ?". 这部分写 WP 的时候直接没忍住, 全写到题目解析里面了. 简单点说就是"抛开事实不谈", 在取证比赛里面给这检材, 属实有点幽默.

总结一下, 这次盘古的初赛的赛题水平比起前两年稳步提升, 接近登峰造极. 至于是哪方面提升就不好说了. 

最后再回过头来看看盘古石比赛前官方的宣传文:

> 大赛亮点实战导向：改编真实案件，结合 **刑事技术** 实战侦查思路，通过虚实交织的 **“意外死亡”** 推演，嵌入多模态数据：**监控录像（含深伪片段）**、**加密通信记录**、**生物特征（指纹/足迹）**、**社交网络痕迹**、**物联网设备日志**等。设置**多层干扰信息（如虚假时间戳、AI生成的伪造语音、篡改的元数据）**，完整的体现案件上下游全链路的打击思路。
>


- 改编真实案件: 基本没有案情
- 监控录像(含深伪片段): DeepFake 在哪儿呢?
- 加密通信记录: 原来是手动加密
- 社交网络痕迹: 指 Telegram 聊天记录
- 物联网设备日志: 你管这玩意儿叫日志?
- 多层干扰信息(如虚假时间戳, AI 生成的伪造语音, 篡改的元数据): 根本没有.

顺便 AIGC check 一下宣传文:

![Pasted image 20250516154949.png](./attachments/Pasted%20image%2020250516154949.png)

