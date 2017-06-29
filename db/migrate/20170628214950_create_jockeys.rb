class CreateJockeys < ActiveRecord::Migration
  def change
    create_table :jockeys do |j|
      j.text     :name
    end
  end
  
end
