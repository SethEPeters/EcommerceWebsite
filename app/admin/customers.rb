ActiveAdmin.register Customer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :first_name, :last_name, :province, :street_address
  #
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :province, :street_address]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  show do
    attributes_table do
      row :id
      row :created_at
      row :first_name
      row :last_name
      row :province
      row :street_address
      row :updated_at
      row :email
    end

    orders = Order.where( email: resource.email)
    orders.each do |order|
      panel "Items Ordered (Line Items)" do
        table_for order.line_items do
          column "Item" do |line_item|
            line_item.item.title
          end
          column :quantity
          column :total_price
        end
      end
      panel "Order Totals" do
        prov_id = order.province_tax.id
        sub_total = number_to_currency(order.order_total_at_purchase / (1 + (ProvinceTax.find(order.province_tax.id).gst / 100) + (ProvinceTax.find(order.province_tax.id).pst / 100) +(ProvinceTax.find(order.province_tax.id).hst / 100)))
        gst = number_to_currency((order.order_total_at_purchase / (1 + (ProvinceTax.find(order.province_tax.id).gst / 100) + (ProvinceTax.find(order.province_tax.id).pst / 100) + (ProvinceTax.find(order.province_tax.id).hst / 100))) * (ProvinceTax.find(order.province_tax.id).gst / 100))
        pst = number_to_currency((order.order_total_at_purchase / (1 + (ProvinceTax.find(order.province_tax.id).gst / 100) + (ProvinceTax.find(order.province_tax.id).pst / 100) + (ProvinceTax.find(order.province_tax.id).hst / 100))) * (ProvinceTax.find(order.province_tax.id).pst / 100))
        hst = number_to_currency((order.order_total_at_purchase / (1 + (ProvinceTax.find(order.province_tax.id).gst / 100) + (ProvinceTax.find(order.province_tax.id).pst / 100) + (ProvinceTax.find(order.province_tax.id).hst / 100))) * (ProvinceTax.find(order.province_tax.id).hst / 100))

        attributes_table do
          row "sub_total" do
            sub_total
          end
          row "gst" do
            gst
          end
          row "pst" do
            pst
          end
          row "hst" do
            hst
          end
          row "grand total" do
            sub_total + gst + pst + hst
          end
        end
      end
    end
  end
end
