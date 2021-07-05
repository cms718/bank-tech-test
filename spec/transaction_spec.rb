require 'transaction'

describe Transaction do
  describe '.amount' do 
    it 'stores the value of the transaction' do
      transaction = Transaction.new(1000)
      expect(transaction.amount).to eq(1000)
    end
  end
end