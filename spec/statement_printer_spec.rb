require 'statement_printer'

describe StatementPrinter do
  describe '#run' do
    context "when not given empty statement" do
      it "displays only the headers" do
        expect { StatementPrinter.run([]) }.to output("date || credit || debit || balance\n").to_stdout
      end
    end

    it "prints the formatted statement with 1 transaction" do
      statement = [{ 
        date: "01/01/2000", 
        type: "credit",
        value: 1000.00, 
        balance: 1000.00 
      }]
      expected_result = "date || credit || debit || balance\n01/01/2000 || 1000.0 || || 1000.0\n"
      expect { StatementPrinter.run(statement) }.to output(expected_result).to_stdout
    end
  end
end