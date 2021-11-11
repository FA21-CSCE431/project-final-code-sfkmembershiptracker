class ContactForm < MailForm::Base
    attribute :name, validate: true
    # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
    attribute :email, validate: true
    attribute :message
  
    # Declare the e-mail headers. It accepts anything the mail method
    # in ActionMailer accepts.
    def headers
      {
        subject: "SFK Inquiry",
        to: "sfk.website.431@gmail.com",
        from: %("#{name}" <#{email}>)
      }
    end
end
