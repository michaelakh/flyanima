class MembershipsController < Devise::RegistrationsController
  
  #Find out a users age by passing the :date_of_birth into this method
  def age(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end