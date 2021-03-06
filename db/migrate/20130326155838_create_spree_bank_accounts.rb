class CreateSpreeBankAccounts < ActiveRecord::Migration
  def change
    create_table :spree_bank_accounts do |t|
      t.string :bank_name
      t.string :bank_branch
      t.string :account_owner
      t.integer :account_number
      t.boolean :active, default: false
      t.timestamps
    end
  end
end
