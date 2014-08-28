class Bet < ActiveRecord::Base
  validates :description, presence: true
  validates :you, presence: true, email: true
  validates :friend, presence: true, email: true
  validates :judge, presence: true, email: true

  after_create :make_addresses, :email_qrs
  after_update :send_money

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
    bet = where(you_address: address).first

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

  def make_addresses
    if GUID && MAIN_PASSWORD
      { you_address: you, friend_address: friend }.each do |addr_column, person|
        response = Net::HTTP.post_form(
          URI("https://blockchain.info/merchant/#{GUID}/new_address"),
          "password" => MAIN_PASSWORD, "label" => person)

        case response
        when Net::HTTPSuccess
          addr = JSON.parse(response.body)

          if addr["error"]
            raise addr["error"]
          end

          update(addr_column => addr["address"])
        else
          raise "Net::HTTP"
        end
      end
    end
  end

  def email_qrs
    if you_address && friend_address
      Mailer.send_qr(self, :you).deliver
      Mailer.send_qr(self, :friend).deliver
    end
  end

  def send_money
    if money_unsent?
      raise "to implement: Bet#send_money"
    end
  end
end
