class Mailer < ActionMailer::Base
  default from: "admin@betyourbit.com"

  def email_judge(bet)
    @bet = bet
    mail(to: bet.judge, subject: "Settle a bet")
  end

  def send_qr(bet, person)
    @bet = bet
    @person = person
    mail(to: bet.send(person), subject: "Pay for your bet")
  end
end
