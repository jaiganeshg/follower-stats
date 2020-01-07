require 'rest-client'
require 'json'

class MockStagramClient < ApiClient
  SERVER_URL = ENV.Read('MOCKSTAGRAM_SERVER_URL')
  STAT_API = '/api/v1/influencers/'

  def influencer_stat(influencer_id)
    url = url(STAT_API)
    influencer_url = url + influencer_id

    response = RestClient.get(influencer_url)
    unless is_success(response.code)
      InfluencerStat.new(nil, nil, nil, nil)
    end
      stat = JSON.parse(response.body)
      InfluencerStat.new(stat[:pk], stat[:username], stat[:followerCount], stat[:followingCount])
  end

  private
  def url(api)
    SERVER_URL + api
  end
end
