class UsersController < ApplicationController
  def new
     @user = User.new
  end

  def create
     @user = User.new(user_params)
     if params[:user][:image] == nil
      File.open(Rails.root.join("#{Rails.root}/app/assets/images/default.jpg")) do |f|
         @user.image = f
      end
      end

     #    @user.image =
     # end
     # デフォルト画像を設定したい
     if @user.save
        log_in_from_sign_in @user
        redirect_to topics_path, notice: '登録が完了しました'
     else
        flash.now[:alert] = "登録に失敗しました"
        render :new
     end
  end

  private
  def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end

  def log_in_from_sign_in(user)
     session[:user_id] = user.id
  end
end
