class StatementPrinter
  def self.run(statement)
    puts "date || credit || debit || balance"
    if statement.any?
      puts "#{statement[0][:date]} || #{statement[0][:value]} || || #{statement[0][:balance]}"
    end
  end
end