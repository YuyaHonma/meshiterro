class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "プロフィールが更新されました"
      redirect_to user_path(@user) # ユーザーの詳細ページへのパス
    else
      render 'edit'
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
