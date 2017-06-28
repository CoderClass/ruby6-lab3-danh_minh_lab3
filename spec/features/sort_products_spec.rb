require 'rails_helper'

RSpec.feature "SortProducts", type: :feature do
  # pending "add some scenarios (or delete) #{__FILE__}"

  def hat_links
    page.all(:css, 'h4.product-name a').map(&:text)
  end

  scenario 'visit the home page' do
    product1 = FactoryGirl.create(:product, name: "Brad's Hat")
    product2 = FactoryGirl.create(:product, name: "Adam's Hat")

    visit root_path

    expect(hat_links).to eq ["Brad's Hat", "Adam's Hat"]

    click_link "Sort by Alphabetical"

    expect(current_url).to eq root_url(sort: "alphabetical")

    expect(hat_links).to eq ["Adam's Hat", "Brad's Hat"]
  end
end
