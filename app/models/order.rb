class Order < ActiveRecord::Base
  belongs_to :driver
  belongs_to :rate
end
