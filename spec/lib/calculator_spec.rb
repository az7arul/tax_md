require_relative '../../lib/tax_md/calculator'
require_relative '../../lib/tax_md/product'

describe TaxMd::Calculator::RingMdTaxCalculator do
  describe "#get_tax_rate" do
    it "should return 10% for non-imported non exempt goods" do
      product = TaxMd::Product.new(2, "perfume")
      expect(product.get_tax_rate).to eq(0.10)
    end
    
    it "should return 15% for imported non-exempt goods" do
      product = TaxMd::Product.new(2, "imported perfume")
      expect(product.get_tax_rate).to eq(0.15)
    end
    
    it "should return 5% for exempt imported goods " do
      product = TaxMd::Product.new(2, "imported book")
      expect(product.get_tax_rate).to eq(0.05)
    end

    it "should return 0% for exempt non-imported goods " do
      product = TaxMd::Product.new(2, "book")
      expect(product.get_tax_rate).to eq(0)
    end
  end

  describe "tax calculation" do
    
    let(:product1) { TaxMd::Product.new(12.49, "book") }
    let(:product2) { TaxMd::Product.new(14.99, "music cd") }

    describe "#tax_amount" do
      it "should return correct values" do
        expect(product1.tax_amount).to eq(0)
        expect(product2.tax_amount).to eq(1.5)
      end
    end


    describe "#price_with_tax" do
      it "should return correct values" do
        expect(product1.price_with_tax).to eq(12.49)
        expect(product2.price_with_tax).to eq(16.49)
      end
    end
  end
end