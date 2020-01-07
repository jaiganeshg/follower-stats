class InfluencerStat
  attr_accessor :influencer_id, :username, :follower_count, :following_count

  def initialize(influencer_id, username, follower_count, following_count)
     self.influencer_id = influencer_id
     self.username = username
     self.follower_count = follower_count
     self.following_count = following_count
  end
end
