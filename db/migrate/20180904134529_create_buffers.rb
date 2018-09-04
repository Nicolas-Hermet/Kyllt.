class CreateBuffers < ActiveRecord::Migration[5.2]
	def change
		create_table :buffers do |t|
			t.references :project, foreign_key: true
			t.references :mecene, foreign_key: true
			t.timestamps
		end
	end
end