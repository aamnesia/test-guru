class FeedbackMailer < ApplicationMailer

  default to: %{"TestGuru" <unistudy.anna@gamil.com>}

  def send_feedback(feedback)
    @name = feedback.name
    @email = feedback.email
    @body = feedback.body

    mail(from: @email)
  end

end
