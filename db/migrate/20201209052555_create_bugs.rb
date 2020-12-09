class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.text :message
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
