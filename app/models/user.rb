class User < ApplicationRecord
  has_many :job_applications
  belongs_to :role
end
