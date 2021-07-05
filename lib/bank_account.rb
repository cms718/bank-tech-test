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

  def deposit(amount)
    @transactions << @transaction.new(amount, "credit")
  end

  def withdraw(amount)
    @transactions << @transaction.new(amount, "debit")
  end

  private

  def statement_header
    "date || credit || debit || balance"
  end
end
