class ApiController < ApplicationController 
  skip_before_action :verify_authenticity_token
  before_action :authenticate_applicant_from_token!

  def authenticate_applicant_from_token!
    auth_token = request.headers['Authorization'] ? request.headers['Authorization'] : params[:authorization]

    if auth_token
      authenticate_with_auth_token auth_token
    else
      authentication_error
    end
  end

  private

  def authenticate_with_auth_token auth_token
    unless auth_token.include?(':')
      authentication_error
      return
    end
    applicant_id = auth_token.split(':').first
    applicant = Applicant.where(id: applicant_id).first

    if applicant && Devise.secure_compare(applicant.access_token, auth_token)
      # applicant can access
      sign_in applicant, store: false
    else
      authentication_error
    end
  end


  ##
  # Authentication Failure
  # Renders a 401 error
  def authentication_error
    # applicant's token is either invalid or not in the right format
    render json: {error: 'unauthorized'}, status: 401  # Authentication timeout
  end

  
end
