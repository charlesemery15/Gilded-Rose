describe "#Backstage passes to a TAFKAL80ETC concert" do

  describe "#quality" do

    it "should never be less than 0" do
      items = []
      items.push(Backstage.new("Backstage passes to a TAFKAL80ETC concert", -1, 0))
      items.push(Backstage.new("Backstage passes to a TAFKAL80ETC concert", 0, 0))
      items.push(Backstage.new("Backstage passes to a TAFKAL80ETC concert", -2, 0))
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
      expect(items[1].quality).to eq 0
      expect(items[2].quality).to eq 0
    end

    context "sell_in < 0" do

      it "should decrease to 0" do
        items =[]
        items.push(Backstage.new("Backstage passes to a TAFKAL80ETC concert", 0, 10))
        items.push(Backstage.new("Backstage passes to a TAFKAL80ETC concert", 0, 50))
        items.push(Backstage.new("Backstage passes to a TAFKAL80ETC concert", -1, 5))
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
        expect(items[1].quality).to eq 0
        expect(items[2].quality).to eq 0
      end
    end

    context "sell_in 0 < 6" do

      it "should increase by 3" do
        items =[]
        items.push(Backstage.new("Backstage passes to a TAFKAL80ETC concert", 1, 0))
        items.push(Backstage.new("Backstage passes to a TAFKAL80ETC concert", 5, 0))
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 3
        expect(items[1].quality).to eq 3
      end

      it "should max out at 50" do
        items =[]
        items.push(Backstage.new("Backstage passes to a TAFKAL80ETC concert", 1, 48))
        items.push(Backstage.new("Backstage passes to a TAFKAL80ETC concert", 5, 50))
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 50
        expect(items[1].quality).to eq 50
      end
    end

    context "sell_in 5 < 11" do

      it "should increase by 2" do
        items =[]
        items.push(Backstage.new("Backstage passes to a TAFKAL80ETC concert", 6, 0))
        items.push(Backstage.new("Backstage passes to a TAFKAL80ETC concert", 10, 0))
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 2
        expect(items[1].quality).to eq 2
      end

      it "should max out at 50" do
        items =[]
        items.push(Backstage.new("Backstage passes to a TAFKAL80ETC concert", 6, 49))
        items.push(Backstage.new("Backstage passes to a TAFKAL80ETC concert", 10, 50))
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 50
        expect(items[1].quality).to eq 50
      end
    end

    context "sell_in > 10" do

      it "should increase by 1" do
        items =[]
        items.push(Backstage.new("Backstage passes to a TAFKAL80ETC concert", 11, 10))
        items.push(Backstage.new("Backstage passes to a TAFKAL80ETC concert", 14, 49))
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 11
        expect(items[1].quality).to eq 50
      end

      it "should max out at 50" do
        items =[]
        items.push(Backstage.new("Backstage passes to a TAFKAL80ETC concert", 30, 50))
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 50
      end
    end
  end

  describe "#sell_in" do

    it "decreses in value of sell_in at the end of the day" do
      items = [Backstage.new("apple", 5, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 4
    end

    it "decreases below 0" do
      items = [Backstage.new("apple", 0, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq -1
    end
  end
end
