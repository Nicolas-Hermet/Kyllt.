class Buffer < ApplicationRecord
	belongs_to :project
	belongs_to :mecene
	has_many :projects
end