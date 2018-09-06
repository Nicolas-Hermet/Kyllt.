class Project < ApplicationRecord
	belongs_to :artist

	has_many :buffers
	has_many :mecenes, through: :buffers

	has_many_attached :uploads 

	validates :title, presence: true, length: { maximum: 200 }

	validates :description, presence: true, length: { maximum: 10000 }

	validates :category, presence: true, length: { maximum: 50 }

	validates :duration, presence: true, length: { maximum: 10 }

	validates :budget, presence: true, format: { with: /\A[0-9]+\z/, message: "only allows numbers" }

	validates :funding, presence: true, format: { with: /\A[0-9]+\z/, message: "only allows numbers" }

	validates :scope, presence: true, length: { maximum: 2500 }
end