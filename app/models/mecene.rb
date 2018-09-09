class Mecene < ApplicationRecord
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
	
	has_many :buffers
	has_many :projects, {:through => :buffers, :source=>"project"}
	has_one_attached :avatar

	validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates_format_of :email, :with => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

	validates :first_name, presence: true, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters" }

	validates :last_name, presence: true, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters" }

	validates :min_budget, length: { minimum: 3 }, on: :create, allow_blank: true

	validates :max_return_invest, length: { maximum: 50 }, on: :create, allow_blank: true

	validates :art_category, length: { maximum: 50 }, on: :create, allow_blank: true

	validates :locality, length: { maximum: 5 }, on: :create, allow_blank: true

	validates :iban, length: { maximum: 33 }, on: :create, allow_blank: true

	validates :gcs_read, acceptance: true
end