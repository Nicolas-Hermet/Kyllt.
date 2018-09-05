class Mecene < ApplicationRecord
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
	
	has_many :buffers
	has_many :projects, {:through => :buffers, :source=>"project"}

	validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates_format_of :email, :with => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

	validates :first_name, presence: true
	validates_format_of :first_name, :with => /^[a-zA-Z]+$/, :multiline => true

	validates :last_name, presence: true
	validates_format_of :last_name, :with => /^[a-zA-Z]+$/, :multiline => true

	validates :min_budget, length: { minimum: 3 }, on: :create, allow_blank: true
	validates_format_of :min_budget, :with => /^[0-9]+$/, :multiline => true, on: :create, allow_blank: true

	validates :max_return_invest, length: { maximum: 50 }, on: :create, allow_blank: true
	validates_format_of :max_return_invest, :with => /^[A-Za-z0-9_-]+$/, :multiline => true, on: :create, allow_blank: true

	validates :art_category, length: { maximum: 50 }, on: :create, allow_blank: true
	validates_format_of :art_category, :with => /^[A-Za-z0-9_-]+$/, :multiline => true, on: :create, allow_blank: true

	validates :locality, length: { maximum: 5 }, on: :create, allow_blank: true
	validates_format_of :locality, :with => /^[0-9_-]+$/, :multiline => true, on: :create, allow_blank: true

	validates :iban, length: { maximum: 33 }, on: :create, allow_blank: true
	validates_format_of :iban, :with => /^[A-Za-z0-9_-]+$/, :multiline => true, on: :create, allow_blank: true

	validates :gcs_read, acceptance: true
end