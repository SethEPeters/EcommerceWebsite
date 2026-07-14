ActiveAdmin.register Item do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :artist, :description, :item_image_path, :price, :quantity, :title
  #
  # or
  #
  # permit_params do
  #   permitted = [:artist, :description, :item_image_path, :price, :quantity, :title]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  config.filters = true
  filter :title
  filter :description
  filter :artist
  filter :price
  filter :quantity

    form do |f|
    f.inputs 'Item Details' do
      f.input :title, as: :string
      f.input :description, as: :string
      f.input :item_image_path, as: :file
      f.input :artist, as: :string
      f.input :price, as: :number
      f.input :quantity, as: :number
    end
    f.actions
  end

  permit_params :title, :description, :item_image_path, :artist, :price, :quantity
end
