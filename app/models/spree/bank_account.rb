module Spree
  class BankAccount < ActiveRecord::Base
    validates :bank_name
    validates :bank_branch
    validates :account_owner
    validates :account_number
    scope :active, -> { where(active: true) }
  end
end
