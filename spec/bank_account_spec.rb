# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  describe '.deposit' do
    before(:each) do
      transaction = class_double('Transaction')
      @bank_account = BankAccount.new(transaction: transaction)
      mock_credit_transaction = double('Transaction', value: 1000, created_at: '01/01/2000')
      allow(transaction).to receive(:create).with(1000).and_return(mock_credit_transaction)
    end

    it 'adds a new transaction to transactions' do
      @bank_account.deposit(1000)
      expect(@bank_account.transactions.first.value).to eq(1000)
    end
  end

  describe '.withdraw' do
    before(:each) do
      # Long mocking to deposit credit transaction before making debit transaction
      transaction = class_double('Transaction')
      @bank_account = BankAccount.new(transaction: transaction)
      mock_credit_transaction = double('Transaction', value: 1000, created_at: '01/01/2000')
      mock_debit_transaction = double('Transaction', value: -1000, created_at: '01/01/2000')
      allow(transaction).to receive(:create).with(1000).and_return(mock_credit_transaction)
      @bank_account.deposit(1000)
      allow(transaction).to receive(:create).with(-1000).and_return(mock_debit_transaction)
    end

    it 'adds a new debit transaction' do
      @bank_account.withdraw(1000)
      expect(@bank_account.transactions[1].value).to eq(-1000)
    end

    it 'raises an error when balance is less than value to withdraw' do
      expect { @bank_account.withdraw(2000) }.to raise_error 'Insufficient funds'
    end
  end

  describe '.view_statement' do
    it 'calls run on the statement printer' do
      statement_printer = class_double('StatementPrinter')
      bank_account = BankAccount.new(statement_printer: statement_printer)
      expect(statement_printer).to receive(:run)
      bank_account.view_statement
    end
  end
end
