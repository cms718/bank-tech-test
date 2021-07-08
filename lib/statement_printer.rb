# frozen_string_literal: true

class StatementPrinter
  class << self
    def run(transactions)
      balance = 0
      statement = []
  
      transactions.each do |transaction|
        balance += transaction.value
        if transaction.value > 0
          statement << "#{transaction.created_at.strftime('%d/%m/%Y')} || #{transaction.value} || || #{balance}\n"
        else
          statement << "#{transaction.created_at.strftime('%d/%m/%Y')} || || #{transaction.value.abs} || #{balance}\n"
        end
      end
      
      puts 'date || credit || debit || balance'
      puts statement.reverse.join if statement.any?
    end
  end
end
