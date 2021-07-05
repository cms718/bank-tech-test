require 'bank_account'

describe BankAccount do
  describe ".view_statement" do
    context "for a new bank account" do
      it "displays an empty bank statement" do
        expect{ subject.view_statement }.to output("date || credit || debit || balance\n").to_stdout
      end
    end
  end
  describe ".deposit" do
    it "creates a new transaction" do
      subject.deposit(1000)
      expect(subject.transactions.length).to eq(1)
    end
  end
end
