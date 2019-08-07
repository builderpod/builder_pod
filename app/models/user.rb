class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :projects
  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  has_person_name

  def name 
  	first_name + " " + last_name 
  end

  has_many :notifications, foreign_key: :recipient_id
  has_many :services
end
