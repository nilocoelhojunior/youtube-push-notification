require 'net/http'

class YoutubeSubscriptionController < ApplicationController

  protect_from_forgery except: :index

  def subscribe
    callback_url = update_url
    topic_url = "https://www.youtube.com/xml/feeds/videos.xml?channel_id=UC_CfVdUXPA2Q6AhtW46UMWw"
    sub = URI.parse('https://pubsubhubbub.appspot.com/subscribe')
    sub_data = {
      'hub.verify_token': 'AIzaSyDNLxDmYiBke9f6gfhEIDlu1ykS2_PsPBw',
      'hub.mode': 'subscribe',
      'hub.verify': 'async',
      'hub.callback': callback_url,
      'hub.topic': topic_url
    }
    sub.query = URI.encode_www_form(sub_data)
    http = Net::HTTP.new(sub.host, sub.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(sub.to_s)
    response = http.request(request)

    render json: response.body
  end

  def confirm
    render plain: params['hub.challenge']
  end

end
