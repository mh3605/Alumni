class Researcharea < ActiveRecord::Base
has_many :alums
has_many :faculties
belongs_to :department
end
