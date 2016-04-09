class Profile < ActiveRecord::Base
  belongs_to :user

  validates :gender, inclusion: {in: %w(male female), message: "sex must be male of female"}
  validate :first_or_last_name, :check_for_male_sue

  def first_or_last_name
  	if first_name==nil and last_name==nil
  		errors.add(:first_name,"cannot be null when last_name is also null")
  	end
  end

  def check_for_male_sue
  	if first_name == "Sue"
  		errors.add(:first_name,"cannot be Sue -- boy am I sexist")
  	end
  end

  def self.get_all_profiles(birth_min, birth_max)
  	Profile.where("birth_year BETWEEN ? AND ?",birth_min,birth_max).order :birth_year
  end
end
