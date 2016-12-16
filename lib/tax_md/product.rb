require_relative "../tax_md/calculator"

module TaxMd
  class Product
    
    include TaxMd::Calculator::RingMdTaxCalculator
    
    attr_accessor :price, :name
    
    def initialize(price, name)
      self.price = price
      self.name = name
    end
    
  end
end