class ApplicationController < ActionController::Base
before_action :set_raven_context

rescue_from CanCan::AccessDenied do |exception|
     respond_to do |format|
     format.html { redirect_to root_url, alert: exception.message }
     end
 end


  def set_raven_context
    Raven.user_context(id: session[:current_user_id]) # or anything else in session
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
