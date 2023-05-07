class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable,  :trackable
  has_many :job_applications

  after_create :assign_default_role

  def assign_default_role
    role = Role.find_by(name: :job_seekers)
    RoleUser.create!(role_id: role.id, user_id: id)
  end
end
