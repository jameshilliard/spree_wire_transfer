module Spree
  class BankAccount < ActiveRecord::Base
    validates :bank_name, presence: true
    validates :bank_branch, presence: true
    validates :account_owner, presence: true
    validates :account_number, presence: true
    scope :active, -> { where(active: true) }
  end
end
