class ShovelUser < User
   validates_presence_of :price
   has_many :shovel_jobs
end