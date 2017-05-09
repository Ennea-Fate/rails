class Order < ActiveRecord::Base
  belongs_to :driver
  belongs_to :rate
	
	validates :date, presence: true
	validates :time, presence: true
	validates :from_adress, presence: true, length: { maximum: 512 }
	validates :to_adress, presence: true, length: { maximum: 512 }
	validates :passangers_count, numericality: { only_integer: true, allow_nil: false }
	validates :lenght_of_the_route, numericality: { allow_nil: false }
	validates :driver, presence: true
	validates :rate, presence: true
end
