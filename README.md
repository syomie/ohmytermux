#### 介绍
由于一些原因，经常需要清空termux数据重新初始化，而手动配置又比较麻烦，所以将一些资源直接做成安装包，快速配置出(我)需要的termux环境
#### 使用效果展示
虚拟键盘扩展了上滑输入。

ALT上滑新建会话/TAB上滑切换到下个会话/CTRL上滑切换到上个会话
![虚拟键盘1](./doc/image/IMG_PITU_20210224_154620.jpg)
![虚拟键盘2](./doc/image/IMG_PITU_20210224_154640.jpg)
![虚拟键盘3](./doc/image/IMG_PITU_20210224_154704.jpg)
![虚拟键盘4](./doc/image/IMG_PITU_20210224_154722.jpg)
![全屏图1](./doc/image/Screenshot_20210224_153628_com.termux.jpg)
![全屏图2](./doc/image/Screenshot_20210224_153723_com.termux.jpg)
![全屏图3](./doc/image/Screenshot_20210224_153904_com.termux.jpg)

#### 安装说明

1.  添加apt源,一行一行来
    ```
    pkg install gnupg -y
    # 导入公钥
    apt-key adv --recv-keys DD2366C3F5BD1344
    echo "deb https://www.syomie.fun/termux-deb/ termux non-free" > $PREFIX/etc/apt/sources.list.d/syomie.list
    apt update
    ```
    关于该源见下方附加说明。
2.  安装oh-my-termux
    ```
    apt install oh-my-termux
    ```
#### 目录结构说明
* ./package          最终需要打包的目录
* ./package/data     软件包内容


#### 关于syomie软件源
* 这是一个自用的软件源。
* 本源不提供任何保障，亦不承担任何使用该源造成的后果(责任)。
* 目前只在termux可用，并且不能替代官方源(非镜像)
* 包含部分来自网络，或从网络收集并由我重新打包的deb软件包，如果您发现错误/更新/侵权/上传其他包裹或其他问题，请提交问题反馈或<a href="mailto:lian1581@qq.com">发送邮件</a>联系。

#### 附:syomie源软件包列表
* openjdk-11-jdk/11.0.10
* oh-my-termux
* sdk-tools/3.0
* build-tools-r28/1.0.1
* build-tools-r29/1.0.0
* gradle/6.8.3
