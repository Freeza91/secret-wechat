require 'digest'
require "base64"

AUTHOR = "rudyboy"
EMAIL = "useyes91@gmail.com"
SCHOOL = "BIT"
KEY = "my_private_key"

helpers do

  def secret(user_id, my_id, user_content)

    #base64 编码，更好支持中文
    encode_content = Base64.encode64(user_content)

    #加密算法
    code = Digest::SHA2.hexdigest("#{encode_content}-#{user_id}-#{my_id}use#{KEY}")
    key = Digest::SHA256.base64digest("#{code}-#{AUTHOR}@#{SCHOOL}by#{EMAIL}")

    #提取最后一个字符的ascii
    num = "#{user_id}"[-1].ord
    left = num % 16
    right = key.size

    #截取16个字符串
    password = ""
    left.upto(right) do |i|
      password += key[i] if is_ok?(key[i])
      return password if password.size >= 16
    end
  end

  #处理特殊字符
  def is_ok?(chr)
    isok = case chr
    when '0'..'9'
      true
    when 'a'..'z'
      true
    when 'A'..'Z'
      true
    else
      false
    end

    isok
  end

  def subscribe
    "欢迎关注rudy的密码服务公众号\n\n" \
    "在这里可以回复一个好记简单字符(比如’qq‘或者一个表情)后台加密返回一个安全性很高的密码\n\n" \
    "输入同一字符，每个微信号结果都不一样，对于一个微信用户，输入同样内容结果都一样。\n\n" \
    "做这个是为了帮助大家更方便、安全管理密码，防止类似12306被撞库的情况。\n\n" \
    "我后台未做任何记录，只提供密码生成，大家放心使用\n\n" \
    "源码地址:https://github.com/rudyboy/secret-wechat" \
  end
end