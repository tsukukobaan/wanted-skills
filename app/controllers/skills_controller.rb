class SkillsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_skill, only:[:show,:edit,:update,:destroy]
  before_action :correct_user, only: [:edit, :update]
  
  def index
    @skills = Skill.all
  end

  def show
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    #@skill.user_id = @user.id
    if @skill.save
      redirect_to @skill, notice:'スキルが保存されました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @skill.update(skill_params)
      redirect_to @skill, notice: "スキルが更新されました"
    else
      render :edit
    end
  end

  def destroy
    @skill.destroy
    redirect_to skills_path
  end
  
  private
    def set_skill
      @skill = Skill.find(params[:id])
    end
    
    def skill_params
      params.require(:skill).permit(:title,:user_id)
    end
    
    def correct_user
      skill = Skill.find(params[:id])
      if !current_user?(skill)
        redirect_to root_path, alert: '許可されていないページです'
      end
    end
    

end