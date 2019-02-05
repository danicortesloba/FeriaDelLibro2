ActiveAdmin.register Publisher do

permit_params :user, :name, :rut, :giro, :voucher, :method, :address, :facebook, :twitter, :instagram, :website, :razon
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
form do |f|
   inputs 'Agregar un nueva Editorial' do
     f.input :user_id,
     label: 'Usuario',
     as: :select,
     collection: User.pluck(:email, :id)
   input :name
   input :rut
   input :giro
   input :address
   input :razon
   input :method
   input :voucher
   input :twitter
   input :facebook
   input :instagram
   input :website
   actions
  end
end

index do
    column :id
    column :user do |publisher|
      "#{publisher.user.id}: #{publisher.user.email}"
    end
    column :name
    column :membership do |publisher|
      if publisher.user.millings.any?
           "Vencimiento: #{(publisher.user.millings.last.created_at + 1.year).to_date.strftime('%d/%m/%Y')}"
      end
    end

    actions
end

end
