class ApplicationController < ActionController::Base

   before_action :configure_permitted_parameters, if: :devise_controller?

   protected
 
   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
     devise_parameter_sanitizer.permit(:account_update, keys: [
         :name,
         :password,
         :password_confirmation,
         :address,
         :contact_number,
         :fb_link,
         :ig_link,
         :twitter_link,
         :in_link
      ])
   end
 end