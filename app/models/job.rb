class Job < ApplicationRecord
  has_many :job_applications

  def self.ransackable_attributes(_auth_object = nil)
    %w[title company created_at expires_at] # replace with the attributes you want to allowlist
  end
end
