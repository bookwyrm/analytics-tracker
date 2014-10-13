class Site < ActiveRecord::Base
  belongs_to :account
  has_many :analytics_entries
end
