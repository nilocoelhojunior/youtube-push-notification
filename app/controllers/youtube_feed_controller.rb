require 'nokogiri'

class YoutubeFeedController < ApplicationController

  protect_from_forgery except: :index

  def update
    xml = Nokogiri::XML(request.body.string)
    xml.search('uri').each do |update|
      puts update.children.text
    end
  end

end
