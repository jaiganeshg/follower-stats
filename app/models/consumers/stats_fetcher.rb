class Consumers::StatsFetcher < Racecar::Consumer
  subscribes_to "influencer_updates"

  def process(message)
    StatsFetcherJob.perform_later(message[:id])
  end
end
