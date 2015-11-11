class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def get_json(path)
    uri = URI("http://localhost:3000" + path)
    JSON.load(Net::HTTP.get(uri))
  end

  def signed_in?
    unless current_user
      flash[:errors] = "You must be signed in to do that!"
      redirect_to jobs_path
    end
  end
end
