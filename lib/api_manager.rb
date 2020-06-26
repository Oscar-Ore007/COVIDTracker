

class COVIDTracker::APIManager

        def self.get_confirmed_cases
            url = "https://api.covid19api.com/live/country/united-states/status/confirmed"
            response = HTTParty.get(url)
            response.each do |c|
                province = c["Province"]
                confirmed = c["Confirmed"]
                deaths = c["Deaths"]
                active = c["Active"]
                # binding.pry
                COVIDTracker::Cases.new(province,confirmed,deaths,active)
              
            end 
            
        end 

        def self.get_covid_details(covid_object)
            puts "\nMAKING A NETWORK REQUEST........\n"

            # url = covid_object.url 
            url = "https://api.covid19api.com/live/country/united-states/status/confirmed"
            response = HTTParty.get(url)
            # deaths = response["Deaths"]
            # active = response["Active"]
            # deaths = virus["Deaths"]
            # active = virus["Active"]
        
    end 
end  