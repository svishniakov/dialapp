class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def last_ip
    self.last_sign_in_ip.to_s
  end

  def current_ip
    self.current_sign_in_ip.to_s
  end
end
