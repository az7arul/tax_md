module TaxMd
  module Presenter
    class StdoutPresenter
      attr_accessor :receipt
      
      def initialize receipt
        self.receipt = receipt
      end
      
      def print_line_item_with_tax
        receipt.cart_items.each do |item|
          puts "#{item.quantity}, #{item.name}, #{'%.02f' % item.price_with_tax}"
        end
      end
      
      def print_info
        print_line_item_with_tax
        puts ""
        puts "Sales Tax: #{'%.02f' % receipt.total_tax_amount}"
        puts "Total: #{'%.02f' % receipt.total_price_with_tax}"
      end
      
    end
  end
end