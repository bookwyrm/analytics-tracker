class Account < ActiveRecord::Base
  belongs_to :account_owner, foreign_key: 'id', class_name: 'User'
end
