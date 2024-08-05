class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :slug, null: false, default: "", index: true
      t.string :title, null: false, default: ""
      t.text :excerpt, null: false, default: ""
      t.text :content, null: false, default: ""
      t.string :status, limit: 20, null: false, default: "DRAFT"
      t.integer :post_author, null: false, default: 0

      t.timestamps
    end
  end
end
