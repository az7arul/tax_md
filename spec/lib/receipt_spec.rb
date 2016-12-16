require_relative "../../lib/tax_md/receipt"


describe TaxMd::Receipt do
  
  describe "#cart_items" do
    
    it "should respond" do
      receipt = TaxMd::Receipt.new "test"
      expect(receipt).to respond_to(:cart_items)
    end
  end
  
  describe "#total_price_with_tax" do
    
    it "should sum all cart_items #price_with_tax" do
      CI = Struct.new(:price_with_tax)
      cart_items = [CI.new(1), CI.new(2)]
      receipt = TaxMd::Receipt.new cart_items
      expect(receipt.total_price_with_tax).to eq(3)
    end
  end
  
  describe "#total_tax_amount" do
    it "should sum all cart_items #tax_amount" do
      CI = Struct.new(:tax_amount)
      cart_items = [CI.new(1), CI.new(5)]
      receipt = TaxMd::Receipt.new cart_items
      expect(receipt.total_tax_amount).to eq(6)
    end
  end
end
