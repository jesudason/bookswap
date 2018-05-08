class CreateMybooks < ActiveRecord::Migration[5.2]
  def change
    create_table :mybooks do |t|
      t.references :book, foreign_key: true
      t.string :borrower_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
