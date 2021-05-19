# frozen_string_literal: true

# class Users::PasswordsController < Devise::PasswordsController

#   def edit
#     @current_user = User.find(params[:id])

#   end

#   def update
#     @current_user = User.find(params[:id])
#       if current_user.update_with_password(user_params)
#           redirect_to 'money/index'
#       else
#           render :edit
#       end
#   end

  # Never trust parameters from the scary internet, only allow the white list through.
#   private
#   def user_params
#       params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
#   end
# end
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
# end
