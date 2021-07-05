require 'transaction'

describe Transaction do
  describe '.amount' do 
    it 'stores the value of the transaction' do
      transaction = Transaction.new(1000, "debit")
      expect(transaction.amount).to eq(1000)
    end
  end
  
  describe '.type' do
    it 'stores either credit or debit' do
      transaction = Transaction.new(1000, "debit")
      expect(transaction.type).to eq("debit")
    end
  end
end