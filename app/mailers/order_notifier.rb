class OrderNotifier < ApplicationMailer
default from: '<firstshop_rails4@example.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order
    mail to: order.email, subject: 'Подтверждение заказа в firstshop_rails4'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
  @order = order
  mail to: order.email, subject: 'Заказ из firstshop_rails4 отправлен'
  end
end
