# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  def new_guest
    user = User.guest
    sign_in user
    flash[:notice] = 'ゲストユーザーとしてログインしました。'
    redirect_to posts_path
  end


  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    reject_user
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  protected
    def after_sign_in_path_for(resource)
      posts_path
    end

    def reject_user
      @user = User.find_by(name: params[:user][:name])
      if @user.valid_password?(params[:user][:password]) && (@user.status == true)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_user_registration_path
      end
    end

end
