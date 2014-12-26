require 'sinatra'
require './helper'

get "/" do
  p secret("hshshie94", "93shis", "你好")
  erb :text
end