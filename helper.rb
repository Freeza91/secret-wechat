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

end

