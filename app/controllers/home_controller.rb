class HomeController < ApplicationController
  def index
    @applicant = Applicant.create(email: "#{SecureRandom.uuid}@#{SecureRandom.uuid}.#{SecureRandom.uuid}", password: SecureRandom.uuid)
  end
end
