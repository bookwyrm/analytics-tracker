class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :company_name
      t.string :primary_timezone
      t.references :account_owner, index: true

      t.timestamps
    end
  end
end
