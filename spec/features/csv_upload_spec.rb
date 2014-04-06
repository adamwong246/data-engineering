require "spec_helper"

feature "Purchase management" do
  scenario "User uploads a csv file" do
    visit "/purchases/new"

    attach_file "purchase_csv", Rails.root.join('spec', 'fixtures', 'example_input.tab')
    click_button "Create Purchase(s)"

    expect(page).to have_text("Purchase(s) were successfully created.")
  end
end