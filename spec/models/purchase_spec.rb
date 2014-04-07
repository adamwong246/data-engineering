require 'spec_helper'

describe Purchase, focus: true do

  describe "construction" do
    describe "from objects" do
      before(:each) do
        @purchase = Purchase.new({
          count: 99,
          purchaser: FactoryGirl.create(:purchaser,
            name: "Hank Hill"),
          item: FactoryGirl.create(:item,
            description: "Propane and propane accessories",
            price: "99.99"
          ),
          merchant: FactoryGirl.create(:merchant,
            name: "Strickland Propane",
            address: "135 Los Gatos Road Arlen Texas"
          )
        })
      end

      it "it should have the correct count" do
        expect(@purchase.count).to eq(99)
      end

      it "it should have the purchaser" do
        expect(@purchase.purchaser.name).to eq("Hank Hill")
      end

      it "it should have the item" do
        expect(@purchase.item.description).to eq("Propane and propane accessories")
        expect(@purchase.item.price).to be_within(0.01).of(99.99)
      end

      it "it should have an merchant" do
        expect(@purchase.merchant.name).to eq("Strickland Propane")
        expect(@purchase.merchant.address).to eq("135 Los Gatos Road Arlen Texas")
      end
    end
    describe "from hashes" do
      before(:each) do
        @purchase = Purchase.new({
          count: 99,
          purchaser_attributes: FactoryGirl.attributes_for(:purchaser,
            name: "Hank Hill"),
          item_attributes: FactoryGirl.attributes_for(:item,
            description: "Propane and propane accessories",
            price: "99.99"
          ),
          merchant_attributes: FactoryGirl.attributes_for(:merchant,
            name: "Strickland Propane",
            address: "135 Los Gatos Road Arlen Texas"
          )
        })
      end

      it "it should have the correct count" do
        expect(@purchase.count).to eq(99)
      end

      it "it should have the purchaser" do
        expect(@purchase.purchaser.name).to eq("Hank Hill")
      end

      it "it should have the item" do
        expect(@purchase.item.description).to eq("Propane and propane accessories")
        expect(@purchase.item.price).to be_within(0.01).of(99.99)
      end

      it "it should have an merchant" do
        expect(@purchase.merchant.name).to eq("Strickland Propane")
        expect(@purchase.merchant.address).to eq("135 Los Gatos Road Arlen Texas")
      end
    end
  end

  describe "class methods" do
    describe "parameters_from_csv" do
      describe "should be able to process a csv file into a array of hash" do
        before(:each) do
          pending("No Longer applicable")
          @file = Rack::Test::UploadedFile.new('example_input.tab', "image/csv")
        end

        it "should return an array" do
          expect(
            Purchase.parameters_from_csv({csv: @file})
          ).to be_a_kind_of(Array)
        end

        it "should have 4 items" do
          expect(
            Purchase.parameters_from_csv({csv: @file})
          ).to have(4).items
        end

        it "should have key [purchaser_attributes]" do
          Purchase.parameters_from_csv({csv: @file}).each {|r|
            expect(r).to have_key(:purchaser_attributes)
          }
        end

        it "should have key [purchaser_attributes][name]" do
          Purchase.parameters_from_csv({csv: @file}).each {|r|
            expect(r[:purchaser_attributes]).to have_key(:name)
          }
        end

        it "should have key [item_attributes]" do
          Purchase.parameters_from_csv({csv: @file}).each {|r|
            expect(r).to have_key(:item_attributes)
          }
        end

        it "should have key [item_attributes][description]" do
          Purchase.parameters_from_csv({csv: @file}).each {|r|
            expect(r[:item_attributes]).to have_key(:description)
          }
        end

        it "should have key [item_attributes][price]" do
          Purchase.parameters_from_csv({csv: @file}).each {|r|
            expect(r[:item_attributes]).to have_key(:price)
          }
        end

        it "should have key [merchant_attributes]" do
          Purchase.parameters_from_csv({csv: @file}).each {|r|
            expect(r).to have_key(:merchant_attributes)
          }
        end

        it "should have key [merchant_attributes][name]" do
          Purchase.parameters_from_csv({csv: @file}).each {|r|
            expect(r[:merchant_attributes]).to have_key(:name)
          }
        end

        it "should have key [merchant_attributes][address]" do
          Purchase.parameters_from_csv({csv: @file}).each {|r|
            expect(r[:merchant_attributes]).to have_key(:address)
          }
        end
      end
    end
  end
end
