require_relative "item"
require_relative "aged"
require_relative "backstage"

class GildedRose

MAXIMUM_QUALITY = 50

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      item.update
    end
  end

private


  def conjured(item)
    item.quality = MAXIMUM_QUALITY  if item.quality > MAXIMUM_QUALITY
    item.sell_in -= 1
  end

  def standard(item)
    item.quality -= 1
    item.quality -= 1 if item.sell_in <= 0
    item.quality = 0 if item.quality < 0
    item.quality = MAXIMUM_QUALITY  if item.quality > MAXIMUM_QUALITY
    item.sell_in -= 1
  end

  def speed(item)
    item.quality = MAXIMUM_QUALITY  if item.quality > MAXIMUM_QUALITY
    item.sell_in -= 1
  end
end
