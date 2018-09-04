class CreateProjects < ActiveRecord::Migration[5.2]
	def change
		create_table :projects do |t|
			t.string :title
			t.text :explanation
			t.references :artist, foreign_key: true
			t.string :category
			t.date :duration
			t.integer :budget
			t.integer :funding
			t.string :show_fav_place
			t.text :scope
			t.boolean :innovative
			t.boolean :validated, default: false
			t.boolean :archived, default: false
			t.timestamps
		end
	end
end