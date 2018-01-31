describe "#Aged" do

  describe "#quality" do

    it "increases the quality as it gets older" do
      items = [Aged.new("Aged Brie", 10, 15)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 16
    end

    it "stops increasing the quality when it gets to 50" do
      items = [Aged.new("Aged Brie", 10, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
    end

    context "sell_in = 0" do

      it "quality increases by 2 " do
        items = [Aged.new("Aged Brie", 0, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 12
      end

      it "maxes out at 50" do
        items = [Aged.new("Aged Brie", 0, 49)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 50
      end
    end

    context "sell_in < 0" do

      it "should increase by 2" do
        items = [Aged.new("Aged Brie", -1, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 2
      end

      it "should max out at 50" do
        items = [Aged.new("Aged Brie", -1, 49)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 50
      end
    end
  end

  describe "#sell_in" do

    it "should decrease by 1 eveyday" do
      items = [Aged.new("Aged Brie", 2, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 1
    end

    it "can go below 0" do
      items = [Aged.new("Aged Brie", 0, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq -1
    end
  end
end
