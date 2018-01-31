require "item"

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      case item.name
      when "Aged Brie"
        aged(item)
      when "Backstage passes to a TAFKAL80ETC concert"
        backstage(item)
      when "Sulfuras, Hand of Ragnaros"
        lengendary(item)
      when "Conjured"
        conjured(item)
      else
        standard(item)
      end
    end
  end

  def aged(item)
    item.quality = (item.sell_in <= 0 ? item.quality + 2 : item.quality + 1)
    item.sell_in = item.sell_in - 1
    item.quality = 50 if item.quality > 50
  end

  def backstage(item)
    item.quality += 1
    item.quality += 1 if item.sell_in < 11
    item.quality += 1 if item.sell_in < 6
    item.quality = 0 if item.sell_in <= 0
    item.quality = 50 if item.quality > 50
    item.sell_in -= 1
  end

  def lengendary(item)
    item.quality = item.quality
    item.sell_in = item.sell_in
  end

  def conjured(item)
    item.quality -= 2
    item.sell_in -= 1
  end

  def standard(item)
    item.quality = (item.sell_in <= 0 ? item.quality - 2 : item.quality - 1)
    item.quality = 0 if item.quality <= 0
    item.sell_in = item.sell_in - 1
  end
end
