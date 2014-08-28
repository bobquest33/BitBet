class Bet < ActiveRecord::Base
  validates :description, presence: true
  validates :amount, presence: true
  validates :you, presence: true
  validates :friend, presence: true
  validates :judge, presence: true
end
