class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :input
      t.string :code

      t.timestamps
    end
  end
end
