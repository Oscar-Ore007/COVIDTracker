

class COVIDTracker::APIManager

        def self.get_confirmed_cases(states)
            url = "https://api.covid19api.com/live/country/united-states/status/confirmed"
            res = HTTParty.get(url)
            # response.each do |d|
                
            # res
            # end 
        end 
end  