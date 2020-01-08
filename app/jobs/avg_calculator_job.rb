class AvgCalculatorJob
  include Sidekiq::Worker

  def perform(influencer_stat)
    puts influencer_stat
    cache_stat = CacheClient.influencer_stat(influencer_stat['influencer_id'])
    avg = cache_stat.avg
    count = cache_stat.count

    updated_avg = calcualte_avg(avg, count, influencer_stat['follower_count'])

    CacheClient.update_stat(influencer_stat['influencer_id'], {avg: updated_avg, count: count+1})
  end


  def calcualte_avg(avg, count, new_value)
    avg/(count+1)*count + new_value/(count+1)
  end
end
