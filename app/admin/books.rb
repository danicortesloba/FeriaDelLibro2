ActiveAdmin.register Book do

permit_params :publisher, :title, :author_first_name, :author_last_name, :cover, :price, :isbn, :synopsis, :pvp
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model

index do
    column :title
    column :publisher do |book|
      book.publisher.name
    end
    column :author_first_name
    column :author_last_name
    column :price
    column :pvp
    actions
end
#
form do |f|
   inputs 'Agregar un nueva Editorial' do
     f.input :publisher_id,
     label: 'Editorial',
     as: :select,
     collection: Publisher.pluck(:name, :id)
   input :title
   input :cover
   input :author_first_name
   input :author_last_name
   input :price
   input :pvp
   input :synopsis
   input :isbn
   actions
  end
end
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
