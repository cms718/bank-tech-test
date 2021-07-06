class StatementPrinter
  def self.run(statement)
    puts "date || credit || debit || balance"
    statement.each do |transaction|
        if transaction[:type] == "credit"
          puts "#{transaction[:date]} || #{transaction[:value]} || || #{transaction[:balance]}"
        else
          puts "#{transaction[:date]} || || #{transaction[:value]} || #{transaction[:balance]}"
        end
    end
  end
end