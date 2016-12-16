module TaxMd
  module Calculator
    module RingMdTaxCalculator
      
      TAX_EXEMPT_ITEMS = ["chocolate", "book", "pill"]
      IMPORT_TAX = 0.05
      SALES_TAX = 0.10
      ROUND_VALUE = 0.05
      
      
      
      def get_tax_rate
        
        rate = 0
        if self.name.include? "imported"
          rate += IMPORT_TAX
        end
        
        unless TAX_EXEMPT_ITEMS.any? { |product| self.name =~ /#{product}/ }
          rate += SALES_TAX
        end
        rate.round(2)
      end

      def tax_amount
        round(self.price * get_tax_rate).round(2)
      end

      def price_with_tax
        (self.price + tax_amount).round(2)
      end
      
      def round value
        ((value/0.05).ceil)*0.05
      end

    end
  end
end