class PurchasesController < ApplicationController
  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @purchases }
    end
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
    @purchase = Purchase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @purchase }
    end
  end

  # GET /purchases/new
  # GET /purchases/new.json
  def new
    @purchase = Purchase.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @purchase }
    end
  end

  # GET /purchases/1/edit
  def edit
    @purchase = Purchase.find(params[:id])
  end

  # POST /purchases
  # POST /purchases.json
  def create
    @purchases = CSV.new(params[:purchase][:csv].read, headers: true, :col_sep => "\t")
      .to_a.map{|row|
        p = Purchase.create(count: row["purchase count"].to_i)
        p.purchaser = Purchaser.find_or_create_by_name(row["purchaser name"])
        p.item = Item.find_or_create_by_description_and_price(row["item description"], row["item_price"])
        p.merchant = Merchant.find_or_create_by_name_and_address(row["merchant name"], row["merchant address"])
        p
      }
    # @purchase = Purchase.parameters_from_csv(params[:purchase]).map {|h|
    #   Purchase.create(h)
    # }

    respond_to do |format|
      all_ok = true
      Purchase.transaction do
        all_ok = @purchases.map{|purchase|
          purchase.save
        }.all?
      end

      if all_ok 
        format.html { redirect_to purchases_path, notice: 'Purchase(s) were successfully created.' }
      else
        format.html { redirect_to new_purchase_path, alert: "Something went wrong with that upload" }
      end
    end
  end

  # PUT /purchases/1
  # PUT /purchases/1.json
  def update
    @purchase = Purchase.find(params[:id])

    respond_to do |format|
      if @purchase.update_attributes(params[:purchase])
        format.html { redirect_to @purchase, notice: 'Purchase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy

    respond_to do |format|
      format.html { redirect_to purchases_url }
      format.json { head :no_content }
    end
  end
end
