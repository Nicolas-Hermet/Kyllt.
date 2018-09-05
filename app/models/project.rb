class Project < ApplicationRecord
	belongs_to :artist

	has_many :buffers
	has_many :mecenes, through: :buffers

	validates :title, presence: true, length: { maximum: 200 }
	validates_format_of :title, :with => /^[A-Za-z0-9_-]+$/, :multiline => true

	validates :explanation, presence: true, length: { maximum: 10000 }
	validates_format_of :explanation, :with => /^[A-Za-z0-9_-]+$/, :multiline => true

	validates :category, presence: true, length: { maximum: 50 }
	validates_format_of :category, :with => /^[A-Za-z0-9_-]+$/, :multiline => true

	validates :duration, presence: true, length: { maximum: 10 }
	validates_format_of :duration, :with => /^[A-Za-z0-9_-]+$/, :multiline => true

	validates :budget, presence: true
	validates_format_of :budget, :with => /^[0-9_-]+$/, :multiline => true

	validates :funding, presence: true
	validates_format_of :funding, :with => /^[0-9_-]+$/, :multiline => true

	validates :duration, presence: true, length: { maximum: 50 }
	validates_format_of :duration, :with => /^[A-Za-z0-9_-]+$/, :multiline => true

	validates :scope, presence: true, length: { maximum: 2500 }
	validates_format_of :scope, :with => /^[A-Za-z0-9_-]+$/, :multiline => true
end