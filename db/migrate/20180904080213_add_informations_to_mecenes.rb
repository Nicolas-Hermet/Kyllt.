class AddInformationsToMecenes < ActiveRecord::Migration[5.2]
	def change
		add_column :mecenes, :first_name, :string
		add_column :mecenes, :last_name, :string
		add_column :mecenes, :min_budget, :integer
		add_column :mecenes, :max_return_invest, :date
		add_column :mecenes, :art_category, :string
		add_column :mecenes, :locality, :integer
		add_column :mecenes, :iban, :string
		add_column :mecenes, :gcs_read, :boolean
	end
end