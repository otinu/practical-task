class DailyMailer < ApplicationMailer
    def daily_send(email)
        default to: -> { User.pluck(:email) }
        mail(subject: "Good morning! This is the Daily-Mail!")
    end
end