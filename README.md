## About The Project

Emulates a basic banking system where a user can deposit, withdraw, and view their bank statement. A deposit and withdrawal generates a new transaction with a value decided by the user. The date of the transaction is generated automatically. A bank statement can be passed to the StatementPrinter, which is responsible for formatting and printing to the terminal.

No overdraft is setup so a withdrawal is rejected if there are insufficient funds.

## Specification

### Requirements

- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

### Installation

1. Clone the repo
   ```
   git clone https://github.com/cms718/bank-tech-test
   ```
2. cd into directory then:
   ```
   bundle install
   ```

## Usage

```rb
require './lib/bank_account.rb'
bank = BankAccount.new
bank.deposit(5000)
bank.deposit(5000)
bank.withdraw(6500)
bank.view_statement
date || credit || debit || balance
06/07/2021 || || 6500 || 3500
06/07/2021 || 5000 || || 10000
06/07/2021 || 5000 || || 5000
```

## Testing

```
rspec
```
