class CreateAnalyticsEntries < ActiveRecord::Migration
  def change
    create_table :analytics_entries do |t|
      t.references :site, index: true
      t.string :url
      t.string :user_agent

      t.timestamps
    end
  end
end
