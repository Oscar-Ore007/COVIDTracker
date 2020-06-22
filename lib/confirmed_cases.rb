class COVIDTracker::ConfirmedCases
    attr_accessor :confirmed 

    @@all = [] 

    def initialize(confirmed, deaths)
        @confirmed = confirmed 
        @deaths = deaths 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 
end 