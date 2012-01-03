class CreateComments < ActiveRecord::Migration
  def self.up
    create_table(:comments ,:options =>'ENGINE=InnoDB DEFAULT CHARSET=utf8') do |t|

      t.string :name
      t.text :description
      t.string :img
      t.string :category
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
