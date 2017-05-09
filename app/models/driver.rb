class Driver < ActiveRecord::Base
	belongs_to :auto
	
	validates :fn, presence: true
	validates :sn, presence: true
	validates :ln, presence: true
	validates :birthdate, presence: true
	validates :TIN, length: {is: 10}, numericality: { only_integer: true, allow_nil: false }
	validates :passport, length: {is: 10}, numericality: { only_integer: true, allow_nil: false }
	validates :auto_id, presence: true 
end
