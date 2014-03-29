class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.string :description
      t.string :input_label
      t.text :input_example

      t.timestamps
    end
  end
end
