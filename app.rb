require 'sinatra'
require 'active_support/core_ext/hash'
require './helper'

  #对微信发来的所有消息进行验证
  before do
    timestamp, nonce = params[:timestamp].to_s, params[:nonce].to_s
    codes = ["jwcbit", timestamp, nonce].sort.join("")
    halt(401, '401 Unauthorized') unless Digest::SHA1.hexdigest(codes) == params[:signature]
    status(200)
  end

  #验证成功
  get '/' do
    params['echostr']
  end

  #处理post请求
  post '/' do

    #读取参数
    @params = Hash.from_xml(request.body.read)['xml']

    case @params['MsgType']
    when "text"
      #加密
      @params['Content'] = secret("#{@params['FromUserName']}",
                                  "#{@params['ToUserName']}",
                                  "#{@params['Content']}")
      #返回加密结果
      erb :text
    end
  end