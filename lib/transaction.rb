class Transaction
  attr_reader :amount, :type, :created_at

  def initialize(amount, type, time=Time)
    @amount = amount
    @type = type
    @created_at = time.now
  end
end