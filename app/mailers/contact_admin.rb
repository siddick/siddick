class ContactAdmin < ActionMailer::Base
  default from: "from@example.com"

  def contact_us(contact)
    @contact = contact
    @admin   = AdminUser.first
    mail( :to => @admin.email, :subject => "Contacted by #{@contact.name}" )
  end
end
