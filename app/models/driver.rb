class Driver < ActiveRecord::Base
  
  attr_accessor :remove_auto
  attr_accessor :remove_auto_id
  
  after_update :destroy_auto
  
	belongs_to :auto, inverse_of: :drivers
	accepts_nested_attributes_for :auto, allow_destroy: true
  
	validates :fn, presence: true
	validates :sn, presence: true
	validates :ln, presence: true
	validates :birthdate, presence: true
	validates :TIN, length: {is: 10}, numericality: { only_integer: true, allow_nil: false }
	validates :passport, length: {is: 10}, numericality: { only_integer: true, allow_nil: false }
  validates :auto, presence: true
  
  protected
  
  def destroy_auto
    if (remove_auto == "true")
      relationship = Auto.find(remove_auto_id).drivers.select{|s| s.id != self.id}
      if (relationship.empty? and (auto_id.to_i != remove_auto_id.to_i))
        Auto.delete(remove_auto_id)
      end  
    end
  end
  
end
