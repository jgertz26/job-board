class JobsController < ApplicationController

  def index
    @jobs = get_json(request.path)
    @jobs.sort_by! { |j| j["posted"] }.reverse!
  end

  def show
    @job = get_json(request.path)
  end

  def new
  end

  def create
    uri = URI("http://localhost:3000/jobs")
    res = Net::HTTP.post_form(uri, job_params)
    binding.pry
    redirect_to jobs_path
  end

  private

  def job_params
    output = params.permit(
      :poster, :company, :city, :state, :title, :body, :keywords
    )
    output.merge(posted: Time.now.to_i)
  end
end
