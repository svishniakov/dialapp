class Equipment < ActiveRecord::Base
  has_many :service_lines
end
