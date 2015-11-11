class JobsController < ApplicationController
  before_action :signed_in?, only: [:new, :create]

  def index
    @jobs = get_json("/jobs").sort_by! { |j| j["posted"] }
    @jobs.reverse!
  end

  def show
    @job = get_json(request.path)
    @post_date = Time.at(@job["posted"]).strftime('%b. %-d, %Y')

    log_clicked_job(@job)
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.valid?
      uri = URI("http://localhost:3000/jobs")
      Net::HTTP.post_form(uri, job_params)

      flash[:success] = "Successfully posted job!"
      redirect_to jobs_path
    else
      flash[:alert] = @job.errors.full_messages.join(" - ")
      render :new
    end

  end

  private

  def job_params
    output = params.require(:job).permit(
      :poster, :company, :city, :state, :title, :body, :keywords
    )
    output.merge(posted: Time.now.to_i)
  end

  def log_clicked_job(job_json)
    user_id = current_user ? current_user.id : nil
    click_info = { user_id: user_id, job_id: job_json["id"]}

    uri = URI("http://localhost:3000/events")
    res = Net::HTTP.post_form(uri, click_info)
  end
end
