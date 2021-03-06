class Project < ApplicationRecord
	belongs_to :artist

	has_many :buffers
	has_many :mecenes, through: :buffers

	validates :title, presence: true, length: { maximum: 200 }

	validates :description, presence: true, length: { maximum: 10000 }

	validates :category, presence: true, length: { maximum: 50 }

	validates :duration, presence: true, length: { maximum: 10 }

	validates :budget, presence: true, length: { minimum: 3 }, format: { with: /\A[0-9]+\z/, message: "composé uniquement de chiffres." }

	validates :funding, format: { with: /\A[0-9]+\z/, message: "composé uniquement de chiffres." }, allow_blank: true

	validates :scope, presence: true, length: { maximum: 2500 }
end
