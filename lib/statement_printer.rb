# frozen_string_literal: true

class StatementPrinter
  def self.run(transactions)
    balance = 0
    statement = []

    transactions.each do |transaction|
      balance += transaction.value
      if transaction.value > 0
        statement << 
        "#{transaction.created_at.strftime('%d/%m/%Y')} || #{self.format(transaction.value)} || || #{self.format(balance)}\n"
      else
        statement << 
        "#{transaction.created_at.strftime('%d/%m/%Y')} || || #{self.format(transaction.value.abs)} || #{self.format(balance)}\n"
      end
    end

    puts 'date || credit || debit || balance'
    puts statement.reverse.join if statement.any?
  end

  def self.format(num)
    '%.2f' % num
  end
end
