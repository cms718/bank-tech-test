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
    update_statement(transaction)
  end
  
  def withdraw(value)
    raise "Insufficient funds" if current_balance < value
    transaction = @transaction.create(-value)
    @transactions << transaction
    update_statement(transaction)
  end
  
  private
  
  def statement_header
    "date || credit || debit || balance"
  end
  
  def current_balance
    @statement.last ? @statement.last[:balance] : 0
  end

  def update_statement(transaction)
    @statement << { 
      date: transaction.created_at, 
      type: transaction.value > 0 ? "credit" : "debit",
      value: transaction.value, 
      balance: current_balance + transaction.value 
    }
  end
end
