require 'transaction'

describe Transaction do
  before(:each) do
    time = class_double("Time", :now => "05/07/2021") 
    @transaction = Transaction.new(1000, time)    
  end
  
  describe '.value' do 
    it 'stores the value of the transaction' do
      expect(@transaction.value).to eq(1000)
    end
  end

  describe '.created_at' do
    it 'stores the date the transaction was created at' do
      expect(@transaction.created_at).to eq("05/07/2021")
    end
  end
end