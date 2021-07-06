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
      @bank_account = BankAccount.new(transaction)
      mock_credit_transaction = double("Transaction", :value => 1000, :created_at => "01/01/2000")
      allow(transaction).to receive(:create).with(1000).and_return(mock_credit_transaction)
    end
    
    it "adds a new transaction to transactions" do
      @bank_account.deposit(1000)
      expect(@bank_account.transactions.first.value).to eq(1000)
    end

    it "updates the statement with the new transaction" do
      @bank_account.deposit(1000)
      expect(@bank_account.statement.first[:balance]).to eq(1000)
    end
    
    it "updates the statements balance after multiple deposits" do
      @bank_account.deposit(1000)
      @bank_account.deposit(1000)
      expect(@bank_account.statement.last[:balance]).to eq(2000)
    end
  end

  describe ".withdraw" do

    before(:each) do
      # Long mocking to deposit credit transaction before making debit transaction
      transaction = class_double("Transaction")
      @bank_account = BankAccount.new(transaction)
      mock_credit_transaction = double("Transaction", :value => 1000, :created_at => "01/01/2000")
      mock_debit_transaction = double("Transaction", :value => -1000, :created_at => "01/01/2000")
      allow(transaction).to receive(:create).with(1000).and_return(mock_credit_transaction)
      @bank_account.deposit(1000)
      allow(transaction).to receive(:create).with(-1000).and_return(mock_debit_transaction)
    end

    it "adds a new debit transaction" do
      @bank_account.withdraw(1000)
      expect(@bank_account.transactions[1].value).to eq(-1000)
    end

    it "raises an error when balance is less than value to withdraw" do
      expect { @bank_account.withdraw(2000) }.to raise_error "Insufficient funds"
    end

    it "reduces the total balance from the statement" do
      @bank_account.withdraw(1000)
      expect(@bank_account.statement.last[:balance]).to eq(0)
    end

    it "adds a new debit transaction to the statement" do
      @bank_account.withdraw(1000)
      expect(@bank_account.statement.last[:type]).to eq("debit")
    end
  end
end
