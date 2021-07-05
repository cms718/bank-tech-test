class BankAccount
  attr_reader :transactions
  
  def initialize
    @transactions = []
  end 
  
  def view_statement
    puts statement_header
  end

  def deposit(amount)
    @transactions << { amount: amount, type: "credit" }
  end

  private

  def statement_header
    "date || credit || debit || balance"
  end
end
