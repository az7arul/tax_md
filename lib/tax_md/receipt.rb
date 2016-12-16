
module TaxMd
  class Receipt
    attr_accessor :cart_items
    
    def initialize cart_items
      self.cart_items = cart_items
    end
    
    def total_price_with_tax
      self.cart_items.map { |item| item.price_with_tax }.reduce(0) {|sum, i| sum += i}
    end
    
    def total_tax_amount
      self.cart_items.map {|item| item.tax_amount}.reduce(0) {|sum, i| sum += i}
    end
  end
end