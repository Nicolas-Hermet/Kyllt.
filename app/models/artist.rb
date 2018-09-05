class Artist < ApplicationRecord
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

	has_many :projects

	validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates_format_of :email, :with => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

	validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

	validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

	validates :school, length: { maximum: 250 },  format: { with: /\A[a-zA-Z0-9]+\z/, message: "only allows letters and numbers" }, on: :create, allow_blank: true

	# validates :previous_projects, length: { maximum: 5000 }, on: :create, allow_blank: true
	# validates_format_of :previous_projects, :with => /^[A-Za-z0-9_-]+$/, :multiline => true, on: :create, allow_blank: true

	# validates :previous_exhibitions, length: { maximum: 5000 }, on: :create, allow_blank: true
	# validates_format_of :previous_exhibitions, :with => /^[A-Za-z0-9_-]+$/, :multiline => true, on: :create, allow_blank: true

	# validates :previous_sales, length: { maximum: 5000 }, on: :create, allow_blank: true
	# validates_format_of :previous_sales, :with => /^[A-Za-z0-9_-]+$/, :multiline => true, on: :create, allow_blank: true

	# validates :time_invest_on_project, length: { maximum: 20 }, on: :create, allow_blank: true
	# validates_format_of :time_invest_on_project, :with => /^[A-Za-z0-9_-]+$/, :multiline => true, on: :create, allow_blank: true

	# validates :biography, length: { maximum: 3000 }, on: :create, allow_blank: true
	# validates_format_of :biography, :with => /^[A-Za-z0-9_-]+$/, :multiline => true, on: :create, allow_blank: true

	# validates :locality, length: { maximum: 5 }, on: :create, allow_blank: true
	# validates_format_of :locality, :with => /^[0-9_-]+$/, :multiline => true, on: :create, allow_blank: true

	# validates :iban, length: { maximum: 33 }, on: :create, allow_blank: true
	# validates_format_of :iban, :with => /^[A-Za-z0-9_-]+$/, :multiline => true, on: :create, allow_blank: true

	# validates :gcs_read, acceptance: true
end