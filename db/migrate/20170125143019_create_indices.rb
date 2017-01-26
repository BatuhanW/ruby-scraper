class CreateIndices < ActiveRecord::Migration[5.0]
  def change
    create_table :indices do |t|
      t.string :url, null: false, default: ''
      t.json :content, default: { h1: '', h2: '', h3: '', links: [] }
      t.integer :status, default: 10

      t.timestamps
    end
  end
end
