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
    it "adds a new transaction to transactions" do
      subject.deposit(1000)
      expect(subject.transactions.length).to eq(1)
    end
    it "creates a new credit transaction" do
      transaction = class_double("Transaction")
      bank_account = BankAccount.new(transaction)
      expect(transaction).to receive(:create).with(1000, "credit")
      bank_account.deposit(1000)
    end
  end
  describe ".withdraw" do
    it "adds a new debit transaction" do
      transaction = class_double("Transaction")
      bank_account = BankAccount.new(transaction)
      expect(transaction).to receive(:create).with(500, "debit")
      bank_account.withdraw(500)
    end
  end
end
