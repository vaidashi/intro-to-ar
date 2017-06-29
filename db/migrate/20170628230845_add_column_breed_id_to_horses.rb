class AddColumnBreedIdToHorses < ActiveRecord::Migration
  def change
    add_column :horses, :breed_id, :integer
  end

end
