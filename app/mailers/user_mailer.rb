class UserMailer < ApplicationMailer
  def order_confirmation(order)
    @order = order
    mail(to: @order.email, subject: "Order: #{@order.id}")
  end
end
