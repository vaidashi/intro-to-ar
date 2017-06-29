class CreateBreeds < ActiveRecord::Migration
  def change
    create_table :breeds do |b|
      b.text     :name
    end
  end

end
