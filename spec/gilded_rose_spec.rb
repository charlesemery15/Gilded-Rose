require'gilded_rose'

describe GildedRose do

  describe "#update_quality" do

    context "standard items" do

      it "does not change the name" do
        items = [Item.new("foo", 0, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].name).to eq "foo"
      end

      describe "#quality" do

        it "doesn't change the quality of an item if it's 0" do
          items = [Item.new("kiwi", 5, 0)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 0
        end

        it "decreases quality at the end of each day by 1" do
          items = [Item.new("redbull", 10, 20)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 19
        end

        it "decrease quality twice as fast when sell_in equals 0" do
          items = [Item.new("burger", 0, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 8
        end
      end

      describe "#sell_in" do

        it "should decrease by 1 everyday" do
          items = [Item.new("carrot", 5, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq 4
        end

        it "should go below 0" do
          items = [Item.new("carrot", 0, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq -1
        end
      end
    end

    

    describe "#Sulfuras, Hand of Ragnaros" do

      describe "#quality" do

        it "should not change" do
          items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 10
        end
      end

      describe "#sell_in" do

        it "should not change" do
          items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq 0
        end
      end
    end

    describe "#Conjured item" do

      describe "#quality" do

        it "should degrade at double the rate" do
          items = [Item.new("Conjured", 5, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 8
        end

        it "continues to degrade twice as fast after sell_in = 0" do
          items = [Item.new("Conjured", 0, 8)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 6
        end
      end

      describe "#sell_in" do

        it "should decrease by 1 everyday" do
          items =  [Item.new("Conjured", 5, 3)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq 4
        end
      end
    end
  end
end
