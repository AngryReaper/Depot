require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Подтверждение заказа", mail.subject
    assert_equal ["angryreaper@gmail.com"], mail.to
    assert_equal ["perfilkinv@gmail.com"], mail.from
    assert_match /1 x Programming Ruby 1.9 & 2.0/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "Заказ отправлен", mail.subject
    assert_equal ["angryreaper@gmail.com"], mail.to
    assert_equal ["perfilkinv@gmail.com"], mail.from
    assert_match /<td>1&times;<\/td>\s*<td>Programming Ruby 1.9 & 2.0<\/td>/, 
    mail.body.encoded
  end

end
