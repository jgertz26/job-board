class Job < ActiveRecord::Base
  validates_presence_of :posted, :poster, :company, :city,
                        :state, :title, :body, :keywords

  validates :state, format: { with: /\A[A-Z]{2}\z/,
    message: "must match format XX (eg. MA, RI)" }
end
