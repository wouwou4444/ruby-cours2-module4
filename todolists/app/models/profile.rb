class Profile < ActiveRecord::Base
  belongs_to :user

  validates :gender, inclusion: { in: %w(male female),
    message: "male and female are only valid value for gender" }

  validate :not_first_and_last_name_null

  validate :no_boy_sue

  def not_first_and_last_name_null
    if not first_name.present? and not last_name.present?
      errors.add(:first_name, "First_name and last_name can't both be null")
    end
  end

  def no_boy_sue
    if gender == "male" and first_name == "Sue"
      errors.add(:first_name, "no boy can be called Sue")
    end
  end

  def self.get_all_profiles(min, max)
    m_profile = Profile.where("birth_year BETWEEN ? and ?", min, max).order(birth_year: :asc) 
  end
end
