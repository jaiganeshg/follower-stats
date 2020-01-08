class DBClient
  SERVER_URL = ENV['ELASTICSEARCH_SERVER_URL']
  INFLUENCER_URL = '/influencer/_doc'
  def self.insert_influencer_stat(influencer_stat)
    RestClient.post(self.url(INFLUENCER_URL), influencer_stat.to_json, {content_type: :json, accept: :json})
  end

  private
  def self.url(sub_url)
    SERVER_URL + sub_url
  end
end
