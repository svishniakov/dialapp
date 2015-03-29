class Service < ActiveRecord::Base
  validates :name, presence: true
  has_many :service_lines
end
