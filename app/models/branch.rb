class Branch < ActiveRecord::Base
  validates :name, :address, presence: true
end
