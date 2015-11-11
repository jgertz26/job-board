class JobsController < ApplicationController

  def index
    @jobs = get_json(request.path)
    @jobs.sort_by! { |j| j["posted"] }.reverse!
  end

  def show
    @job = get_json(request.path)
  end
end
