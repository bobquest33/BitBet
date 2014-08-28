class Mailer < ActionMailer::Base
  default from: "admin@betyourbit.com"

  def email_judge(bet)
    @bet = bet
    mail(to: bet.judge, subject: "Settle a bet")
  end
end
