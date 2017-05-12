class Rate < ActiveRecord::Base
	has_many :orders, dependent: :destroy, inverse_of: :rate
  
	validates :name, presence: true
	validates :times_of_day, presence: true, inclusion: { in: %w(день ночь)}
	validates :how_far, presence: true, inclusion: { in: ['в пределах МКАД',  'За МКАД',  'Подмосковье'] }
	validates :PPK, numericality: { allow_nil: false }
end
