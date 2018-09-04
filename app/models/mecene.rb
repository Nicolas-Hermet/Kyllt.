class Mecene < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
	validates :first_name, presence: true
	validates :last_name, presence: true 
	validates :gcs_read, acceptance: true

	has_many :buffers
	has_many :projects, {:through => :buffers, :source=>"project"}
end