class Site < ActiveRecord::Base
  belongs_to :account
  has_many :anlaytics_entries
end
