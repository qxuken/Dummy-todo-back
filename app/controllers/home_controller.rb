class HomeController < ApplicationController
  def index
    if current_applicant
      @applicant = current_applicant
    else 
      @applicant = Applicant.create(email: "#{SecureRandom.uuid}@#{SecureRandom.uuid}.#{SecureRandom.uuid}", password: SecureRandom.uuid)
      sign_in @applicant
    end
  end
end
