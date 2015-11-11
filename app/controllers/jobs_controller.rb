class JobsController < ApplicationController

  def index
    path = request.path
    uri = URI("http://localhost:3000" + path)
    @jobs = JSON.load(Net::HTTP.get(uri))
    @jobs.sort_by! { |j| j["posted"] }.reverse!
  end

  def show
    path = request.path
    uri = URI("http://localhost:3000" + path)
    @job = JSON.load(Net::HTTP.get(uri))
  end
end
