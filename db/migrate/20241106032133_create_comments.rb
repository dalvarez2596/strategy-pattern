class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.text :content

      t.timestamps
    end
  end
end
