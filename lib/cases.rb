class COVIDTracker::Cases
    attr_accessor :province, :confirmed 

    @@all = [] 

    def initialize(province,confirmed)
        @province = province
        @confirmed = confirmed
        @@all << self 
    end 

    def self.all 
        @@all 
    end 
end 