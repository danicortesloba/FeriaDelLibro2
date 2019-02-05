ActiveAdmin.register Reader do

permit_params :user, :firstname, :lastname

index do
    column :firstname
    column :lastname
    column :user
    actions
end

form do |f|
   inputs 'Agregar un nuevo Lector' do
     f.input :user_id,
     label: 'Usuario',
     as: :select,
     collection: User.pluck(:email, :id)
   input :firstname
   input :lastname
   actions
  end
end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
