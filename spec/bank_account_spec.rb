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
      # TODO Need to mock transaction class.
      subject.deposit(1000)
      expect(subject.transactions.first.type).to eq("credit")
    end
  end
  describe ".withdraw" do
    it "adds a new debit transaction" do
      subject.deposit(1000)
      subject.withdraw(500)
      expect(subject.transactions.last.type).to eq("debit")
    end
  end
end
