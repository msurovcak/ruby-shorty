require 'cuba'
require 'yaml'
require 'json'

require './db/rid'


Cuba.define do
  on get do
    on root do
      res.redirect '/about'
    end

    on 'about' do
      res.write partial('about')
    end

    on 'add' do
      res.write partial('add')
    end

    on 'err404' do
      res.write partial('404')
    end

    on ':rid' do |rid|
      found = Rid::get_item(rid)
      if not found
        res.redirect 'err404'
      else
        res.redirect "#{found}"
      end
    end
  end

  on post do
    on 'add' do
      on param('url') do |url|
        rid = Rid::create_item(url)
        if not rid
          res.write JSON.generate({:status => 'BAD'})
        else
          #res.write {:status => 'OK', :url => "#{url}", :rid => "#{rid}"}.to_json()
          res.write JSON.generate({:status => 'OK', :url => "#{url}", :rid => "#{rid}"})
        end
      end

      on true do
        res.write 'error'
      end
    end
  end
end