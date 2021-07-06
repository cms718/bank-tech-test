require 'bank_account'

describe BankAccount do
  # TODO move test to a StatementPrinter - formats etc
  describe ".view_statement" do
    context "for a new bank account" do
      it "displays an empty bank statement" do
        expect { subject.view_statement }.to output("date || credit || debit || balance\n").to_stdout
      end
    end
  end

  describe ".deposit" do
    
    before(:each) do
      transaction = class_double("Transaction")
      bank_account = BankAccount.new(transaction)
      mock_new_transaction = double("Transaction", :value => 1000)
      allow(transaction).to receive(:create).with(1000).and_return(mock_new_transaction)
    end
    
    it "adds a new transaction to transactions" do
      subject.deposit(1000)
      expect(subject.transactions.first.value).to eq(1000)
    end
  end

  describe ".withdraw" do
    it "adds a new debit transaction" do
      transaction = class_double("Transaction")
      bank_account = BankAccount.new(transaction)
      expect(transaction).to receive(:create).with(-500)
      bank_account.withdraw(500)
    end
  end
end
