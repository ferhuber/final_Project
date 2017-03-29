class CustomersMailer < ApplicationMailer

  def password_reset(customer)
    @customer = customer
    mail to: customer.email, subject: "Password reset"
  end
end
