require_relative "../../lib/tax_md/cart_item"
require_relative "../../lib/tax_md/product"

describe TaxMd::CartItem do

  describe "#name" do

    it "should return product name" do
      product = TaxMd::Product.new(2, "book")
      ci = TaxMd::CartItem.new(product, 3)
      expect(ci.name).to eq('book')
    end
  end
  
end