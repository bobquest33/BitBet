class Bet < ActiveRecord::Base
  validates :description, presence: true
  validates :you, presence: true, email: true
  validates :friend, presence: true, email: true
  validates :judge, presence: true, email: true

  def self.mark_paid!(address, value)
    mark_you_paid!(address, value) or mark_friend_paid!(address, value)
  end

  def email_judge
    if you_paid? && friend_paid?
      Mailer.email_judge(self).deliver
    end
  end

  private

  def self.mark_you_paid!(address, value)
    bet = where(your_address: address).first

    if bet
      bet.update(amount: value, you_paid: true)
    end
  end

  def self.mark_friend_paid!(address, value)
    bet = where(friend_address: address).first

    if bet
      bet.update(friend_paid: (bet.amount <= value))
      bet.email_judge
    end
  end
end
