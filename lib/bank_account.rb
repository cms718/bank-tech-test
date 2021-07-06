# frozen_string_literal: true

require './lib/transaction'
require './lib/statement_printer'

class BankAccount
  attr_reader :transactions, :statement

  def initialize(transaction: Transaction, statement_printer: StatementPrinter)
    @transactions = []
    @transaction = transaction
    @statement = []
    @statement_printer = statement_printer
  end

  def view_statement
    @statement_printer.run(@statement)
  end

  def deposit(value)
    transaction = @transaction.create(value)
    @transactions << transaction
    update_statement(transaction)
  end

  def withdraw(value)
    raise 'Insufficient funds' if current_balance < value

    transaction = @transaction.create(-value)
    @transactions << transaction
    update_statement(transaction)
  end

  private

  def current_balance
    @statement.last ? @statement.last[:balance] : 0
  end

  def update_statement(transaction)
    @statement << {
      date: transaction.created_at,
      type: transaction.value.positive? ? 'credit' : 'debit',
      value: transaction.value,
      balance: current_balance + transaction.value
    }
  end
end
