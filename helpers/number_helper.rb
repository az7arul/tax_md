module TaxMd
  module Helpers
    
    extend self
    
    def is_positive_integer? value
      true if Integer(value) && value.to_i > 0 rescue false
    end
  end
end