class Year < ActiveRecord::Base
has_many :alums

validates :yr, :presence => true
end
