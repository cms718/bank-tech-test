require 'bank_account'

describe BankAccount do
  describe ".view_statement" do
    context "for a new bank account" do
      it "displays an empty bank statement" do
        expect{ subject.view_statement }.to output("date || credit || debit || balance\n").to_stdout
      end
    end
  end
end
