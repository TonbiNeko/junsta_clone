class ConfirmMailer < ApplicationMailer

  def confirm_mail(user)
    @user = user
    mail to: user.email, subject: '投稿確認メール'
  end
end
