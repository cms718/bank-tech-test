class StatementPrinter
  def self.run(statement)
    puts "date || credit || debit || balance"
    statement.each do |transaction|
        puts "#{transaction[:date]} || #{transaction[:value]} || || #{transaction[:balance]}"
    end
  end
end