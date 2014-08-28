class Bet < ActiveRecord::Base
  validates :description, presence: true
  validates :amount, presence: true, format: /\A\d*\.{0,1}\d*\z/
  validates :you, presence: true
  validates :friend, presence: true
  validates :judge, presence: true, email: true
end
