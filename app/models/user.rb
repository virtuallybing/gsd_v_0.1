class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  has_many :task_links
  has_many :tasks, :through => :task_links  
  def to_param
    username.downcase
  end
end
