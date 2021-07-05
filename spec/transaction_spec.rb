require 'transaction'

describe Transaction do
  before(:each) do
    @transaction = Transaction.new(1000, "debit")    
  end
  
  describe '.amount' do 
    it 'stores the value of the transaction' do
      expect(@transaction.amount).to eq(1000)
    end
  end
  
  describe '.type' do
    it 'stores either credit or debit' do
      expect(@transaction.type).to eq("debit")
    end
  end
end