# frozen_string_literal: true

class StatementPrinter
  def self.run(statement)
    puts 'date || credit || debit || balance'
    statement.reverse.each do |transaction|
      if transaction[:type] == 'credit'
        puts "#{transaction[:date].strftime('%d/%m/%Y')} || #{transaction[:value]} || || #{transaction[:balance]}"
      else
        puts "#{transaction[:date].strftime('%d/%m/%Y')} || || #{transaction[:value].abs} || #{transaction[:balance]}"
      end
    end
  end
end
