require './lib/transaction'

class BankAccount
  attr_reader :transactions, :statement

  def initialize(transaction=Transaction)
    @transactions = []
    @transaction = transaction
    @statement = []
  end 
  
  def view_statement
    puts statement_header
  end

  def deposit(value)
    transaction = @transaction.create(value)
    @transactions << transaction
    @statement << { date: transaction.created_at, type: "credit", value: value, balance: value }
  end

  def withdraw(value)
    @transactions << @transaction.create(-value)
  end

  private

  def statement_header
    "date || credit || debit || balance"
  end
end
