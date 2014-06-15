module Spree
  class BankAccount < ActiveRecord::Base
    attr_accessor :bank_name
    attr_accessor :bank_branch
    attr_accessor :account_owner
    attr_accessor :account_number
    attr_accessor :short_code
    attr_accessor :swift_code

    validate :bank_name
    validate :bank_branch
    validate :account_owner
    validate :account_number
    scope :active, -> { where(active: true) }
  end
end
