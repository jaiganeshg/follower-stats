class Influencers
  INFLUENCERS = [1000000, 1000001, 1000002, 1000003, 1000004]
  def self.track
    INFLUENCERS.each do |influencer|
      StatsFetcherJob.perform_async(influencer)
    end
  end
end
