class ServiceLine < ActiveRecord::Base
  validates :equipment_id, :service_id, :service_date, presence: true

  belongs_to :equipment
  belongs_to :service
end
