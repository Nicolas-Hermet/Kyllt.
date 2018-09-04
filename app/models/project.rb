class Project < ApplicationRecord
	belongs_to :artist
	has_many :buffers
	has_many :mecenes, through: :buffers
end