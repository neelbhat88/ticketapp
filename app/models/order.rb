class Order
  attr_reader :id, :user, :items, :total_price

  def initialize(args)
    @id = args[:id]
    @user = args[:user]
    @items = args[:items]
    @total_price = calculate_total()
  end

  def calculate_total

  end

  # def build(args)
  #   user_order_id = args[:user_order_id]
  #
  #
  # end

end


#UserOrder - id, user_id
#UserOrderItems - id, user_order_id, event_ticket_id, quantity
