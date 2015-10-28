require 'redis'
require "cuba"

class Rid

  def self.get_item(rid)
    @db ||= self.connect
    @db.get(rid.to_i(36)) || false
  end

  def self.create_item(url)
    @db ||= self.connect
    last = @db.get('_last').to_i || 0
    @db.set(last + 1, url)
    @db.set('_last', last + 1)
    (last + 1).to_s(36)
  end

  def self.connect
    host = Cuba.settings[:redis][:host]
    port = Cuba.settings[:redis][:port]
    @db = Redis.new(:host => host, :port => port)
  end

end