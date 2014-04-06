require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe MerchantsController do

  # This should return the minimal set of attributes required to create a valid
  # Merchant. As you add validations to Merchant, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "address" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MerchantsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all merchants as @merchants" do
      merchant = Merchant.create! valid_attributes
      get :index, {}, valid_session
      assigns(:merchants).should eq([merchant])
    end
  end

  describe "GET show" do
    it "assigns the requested merchant as @merchant" do
      merchant = Merchant.create! valid_attributes
      get :show, {:id => merchant.to_param}, valid_session
      assigns(:merchant).should eq(merchant)
    end
  end

  describe "GET new" do
    it "assigns a new merchant as @merchant" do
      get :new, {}, valid_session
      assigns(:merchant).should be_a_new(Merchant)
    end
  end

  describe "GET edit" do
    it "assigns the requested merchant as @merchant" do
      merchant = Merchant.create! valid_attributes
      get :edit, {:id => merchant.to_param}, valid_session
      assigns(:merchant).should eq(merchant)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Merchant" do
        expect {
          post :create, {:merchant => valid_attributes}, valid_session
        }.to change(Merchant, :count).by(1)
      end

      it "assigns a newly created merchant as @merchant" do
        post :create, {:merchant => valid_attributes}, valid_session
        assigns(:merchant).should be_a(Merchant)
        assigns(:merchant).should be_persisted
      end

      it "redirects to the created merchant" do
        post :create, {:merchant => valid_attributes}, valid_session
        response.should redirect_to(Merchant.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved merchant as @merchant" do
        # Trigger the behavior that occurs when invalid params are submitted
        Merchant.any_instance.stub(:save).and_return(false)
        post :create, {:merchant => { "address" => "invalid value" }}, valid_session
        assigns(:merchant).should be_a_new(Merchant)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Merchant.any_instance.stub(:save).and_return(false)
        post :create, {:merchant => { "address" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested merchant" do
        merchant = Merchant.create! valid_attributes
        # Assuming there are no other merchants in the database, this
        # specifies that the Merchant created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Merchant.any_instance.should_receive(:update_attributes).with({ "address" => "MyString" })
        put :update, {:id => merchant.to_param, :merchant => { "address" => "MyString" }}, valid_session
      end

      it "assigns the requested merchant as @merchant" do
        merchant = Merchant.create! valid_attributes
        put :update, {:id => merchant.to_param, :merchant => valid_attributes}, valid_session
        assigns(:merchant).should eq(merchant)
      end

      it "redirects to the merchant" do
        merchant = Merchant.create! valid_attributes
        put :update, {:id => merchant.to_param, :merchant => valid_attributes}, valid_session
        response.should redirect_to(merchant)
      end
    end

    describe "with invalid params" do
      it "assigns the merchant as @merchant" do
        merchant = Merchant.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Merchant.any_instance.stub(:save).and_return(false)
        put :update, {:id => merchant.to_param, :merchant => { "address" => "invalid value" }}, valid_session
        assigns(:merchant).should eq(merchant)
      end

      it "re-renders the 'edit' template" do
        merchant = Merchant.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Merchant.any_instance.stub(:save).and_return(false)
        put :update, {:id => merchant.to_param, :merchant => { "address" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested merchant" do
      merchant = Merchant.create! valid_attributes
      expect {
        delete :destroy, {:id => merchant.to_param}, valid_session
      }.to change(Merchant, :count).by(-1)
    end

    it "redirects to the merchants list" do
      merchant = Merchant.create! valid_attributes
      delete :destroy, {:id => merchant.to_param}, valid_session
      response.should redirect_to(merchants_url)
    end
  end

end
