class ContactAdmin < ActionMailer::Base
  default :from => "no-reply@#{ENV["DOMAIN"] || "siddick.com"}"

  def contact_us(contact)
    @contact = contact
    @admin   = AdminUser.first
    mail( :to => @admin.email, :subject => "Contacted by #{@contact.name}" )
  end
end
