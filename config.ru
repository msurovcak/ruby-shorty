require './shorty'
require "cuba"
require "cuba/render"
require "erb"

Cuba.plugin(Cuba::Render)
Cuba.settings[:render][:views] = "./views/"

Cuba.settings[:redis]={}
Cuba.settings[:redis][:port] = ENV['SHORTY_DB_PORT'] || '6379'
Cuba.settings[:redis][:host] = ENV['SHORTY_DB_HOST'] || 'localhost'

run Cuba