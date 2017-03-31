class HomeController < ApplicationController
  def top
    if user_signed_in?
      @skill = Skill.new
      @skills = Skill.all.order(created_at: :desc)
    else
      @message = "ようこそWantedSkillsへ！"
    end
  end
end
