class Horse < ActiveRecord::Base
  belongs_to :jockey
  belongs_to :breed
end
