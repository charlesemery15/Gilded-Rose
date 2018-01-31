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

    describe "#Aged Brie" do

      describe "#quality" do

        it "increases the quality as it gets older" do
          items = [Item.new("Aged Brie", 10, 15)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 16
        end

        it "stops increasing the quality when it gets to 50" do
          items = [Item.new("Aged Brie", 10, 50)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 50
        end

        context "sell_in = 0" do

          it "quality increases by 2 " do
            items = [Item.new("Aged Brie", 0, 10)]
            GildedRose.new(items).update_quality()
            expect(items[0].quality).to eq 12
          end

          it "maxes out at 50" do
            items = [Item.new("Aged Brie", 0, 49)]
            GildedRose.new(items).update_quality()
            expect(items[0].quality).to eq 50
          end
        end

        context "sell_in < 0" do

          it "should increase by 2" do
            items = [Item.new("Aged Brie", -1, 0)]
            GildedRose.new(items).update_quality()
            expect(items[0].quality).to eq 2
          end

          it "should max out at 50" do
            items = [Item.new("Aged Brie", -1, 49)]
            GildedRose.new(items).update_quality()
            expect(items[0].quality).to eq 50
          end
        end
      end

      describe "#sell_in" do

        it "should decrease by 1 eveyday" do
          items = [Item.new("Aged Brie", 2, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq 1
        end

        it "can go below 0" do
          items = [Item.new("Aged Brie", 0, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq -1
        end
      end
    end
  
  #   describe "#Backstage passes to a TAFKAL80ETC concert" do
  #
  #     describe "#quality" do
  #
  #       it "should never be less than 0" do
  #         items = []
  #         items.push(Item.new("Backstage passes to a TAFKAL80ETC concert", -1, 0))
  #         items.push(Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 0))
  #         items.push(Item.new("Backstage passes to a TAFKAL80ETC concert", -2, 0))
  #         GildedRose.new(items).update_quality()
  #         expect(items[0].quality).to eq 0
  #         expect(items[1].quality).to eq 0
  #         expect(items[2].quality).to eq 0
  #       end
  #
  #       context "sell_in < 0" do
  #
  #         it "should decrease to 0" do
  #           items =[]
  #           items.push(Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10))
  #           items.push(Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 50))
  #           items.push(Item.new("Backstage passes to a TAFKAL80ETC concert", -1, 5))
  #           GildedRose.new(items).update_quality()
  #           expect(items[0].quality).to eq 0
  #           expect(items[1].quality).to eq 0
  #           expect(items[2].quality).to eq 0
  #         end
  #       end
  #
  #       context "sell_in 0 < 6" do
  #
  #         it "should increase by 3" do
  #           items =[]
  #           items.push(Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 0))
  #           items.push(Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 0))
  #           GildedRose.new(items).update_quality()
  #           expect(items[0].quality).to eq 3
  #           expect(items[1].quality).to eq 3
  #         end
  #
  #         it "should max out at 50" do
  #           items =[]
  #           items.push(Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 48))
  #           items.push(Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 50))
  #           GildedRose.new(items).update_quality()
  #           expect(items[0].quality).to eq 50
  #           expect(items[1].quality).to eq 50
  #         end
  #       end
  #
  #       context "sell_in 5 < 11" do
  #
  #         it "should increase by 2" do
  #           items =[]
  #           items.push(Item.new("Backstage passes to a TAFKAL80ETC concert", 6, 0))
  #           items.push(Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 0))
  #           GildedRose.new(items).update_quality()
  #           expect(items[0].quality).to eq 2
  #           expect(items[1].quality).to eq 2
  #         end
  #
  #         it "should max out at 50" do
  #           items =[]
  #           items.push(Item.new("Backstage passes to a TAFKAL80ETC concert", 6, 49))
  #           items.push(Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 50))
  #           GildedRose.new(items).update_quality()
  #           expect(items[0].quality).to eq 50
  #           expect(items[1].quality).to eq 50
  #         end
  #       end
  #
  #       context "sell_in > 10" do
  #
  #         it "should increase by 1" do
  #           items =[]
  #           items.push(Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 10))
  #           items.push(Item.new("Backstage passes to a TAFKAL80ETC concert", 14, 49))
  #           GildedRose.new(items).update_quality()
  #           expect(items[0].quality).to eq 11
  #           expect(items[1].quality).to eq 50
  #         end
  #
  #         it "should max out at 50" do
  #           items =[]
  #           items.push(Item.new("Backstage passes to a TAFKAL80ETC concert", 30, 50))
  #           GildedRose.new(items).update_quality()
  #           expect(items[0].quality).to eq 50
  #         end
  #       end
  #     end
  #
  #     describe "#sell_in" do
  #
  #       it "decreses in value of sell_in at the end of the day" do
  #         items = [Item.new("apple", 5, 0)]
  #         GildedRose.new(items).update_quality()
  #         expect(items[0].sell_in).to eq 4
  #       end
  #
  #       it "decreases below 0" do
  #         items = [Item.new("apple", 0, 10)]
  #         GildedRose.new(items).update_quality()
  #         expect(items[0].sell_in).to eq -1
  #       end
  #     end
  #   end
  #
  #   describe "#Sulfuras, Hand of Ragnaros" do
  #
  #     describe "#quality" do
  #
  #       it "should not change" do
  #         items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 10)]
  #         GildedRose.new(items).update_quality()
  #         expect(items[0].quality).to eq 10
  #       end
  #     end
  #
  #     describe "#sell_in" do
  #
  #       it "should not change" do
  #         items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 10)]
  #         GildedRose.new(items).update_quality()
  #         expect(items[0].sell_in).to eq 0
  #       end
  #     end
  #   end
  #
  #   describe "#Conjured item" do
  #
  #     describe "#quality" do
  #
  #       it "should degrade at double the rate" do
  #         items = [Item.new("Conjured, soap", 5, 10)]
  #         GildedRose.new(items).update_quality()
  #         expect(items[0].quality).to eq 8
  #       end
  #
  #       it "continues to degrade twice as fast after sell_in = 0" do
  #         items = [Item.new("Conjured, shampoo", 0, 8)]
  #         GildedRose.new(items).update_quality()
  #         expect(items[0].quality).to eq 6
  #       end
  #     end
  #
  #     describe "#sell_in" do
  #
  #       it "should decrease by 1 everyday" do
  #         items =  [Item.new("Conjured, conditioner", 5, 3)]
  #         GilderedRose.new(items).update_quality()
  #         expect(items[0].sell_in).to eq 4
  #       end
  #     end
  #   end
  end
end
