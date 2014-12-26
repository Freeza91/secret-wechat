require 'sinatra'
require 'active_support/core_ext/hash'
require './helper'

  before do
    timestamp, nonce = params[:timestamp].to_s, params[:nonce].to_s
    codes = ["jwcbit", timestamp, nonce].sort.join("")
    halt!('401 Unauthorized', 401) unless Digest::SHA1.hexdigest(codes) == params[:signature]
    status(200)
  end

  get '/' do
    params['echostr']
  end

  post '/' do
    @params = Hash.from_xml(request.body.read)['xml']
    case @params['MsgType']
    when "text"
      @params['Content'] = secret("#{params['FromUserName']}",
                                  "#{@params['ToUserName']}",
                                  "#{@params['Content']}")
      erb :text
    end
  end