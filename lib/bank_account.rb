require './lib/transaction'

class BankAccount
  attr_reader :transactions

  def initialize(transaction=Transaction)
    @transactions = []
    @transaction = transaction
  end 
  
  def view_statement
    puts statement_header
  end

  def deposit(value)
    @transactions << @transaction.create(value)
  end

  def withdraw(value)
    @transactions << @transaction.create(-value)
  end

  private

  def statement_header
    "date || credit || debit || balance"
  end
end
