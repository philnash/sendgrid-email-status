class MessageMailer < ApplicationMailer
  def email
    @message = params[:message]
    mail(
      to: @message.to,
      subject: @message.subject,
      from: ENV['FROM_EMAIL'],
      custom_args: {
        id: @message.id
      }
    )
  end
end
