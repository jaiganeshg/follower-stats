class Influencers
  INFLUENCERS = [1000000, 1000001, 1000002, 100003, 1000004]
  def track
    INFLUENCERS.each do
      StatsFetcherJob
    end
  end
end
