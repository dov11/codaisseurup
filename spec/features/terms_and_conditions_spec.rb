require "rails_helper"

describe "Terms page" do
  it "shows info about t&s" do
    visit root_url
    click_on "Terms and Conds"
    expect(page).to have_content "This application is free to use by anybody"
  end
end
