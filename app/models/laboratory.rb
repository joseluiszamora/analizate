class Laboratory < ActiveRecord::Base
  belongs_to :analysis
  belongs_to :test
end
