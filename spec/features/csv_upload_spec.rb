require "spec_helper"

feature "Purchase management" do
  before(:each) do
    visit "/purchases/new"
    attach_file "purchase_csv", Rails.root.join('spec', 'fixtures', 'example_input.tab')
    click_button "Create Purchase(s)"
  end

  scenario "User uploads a csv file" do
    expect(page).to have_text("Purchase(s) were successfully created.")
    
    expect(page).to have_text("Snake Plissken")
    expect(page).to have_text("Amy Pond")
    expect(page).to have_text("Marty McFly")

    expect(page).to have_text("$10 off $20 of food")
    expect(page).to have_text("$30 of awesome for $10")
    expect(page).to have_text("$20 Sneakers for $5")

    expect(page).to have_text("987 Fake St")
    expect(page).to have_text("456 Unreal Rd")

    expect(page).to have_text("Bob's Pizza")
    expect(page).to have_text("Tom's Awesome Shop")
    expect(page).to have_text("Sneaker Store Emporium")

  end

  scenario "User uploads a csv file which create Purchasers" do
    visit(purchasers_path)

    expect(page).to have_text("Snake Plissken")
    expect(page).to have_text("Amy Pond")
    expect(page).to have_text("Marty McFly")

  end

  scenario "User uploads a csv file which create Items" do
    visit(items_path)

    expect(page).to have_text("$10 off $20 of food")
    expect(page).to have_text("$30 of awesome for $10")
    expect(page).to have_text("$20 Sneakers for $5")

  end

  scenario "User uploads a csv file which create Merchants" do
    visit(merchants_path)

    expect(page).to have_text("987 Fake St")
    expect(page).to have_text("456 Unreal Rd")

    expect(page).to have_text("Bob's Pizza")
    expect(page).to have_text("Tom's Awesome Shop")
    expect(page).to have_text("Sneaker Store Emporium")

  end
end