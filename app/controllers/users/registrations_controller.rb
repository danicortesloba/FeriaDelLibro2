# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
   before_action :configure_sign_up_params, only: [:create]
   before_action :configure_account_update_params, only: [:update]
   before_action :set_user, only: [:show, :edit, :update, :destroy]


  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource


   def create
     @user = User.new(user_params)
     if @user.save
       if @user.role == "Editorial" and sign_in(@user)
         redirect_to new_publisher_path
       elsif sign_in(@user)
         redirect_to new_reader_path
       end
    end
   end

  # GET /resource/edit


  # PUT /resource
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_profile_path, notice: 'Tu cuenta se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  private
    def user_params
       params.require(:user).permit(:id, :email, :role, :password)
    end


  # protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :role, :password])
   end

  # If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:email, :role, :password])
   end

   def set_user
     @user = User.find(current_user.id)
   end
  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
