class AddInvestToBuffer < ActiveRecord::Migration[5.2]
  def change
    add_column :buffers, :invest, :integer
  end
end
