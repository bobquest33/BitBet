class Bet < ActiveRecord::Base
  validates :description, presence: true
  validates :amount, presence: true, numericality: true
  validates :you, presence: true, email: true
  validates :friend, presence: true, email: true
  validates :judge, presence: true, email: true

  # 72819           => 7281900000000
  # 72.189012       => 7218901200
  # .789123890      => 78912389
  # 0.7891238901238 => 78912389
  def amount=(btc)
    write_attribute(:amount, (btc.to_f * 10**8).floor)
  end
end
