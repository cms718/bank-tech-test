require 'statement_printer'

describe StatementPrinter do
  describe '#run' do
    context "when not given empty statement" do
      it "displays only the headers" do
        expect { StatementPrinter.run([]) }.to output("date || credit || debit || balance\n").to_stdout
      end
    end
    context "for credit transactions" do
      it "prints the formatted statement with 1 transaction" do
        statement = [{ 
          date: Time.new(2000,"jan",1,20,15,1), 
          type: "credit",
          value: 1000.00, 
          balance: 1000.00 
          }]
          expected_result = "date || credit || debit || balance\n01/01/2000 || 1000.0 || || 1000.0\n"
          expect { StatementPrinter.run(statement) }.to output(expected_result).to_stdout
        end
        
        it "prints the formatted statement with 2 transactions" do
          statement = [{ 
            date: Time.new(2000,"jan",1,20,15,1), 
            type: "credit",
            value: 1000.00, 
            balance: 1000.00 
          },
          { 
            date: Time.new(2000,"jan",1,20,15,1), 
            type: "credit",
            value: 1000.00, 
            balance: 2000.00
          } 
        ]
        expected_result = "date || credit || debit || balance\n01/01/2000 || 1000.0 || || 1000.0\n01/01/2000 || 1000.0 || || 2000.0\n"
        expect { StatementPrinter.run(statement) }.to output(expected_result).to_stdout
      end
    end

    context "for debit transactions" do
      it "prints the formatted statement" do
        statement = [{ 
          date: Time.new(2000,"jan",1,20,15,1), 
          type: "credit",
          value: 1000.00, 
          balance: 1000.00 
        },
        { 
          date: Time.new(2000,"jan",1,20,15,1), 
          type: "debit",
          value: -500.00, 
          balance: 500.00
        } 
      ]
        expected_result = "date || credit || debit || balance\n01/01/2000 || 1000.0 || || 1000.0\n01/01/2000 || || 500.0 || 500.0\n"
        expect { StatementPrinter.run(statement) }.to output(expected_result).to_stdout
      end
    end
  end
end