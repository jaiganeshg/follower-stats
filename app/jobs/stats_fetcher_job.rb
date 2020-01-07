class StatsFetcherJob < ApplicationJob
  def perform(influencer_id)
    influencer_stat = MockStagramClient.new.influencer_stat(influencer)
    DBClient.insert_influencer_stat(influencer_stat)

    StatsFetcherJob.perform_later(influencer_id)

    AvgCalculatorJob.process(influencer_stat)
  end
end
