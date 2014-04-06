require "spec_helper"

describe PurchasersController do
  describe "routing" do

    it "routes to #index" do
      get("/purchasers").should route_to("purchasers#index")
    end

    it "routes to #new" do
      get("/purchasers/new").should route_to("purchasers#new")
    end

    it "routes to #show" do
      get("/purchasers/1").should route_to("purchasers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/purchasers/1/edit").should route_to("purchasers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/purchasers").should route_to("purchasers#create")
    end

    it "routes to #update" do
      put("/purchasers/1").should route_to("purchasers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/purchasers/1").should route_to("purchasers#destroy", :id => "1")
    end

  end
end
