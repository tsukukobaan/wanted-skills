class LikesController < ApplicationController
  def like
    @skill = Skill.find(params[:skill_id])
    like = current_user.likes.build(skill_id: @skill.id)
    like.save
  end
  
  def unlike
    @skill = Skill.find(params[:skill_id])
    like = current_user.likes.find_by(skill_id: @skill.id)
    like.destroy
  end
end
