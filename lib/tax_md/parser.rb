require_relative "../../lib/tax_md/product"
require_relative "../../lib/tax_md/receipt"
require_relative "../../lib/tax_md/cart_item"
require_relative "../../helpers/number_helper"

module TaxMd
  module Parser

    extend self

    def self.generate_receipt_from file
      lines = lines_without_header file
      TaxMd::Receipt.new lines.map { |line| generate_cart_item_from line}
    end
    
    def lines_without_header file
      file.readlines.reject do |line|
        new_line = line.split(',')
        
        !TaxMd::Helpers.is_positive_integer?(new_line[0])
      end
    end
    
    def generate_cart_item_from line
      quantity, name, price = line.split(',')
      product = TaxMd::Product.new(price.to_f, name.strip)

      TaxMd::CartItem.new(product, quantity.to_i)
      
    end
    
  end
end