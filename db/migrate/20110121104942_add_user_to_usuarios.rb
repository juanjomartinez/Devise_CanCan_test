class AddUserToUsuarios < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :user, :string
  end

  def self.down
    remove_column :usuarios, :user
  end
end
