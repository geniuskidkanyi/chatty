class CreateVisitors < ActiveRecord::Migration[5.0]
  def change
    create_table :visitors do |t|
      t.text :location
      t.text :ip

      t.timestamps
    end
  end
end
