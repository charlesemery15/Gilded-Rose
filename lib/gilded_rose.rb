require "item"

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name == "Aged Brie"
        aged(item)
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        backstage(item)
      elsif item.name == "Sulfuras, Hand of Ragnaros"
        legendary(item)
      elsif item.name == "Conjured"
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

  end

  def conjured(item)

  end

  def standard(item)
    item.quality = (item.sell_in <= 0 ? item.quality - 2 : item.quality - 1)
    item.quality = 0 if item.quality <= 0
    item.sell_in = item.sell_in - 1
  end
end
