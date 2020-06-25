

class COVIDTracker::APIManager

        def self.get_confirmed_cases
            url = "https://api.covid19api.com/live/country/united-states/status/confirmed"
            response = HTTParty.get(url)
            response.each do |c|
                province = c["Province"]
                confirmed = c["Confirmed"]
                COVIDTracker::Cases.new(province,confirmed)
              
            end 
            # binding.pry 
        end 
end  