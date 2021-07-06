# frozen_string_literal: true

class Transaction
  attr_reader :value, :created_at

  def initialize(value, time = Time)
    @value = value
    @created_at = time.now
  end

  def self.create(value)
    Transaction.new(value)
  end
end
