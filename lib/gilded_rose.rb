require_relative "item"
require_relative "aged"

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

  def backstage(item)
    item.quality += 1
    item.quality += 1 if item.sell_in < 11
    item.quality += 1 if item.sell_in < 6
    item.quality = 0 if item.sell_in <= 0
    speed(item)
  end

  def conjured(item)
    item.quality -= 2
    speed(item)
  end

  def standard(item)
    item.quality -= 1
    item.quality -= 1 if item.sell_in <= 0
    item.quality = 0 if item.quality < 0
    speed(item)
  end

  def speed(item)
    item.quality = MAXIMUM_QUALITY  if item.quality > MAXIMUM_QUALITY
    item.sell_in -= 1
  end
end
