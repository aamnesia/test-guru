class FeedbackMailer < ApplicationMailer

  default to: %{"TestGuru" <unistudy.anna@gmail.com>}

  def send_feedback(feedback)
    @name = feedback.name
    @email = feedback.email
    @body = feedback.body

    mail(from: @email)
  end

end
