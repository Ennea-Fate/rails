class Driver < ActiveRecord::Base
	belongs_to :auto, dependent: :destroy, inverse_of: :drivers
	accepts_nested_attributes_for :auto, allow_destroy: true
  
	validates :fn, presence: true
	validates :sn, presence: true
	validates :ln, presence: true
	validates :birthdate, presence: true
	validates :TIN, length: {is: 10}, numericality: { only_integer: true, allow_nil: false }
	validates :passport, length: {is: 10}, numericality: { only_integer: true, allow_nil: false }
  validates :auto, presence: true 
end
