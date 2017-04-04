class OrdersMailer < ApplicationMailer

  def submit_order(order)

    @order = order
    mail to: order.customer.email, subject: "New Order"
  end
end
