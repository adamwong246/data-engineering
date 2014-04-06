require 'spec_helper'

describe Purchase, focus: true do

  describe "construction" do
    before(:each) do
      @purchase = Purchase.new({
        count: 99
      })
    end

    it "it should have the correct count" do
      expect(@purchase.count).to eq(99)
    end
  end

  describe "class methods" do
    describe "paramters_from_csv" do
      describe "should be able to process a csv file into a array of hash" do
        before(:each) do
          @file = Rack::Test::UploadedFile.new('example_input.tab', "image/csv")
        end

        it "should return an array" do
          expect(
            Purchase.paramters_from_csv({csv: @file})
          ).to be_a_kind_of(Array)
        end

        it "should have 4 items" do
          expect(
            Purchase.paramters_from_csv({csv: @file})
          ).to have(4).items
        end

      end
    end
  end
end