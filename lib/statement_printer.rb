class StatementPrinter
  def run(statement)
    puts statement_header
  end

  private

  def statement_header
    "date || credit || debit || balance"
  end
end