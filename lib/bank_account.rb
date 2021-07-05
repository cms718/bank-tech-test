class BankAccount 
  def view_statement
    puts statement_header
  end

  private

  def statement_header
    "date || credit || debit || balance"
  end
end
