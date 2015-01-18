class Order::OrderCreator

  def initialize(user_order_klass=UserOrder, user_order_item_klass=UserOrderItem)
    @user_order_klass = user_order_klass
    @user_order_item_klass = user_order_item_klass
  end

  def create(args)
    user_id = args[:user_id]
    items = args[:items] # [{:item_id => x,:qty => x},{...}]

    user_order = create_user_order(user_id)
    add_user_order_items(user_order, items)
  end

  private

  def create_user_order(user_id)
    order = @user_order_klass.create(user_id: user_id)
  end

  def add_user_order_items(user_order, items)
    user_order_items = []
    items.each do | i |
      user_order_items << @user_order_item_klass.new(user_order_id: user_order.id,
                                                     event_ticket_id: i.item_id,
                                                     quantity: i.quantity)
    end

    @user_order_item_klass.transaction do
      user_order_items.each do | u |
        u.save
      end
    end
  end

end
