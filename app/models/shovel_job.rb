class ShovelJob < ActiveRecord::Base
    belongs_to :owner_user
    belongs_to :shovel_user
   
    
    validates_presence_of :start_date
    validate :start_date_cannot_be_in_the_past
   
    def start_date_cannot_be_in_the_past
        errors.add(:start_date, "can't be in the past") if
            !start_date.blank? and start_date < DateTime.now
    end
        
 
end
