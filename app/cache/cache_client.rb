class CacheClient
  def self.get(key)
    redis = RedisClient.get
    redis.get(key)
  end

  def self.influencer_stat(influencer_id)
    redis = RedisClient.get
    stat = redis.get(influencer_id)
    if stat.nil?
      CachedStat.new(0, 0)
    else
      stat = JSON.parse(stat)
      CachedStat.new(stat['count'], stat['avg'])
    end
  end

  def self.update_stat(key, value)
    redis = RedisClient.get
    redis.set(key, value.to_json)
  end
end
