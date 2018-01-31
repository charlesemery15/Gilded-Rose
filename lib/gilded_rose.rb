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

  end

  def backstage(item)

  end

  def lengendary(item)

  end

  def conjured(item)

  end

  def standard(item)
    if item.quality == 0
      item.sell_in = item.sell_in - 1
    else item.quality < 50
      item.quality = item.quality - 1
      item.sell_in = item.sell_in - 1
      if item.sell_in <= 0
        item.quality = item.quality - 1
      end
    end
  end
end
