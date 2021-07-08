# frozen_string_literal: true

require './lib/transaction'
require './lib/statement_printer'

class BankAccount
  attr_reader :transactions, :statement

  def initialize(transaction: Transaction, statement_printer: StatementPrinter)
    @transactions = []
    @transaction_class = transaction
    @statement_printer = statement_printer
  end

  def view_statement
    @statement_printer.run(@transactions)
  end

  def deposit(value)
    transaction = @transaction_class.create(value)
    @transactions << transaction
  end

  def withdraw(value)
    raise 'Insufficient funds' if current_balance < value

    transaction = @transaction_class.create(-value)
    @transactions << transaction
  end

  private

  def current_balance
    balance = 0
    @transactions.each { |transaction| balance += transaction.value }
    balance
  end
end
