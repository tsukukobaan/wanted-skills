class User < ApplicationRecord
  has_many :skills
  validates :name,presence:true
  validates :email,presence:true,uniqueness:true
  
  def set_image(file)
    if !file.nil?
      file_name = file.original_filename

      File.open("public/user_images/#{file_name}", 'wb'){|f| f.write(file.read)}

      self.image = file_name
    end
  end
  
end
