class Auto < ActiveRecord::Base
	has_many :drivers
	
	validates :model, presence: true, length: { maximum: 64 }
	validates :myclass, inclusion: { in: %w(бизнес эконом)}
	validates :number, presence: true, length: { in: 6..9 }
	validates :color, presence: true
	validates :year, presence: true, length: { is: 4 }
end
