module Spree
  class BankAccount < ActiveRecord::Base
    attr_accessible \
      :bank_name,
      :bank_branch,
      :account_owner,
      :account_number,
      :short_code,
      :swift_code

    validates \
      :bank_name,
      :bank_branch,
      :account_owner,
      :account_number, presence: true
    validates \
      :account_number,
      numericality: { only_integer: true },
      uniqueness:   { scope: :bank_name }

    scope :active, -> { where(active: true) }
  end
end
