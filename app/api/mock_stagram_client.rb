class MockStagramClient < ApiClient
  SERVER_URL = ENV['MOCKSTAGRAM_SERVER_URL']
  STAT_API = '/api/v1/influencers/'

  def influencer_stat(influencer_id)
    stat_api = url(STAT_API)
    influencer_url = stat_api + influencer_id.to_s

    response = RestClient.get(influencer_url)
    unless is_success(response.code)
      InfluencerStat.new(nil, nil, nil, nil)
    end
      stat = JSON.parse(response.body)
      InfluencerStat.new(stat["pk"], stat["username"], stat["followerCount"], stat["followingCount"])
  end

  private
  def url(api)
    SERVER_URL + api
  end
end
