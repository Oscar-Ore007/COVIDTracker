class COVIDTracker::Cases
    attr_accessor :province, :confirmed, :deaths, :active

    @@all = [] 

    def initialize(province,confirmed,deaths,active)
        @province = province
        @confirmed = confirmed
        @deaths = deaths 
        @active = active 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def full_details 
        <<-DESC
STATE NAME: #{self.province}     CONFIRMED CASES: #{self.confirmed} 
DEATHS: #{self.deaths}    ACTIVE: #{self.active}
        DESC
    end 
end 