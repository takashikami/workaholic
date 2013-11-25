class OverworkMailer < ActionMailer::Base
  default from: "takashi.kami@sii.co.jp"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.overwork_mailer.hello.subject
  #
  def create(subject, ow)
    @overwork = ow
    mail subject: subject,
         from: ow.user.email,
         to: ow.user.bosses.map{|boss| boss.email},
         bcc: ow.user.email

  end
end
