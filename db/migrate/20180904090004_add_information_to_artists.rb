class AddInformationToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :first_name, :string
    add_column :artists, :last_name, :string
    add_column :artists, :school, :string
    add_column :artists, :previous_projects, :text
    add_column :artists, :previous_exhibitions, :text
    add_column :artists, :previous_sales, :text
    add_column :artists, :time_invest_on_project, :integer
    add_column :artists, :biography, :textlocality
    add_column :artists, :gcs_read, :boolean
  end
end
