class StatsFetcherJob
  include Sidekiq::Worker

  def perform(influencer)
    influencer_stat = MockStagramClient.new.influencer_stat(influencer)
    DBClient.insert_influencer_stat(influencer_stat)

    AvgCalculatorJob.perform_async(influencer_stat.as_json)
    StatsFetcherJob.perform_in(5.minutes, influencer)
  end
end
