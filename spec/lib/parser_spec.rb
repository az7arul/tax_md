require_relative '../../lib/tax_md/parser'
require_relative '../../lib/tax_md/cart_item'

describe TaxMd::Parser do
  describe "#generate_receipt_from" do
    it "should exist" do
      expect(TaxMd::Parser).to respond_to(:generate_receipt_from)
    end
  end
  
  describe "#lines_without_header" do

    let(:file) { double("file") }
    
    it "should exist" do
      expect(TaxMd::Parser).to respond_to(:lines_without_header)
    end
    
    it "should remove header line from array" do
      file.stub(:readlines) { ['Quantity, Product, Price', '1, imported box of chocolates, 10.00', '1, bottle of perfume, 18.99']}
      expect(TaxMd::Parser.lines_without_header(file).length).to be 2
    end
    
    it "should remove a line if quantity is zero" do
      file.stub(:readlines) { ['Quantity, Product, Price', '0, imported box of chocolates, 10.00', '1, bottle of perfume, 18.99']}
      expect(TaxMd::Parser.lines_without_header(file).length).to be 1
    end
  end
  
  describe "#generate_cart_item_from" do
    
    
    it "should exist" do
      expect(TaxMd::Parser).to respond_to(:generate_cart_item_from)
    end
    
    it "should return a cart item from valid line" do
      line = '1, imported box of chocolates, 10.00'
      expect(TaxMd::Parser.generate_cart_item_from(line).class).to be TaxMd::CartItem
    end
    
    it "should set proper product name for TaxMd::CartItem" do
      line1 = '1, book, 10.00'
      line2 = '1, imported book, 10.00'
      line3 = '1, imported box of chocolates, 10.00'

      expect(TaxMd::Parser.generate_cart_item_from(line1).product.name).to  eq("book")
      expect(TaxMd::Parser.generate_cart_item_from(line2).product.name).to  eq("imported book")
      expect(TaxMd::Parser.generate_cart_item_from(line3).product.name).to  eq("imported box of chocolates")
    end
    
    it "should set proper product price for TaxMd::CartItem" do
      line1 = '1, book, 10.00'
      line2 = '1, imported book, 12.99'
      line3 = '1, imported box of chocolates, 14.00'

      expect(TaxMd::Parser.generate_cart_item_from(line1).product.price).to  eq(10.00)
      expect(TaxMd::Parser.generate_cart_item_from(line2).product.price).to  eq(12.99)
      expect(TaxMd::Parser.generate_cart_item_from(line3).product.price).to  eq(14.00)
    end
    
    it "should set proper quantity for TaxMd::CartItem" do
      line1 = '3, book, 10.00'
      line2 = '1, imported book, 10.00'
      line3 = '6, imported box of chocolates, 10.00'

      expect(TaxMd::Parser.generate_cart_item_from(line1).quantity).to be 3
      expect(TaxMd::Parser.generate_cart_item_from(line2).quantity).to be 1
      expect(TaxMd::Parser.generate_cart_item_from(line3).quantity).to be 6
    end
  end
end