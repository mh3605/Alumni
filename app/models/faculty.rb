class Faculty < ActiveRecord::Base
has_many :alums 
belongs_to :department
has_many :researchareas
end
