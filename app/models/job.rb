class Job < ActiveRecord::Base
  validates :procedure_id, :qty, :start_date, :end_date, presence: true

  belongs_to :procedure
end
