class UsersController < ApplicationController
  
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :like_skills]


  def index
    @users = User.all
  end


  def show
    @skills = @user.skills
    @title = "スキル一覧"
  end


  # def new
  #   @user = User.new
  # end


  def edit
  end

  # POST /users
  # POST /users.json
  # def create
  #   @user = User.new(user_params)

  #   file = params[:user][:image]
    
  #   @user.set_image(file)
    
  #   if @user.save
  #     redirect_to @user, notice: 'ユーザーが保存されました'
  #   else
  #     render :new
  #   end
  # end



  def update
    file = params[:user][:image]

    @user.set_image(file)

    
    if @user.update(user_params)
      redirect_to @user, notice: 'ユーザー情報が更新されました'
    else
      render :edit
    end
  end
  
  def like_skills
    @skills = @user.like_skills
    @title = "いいね！一覧"
    
    # showアクションをrenderしてください
    render :show
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      @skill = Skill.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email)
    end
    
    def correct_user
      user = User.find(params[:id])
      if current_user.id != user.id
        redirect_to root_path, alert: "prohibited pages"
      end
    end
    

end
