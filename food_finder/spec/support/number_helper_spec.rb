# encoding: UTF-8

describe 'NumberHelper' do

  include NumberHelper
  
  describe '#number_to_currency' do
    
    context 'using default values' do
      
      it "correctly formats an integer"
      
      it "correctly formats a float"

      it "correctly formats a string"
      
      it "uses delimiters for very large numbers"

      it "does not have delimiters for small numbers"

    end
    
    context 'using custom options' do
      
      it 'allows changing the :unit'

      it 'allows changing the :precision'
      
      it 'omits the separator if :precision is 0'
      
      it 'allows changing the :delimiter'
      
      it 'allows changing the :separator'
            
      it 'correctly formats using multiple options'
      
    end
    
  end
  
end
