class CreateEntries < ActiveRecord::Migration
  def up
    create_table :entries do |t|
      t.string  :key
      t.string  :file_uid
      t.integer :file_size
      t.timestamps
    end

    add_index :entries, :key,        using: 'hash'
    add_index :entries, :file_size,  using: 'btree'
    add_index :entries, :updated_at, using: 'btree'

  end

  def down
    drop_table :entries
  end
end
