class ServiceLine < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :service
end
