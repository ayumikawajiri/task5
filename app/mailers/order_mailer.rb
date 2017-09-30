class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.send_when_order.subject
  #
  def send_when_order(order)
    @order = order
    mail to: order.orderemail,
    	 subject: 'ご注文を受け付けました'
  end
end
