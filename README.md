### 基于微信公众平台的Open-id加密的用来生成密码的服务

微信号: X-passwords

![title](https://raw.githubusercontent.com/rudyboy/secret-wechat/master/images/title.jpeg "头像")

<img src="https://raw.githubusercontent.com/rudyboy/secret-wechat/master/images/code.jpg" height="200" width="200" >

### 撞库

很多人注册网站都是采用一个用户名和密码（弱密码）注册，在现今各种网站数据频繁泄露的情况下，咱们的密码保护其实是很弱的！
只要其中一个网站信息泄露，别有用心的人会利用这些数据去尝试登录其他常用网站（12306，淘宝等）。
如果你登录多个网站的用户名和密码都一样，你的账号信息是相当危险的！

为了防止这种情况的出现有下面两种方式：

>密码强化（密码中使用大小写，数字各种混搭），防止被盗

>网站不同，使用不同的密码

### 解决方法

#### 按照自己登录的应用来定制密码

<img src="https://raw.githubusercontent.com/rudyboy/secret-wechat/master/images/test1.jpg" height="400" width="300" >

#### 一个应用使用两个账号

<img src="https://raw.githubusercontent.com/rudyboy/secret-wechat/master/images/test2.jpg" height="400" width="300" >

#### 不支持非emoji表情

<img src="https://raw.githubusercontent.com/rudyboy/secret-wechat/master/images/test3.jpg" height="400" width="300" >

### 加密方案

#### 申明

在这里我没有使用任何保存信息的操作，只是提供密码生成服务。

#### 原理

* 每一个微信号关注任何一个公众账号都会有一个Open-id,这个Open-id是随机生成，且关注不同公众号均不同。

* 每个关注公众号的微信账号Open-id均不会改变。也就说输入相同内容，每次返回的password均相同。

* 理论上破解加密算法需要知道关注本公众账号的微信账号的Open-id（32位随机字符串）、我的微信公众号的ID（10位随机字符串）、我自己设定的Key（10多位字符）

* 采用的是SHA家族加密，无法逆向还原。

### License

MIT License.


如有任何问题，可随时联系我。
