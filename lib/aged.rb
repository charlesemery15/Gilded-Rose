require_relative "item"

class Aged < Item

MAXIMUM_QUALITY = 50

  def update()
    @quality += 1
    @quality += 1 if @sell_in <= 0
    @quality = MAXIMUM_QUALITY  if @quality > MAXIMUM_QUALITY
    @sell_in -= 1
  end
end
