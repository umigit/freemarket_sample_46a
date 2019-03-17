class MoneyTransactionRecord < ApplicationRecord
  belongs_to :user, optional: true
end
