require "spec_helper"

feature "Purchase management" do
  before(:each) do
    visit "/purchases/new"
    attach_file "purchase_csv", Rails.root.join('spec', 'fixtures', 'example_input.tab')
    click_button "Create Purchase(s)"
  end

  scenario "User uploads a csv file" do
    expect(page).to have_text("Purchase(s) were successfully created. Total Revenue: $95.00")

    expect(page).to have_text("4 records found")
    
    expect(page).to have_text("Snake Plissken",:count => 2)
    expect(page).to have_text("Amy Pond",:count => 1)
    expect(page).to have_text("Marty McFly",:count => 1)

    expect(page).to have_text("$10 off $20 of food",:count => 1)
    expect(page).to have_text("$30 of awesome for $10",:count => 1)
    expect(page).to have_text("$20 Sneakers for $5",:count => 2)

    expect(page).to have_text("123 Fake St",:count => 2)
    expect(page).to have_text("987 Fake St",:count => 1)
    expect(page).to have_text("456 Unreal Rd",:count => 1)

    expect(page).to have_text("Bob's Pizza",:count => 1)
    expect(page).to have_text("Tom's Awesome Shop",:count => 1)
    expect(page).to have_text("Sneaker Store Emporium",:count => 2)

  end

  scenario "User uploads a csv file which create Purchasers" do
    visit(purchasers_path)

    expect(page).to have_text("Snake Plissken",:count => 1)
    expect(page).to have_text("Amy Pond",:count => 1)
    expect(page).to have_text("Marty McFly",:count => 1)

  end

  scenario "User uploads a csv file which create Items" do
    visit(items_path)

    expect(page).to have_text("$10 off $20 of food")
    expect(page).to have_text("$30 of awesome for $10")
    expect(page).to have_text("$20 Sneakers for $5")

  end

  scenario "User uploads a csv file which create Merchants" do
    visit(merchants_path)

    expect(page).to have_text("987 Fake St",:count => 1)
    expect(page).to have_text("456 Unreal Rd",:count => 1)

    expect(page).to have_text("Bob's Pizza",:count => 1)
    expect(page).to have_text("Tom's Awesome Shop",:count => 1)
    expect(page).to have_text("Sneaker Store Emporium",:count => 1)

  end
end