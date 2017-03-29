class SkillsController < ApplicationController
  def index
    @skills = Skill.all
  end

  def show
    @skill = Skill.find(params[:id])
  end

  def new
  end

  def create
    @skill = Skill.new
    @skill.title = params[:title]
    @skill.save
    redirect_to skill_path(@skill.id)
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])
    @skill.title = params[:title]
    @skill.save
    redirect_to skill_path(@skill.id)
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    redirect_to skills_path
  end
end