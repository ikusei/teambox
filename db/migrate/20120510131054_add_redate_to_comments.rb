class AddRedateToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :redate, :datetime
  end

  def self.down
    remove_column :comments, :redate
  end
end
