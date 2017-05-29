class Order < ActiveRecord::Base
  
  attr_accessor :remove_rate
  attr_accessor :remove_rate_id
  
  after_update :destroy_rate
  
  belongs_to :driver
  belongs_to :rate, inverse_of: :orders
	accepts_nested_attributes_for :rate, allow_destroy: true
  
	validates :date, presence: true
	validates :time, presence: true
	validates :from_adress, presence: true, length: { maximum: 512 }
	validates :to_adress, presence: true, length: { maximum: 512 }
	validates :passangers_count, numericality: { only_integer: true, allow_nil: false }
	validates :lenght_of_the_route, numericality: { allow_nil: false }
	validates :driver, presence: true
	validates :rate, presence: true
  
  
  
  protected
  
  def destroy_rate
    if (remove_rate == "true")
      relationship = Rate.find(remove_rate_id).orders.select{|s| s.id != self.id}
      if (relationship.empty? and (rate_id.to_i != remove_rate_id.to_i))
        Rate.delete(remove_rate_id)
      end  
    end
  end
  
  def self.search(params)
    result = Order.includes(:rate, driver: [:auto]).references(:rate, driver: [:auto])
    
    # BYORDER
    if params['time_from'].present?
      result = result.where.not(time: Time.at(0)...Time.parse(params['time_from']))
    end
    if params['time_to'].present?
      result = result.where(time: Time.at(0)..Time.parse(params['time_to']))
    end
    if params['from_address'].present?
      result = result.where(departure_address: params['from_address'])
    end
    if params['to_address'].present?
      result = result.where(arrival_address: params['to_address'])
    end
    if params['passengers_count'].present?
      result = result.where(passengers_count: params['passengers_count'])
    end
    if params['length_of_the_route'].present?
      tmp = params['length_of_route'].split(/\D+/)
      result = result.where(length_of_the_route: (tmp[0].to_f..tmp[0].to_f))
    end

    # BYRATE
    if params['rate_name'].present?
      result = result.where(rates: {name: params['rate_name']})
    end
    if params['times_of_day'].present?
      result = result.where(rates: {times_of_day: params['times_of_day']})
    end
    if params['how_far'].present?
      result = result.where(rates: {how_far: params['how_far']})
    end
    if params['PPK'].present?
      tmp = params['PPK'].split(/\D+/)
      result = result.where(rates: {PPK: (tmp[0].to_f..tmp[1].to_f)}  )
    end

    # BYAUTO
    if params['auto_model'].present?
      result = result.where(autos: {model: params['auto_model']})
    end
    if params['auto_type'].present?
      result = result.where(autos: {myclass: params['auto_class']})
    end
    if params['state_number'].present?
      result = result.where(autos: {number: params['number']})
    end
    if params['color'].present?
      result = result.where(autos: {color: params['color']})
    end
    if params['release'].present?
      result = result.where(autos: {year: params['year']})
    end

    # BYDRIVER
    if params['driver_fn'].present?
      result = result.where(drivers: {fn: params['driver_fn']})
    end
    if params['driver_sn'].present?
      result = result.where(drivers: {sn: params['driver_sn']})
    end
    if params['driver_ln'].present?
      result = result.where(drivers: {ln: params['driver_ln']})
    end
    if params['driver_birthdate'].present?
      result = result.where(drivers: {birthdate: params['driver_birthdate']})
    end
    if params['driver_TIN'].present?
      result = result.where(drivers: {TIN: params['driver_TIN']})
    end
    if params['driver_passport'].present?
      result = result.where(drivers: {passport: params['driver_passport']})
    end

    result.all
  end
  
end
