class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.string :word_name
      t.text :word_detail

      t.timestamps
    end
  end
end
