class Role < ApplicationRecord
  has_many :users

  enum name: { admin: 'ADMIN', job_seekers: 'JOB_SEEKERS' }
end
