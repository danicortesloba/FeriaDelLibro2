ActiveAdmin.register Milling do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :user, :code, :payment_method, :amount, :currency

filter :created_at

form do |f|
   inputs 'Agregar un nuevo Milling' do
     f.input :user_id,
     label: 'Usuario',
     as: :select,
     collection: User.pluck(:email, :id)
   input :code
   input :payment_method
   input :amount
   input :currency
   actions
  end
end


index do
    column :code
    column :payment_method
    column :amount
    column :created_at
    column :expiration do |milling|
      (milling.created_at + 1.year).to_date.strftime('%d/%m/%Y')
    end

    column :email do |milling|
      milling.user.email
    end

    actions
end
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
