require 'rails_helper'

RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe '.alphabetical' do

    it "return [] when there are no products" do
      products = Product.alphabetical

      expect(products).to eq []
    end

    it "returns [a] when there is only one product a" do
      # pending "hello man"
      a = Product.create!(name: "a")
      expect(Product.alphabetical).to eq [a]
    end

    it "returns [a,b,c] after I create 3 products c, b, a" do
      c = Product.create!(name: "c")
      b = Product.create!(name: "b")
      a = Product.create!(name: "a")
      expect(Product.alphabetical).to eq [a,b,c]
    end
  end

  describe '#discount_amount' do
    it "discount 41% when product price > 800,000 " do
      product = FactoryGirl.create(:product, price_vnd: 810000)

      expect(product.discount_amount).to eq 477900
    end
    it "discount 31% when product price > 200,000 " do
      product = FactoryGirl.create(:product, price_vnd: 400000)

      expect(product.discount_amount).to eq 276000
    end
    it "discount 21% when product price > 100,000 " do
      product = FactoryGirl.create(:product, price_vnd: 150000)

      expect(product.discount_amount).to eq 118500
    end
  end
end
