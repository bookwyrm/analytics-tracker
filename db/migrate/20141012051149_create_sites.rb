class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.references :account, index: true
      t.string :domain_name

      t.timestamps
    end
  end
end
