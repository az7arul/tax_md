module TaxMd
  class CartItem
    attr_accessor :product, :quantity

    def initialize(product, quantity)
      self.product = product
      self.quantity = quantity
    end

    def price_with_tax
      (product.price_with_tax * quantity).round(2)
    end
    
    def price_without_tax
      product.price * quantity
    end
    
    def tax_amount
      product.tax_amount * quantity
    end


    def name
      self.product.name
    end
  end
end
