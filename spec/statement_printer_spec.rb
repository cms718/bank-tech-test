require 'statement_printer'

describe StatementPrinter do
  describe '#run' do
    context "when not given empty statement" do
      it "displays only the headers" do
        expect { subject.run([]) }.to output("date || credit || debit || balance\n").to_stdout
      end
    end
  end
end