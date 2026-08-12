ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :date_of_purchase, :delivery_address, :order_total_at_purchase
  #
  # or
  #
  # permit_params do
  #   permitted = [:date_of_purchase, :delivery_address, :order_total_at_purchase]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

# config.filters = false
  show do
    attributes_table do
      row :id
      row :customer
      row :delivery_address
      row :order_total_at_purchase
      row :date_of_purchase
    end

    panel "Items Ordered (Line Items)" do
      table_for order.line_items do
        column :title
        column :quantity
        column :total_price
      end
    end
  end
end
