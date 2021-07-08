# frozen_string_literal: true

require 'statement_printer'

describe StatementPrinter do
  describe '#run' do
    before(:each) do
      @mock_credit_transaction = double('Transaction', value: 1000, created_at: Time.new(2000, 1, 1))
      @mock_debit_transaction = double('Transaction', value: -500, created_at: Time.new(2000, 1, 1))
    end

    context 'when given empty transactions' do
      it 'displays only the headers' do
        expect { StatementPrinter.run([]) }
        .to output("date || credit || debit || balance\n").to_stdout
      end
    end

    context 'for credit transactions' do
      it 'prints the formatted statement with 1 transaction' do
        expected_result = "date || credit || debit || balance\n01/01/2000 || 1000.0 || || 1000.0\n"
        transactions = [@mock_credit_transaction] 
        expect { StatementPrinter.run(transactions) }.to output(expected_result).to_stdout
      end

      it 'prints the formatted statement with 2 transactions' do
        transactions = [@mock_credit_transaction, @mock_credit_transaction]
        expected_result = "date || credit || debit || balance\n01/01/2000 || 1000.0 || || 2000.0\n01/01/2000 || 1000.0 || || 1000.0\n"
        expect { StatementPrinter.run(transactions) }.to output(expected_result).to_stdout
      end
    end

    context 'for debit transactions' do
      it 'prints the formatted statement' do
        transactions = [@mock_credit_transaction, @mock_debit_transaction]
        expected_result = "date || credit || debit || balance\n01/01/2000 || || 500.0 || 500.0\n01/01/2000 || 1000.0 || || 1000.0\n"
        expect { StatementPrinter.run(transactions) }.to output(expected_result).to_stdout
      end
    end
  end
end
