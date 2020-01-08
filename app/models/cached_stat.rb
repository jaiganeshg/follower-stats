class CachedStat
  attr_accessor :count, :avg

  def initialize(count, avg)
    self.count = count
    self.avg = avg
  end
end
