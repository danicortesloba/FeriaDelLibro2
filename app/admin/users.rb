ActiveAdmin.register User do

permit_params :email, :password, :role
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

index do
    column :id
    column :email
    column :role
    column :details do |user|
      if user.reader.present?
        "#{user.reader.id}: #{user.reader.firstname} #{user.reader.lastname}"

      elsif user.publisher.present?
        "#{user.publisher.id}: #{user.publisher.name}"
      else
        "No account"
      end
    end

    actions
end

form do |f|
  inputs 'Nuevo usuario' do
  input :email
  input :password
  input :role
end
  actions
end


controller do
    def update
     if (params[:user][:password].blank? && params[:user][:password_confirmation].blank?)
     params[:user].delete("password")
     params[:user].delete("password_confirmation")
     end
     super
    end
end

end
