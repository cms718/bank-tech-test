# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  describe 'feature test' do
    it 'works correctly' do
      # TODO: format to 2 decimal places
      subject.deposit(1000)
      subject.deposit(2000)
      subject.withdraw(500)
      expect { subject.view_statement }
        .to output("date || credit || debit || balance\n08/07/2021 || || 500.00 || 2500.00\n08/07/2021 || 2000.00 || || 3000.00\n08/07/2021 || 1000.00 || || 1000.00\n")
        .to_stdout
    end
  end
end
