class Equipment < ActiveRecord::Base
  validates :name, :serial, presence: true
  has_many :service_lines
end
