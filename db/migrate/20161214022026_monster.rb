class Monster < ActiveRecord::Migration[5.0]
  def change
    create_table :monsters do |t|
      t.string :name
    end
  end
end
