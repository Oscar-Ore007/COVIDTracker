class COVIDTracker::CLI 

    def start 
        puts "Welcome to COVIDTracker!"
        puts "Please type the name of a state in the US to review their live case numbers"
        input = gets.strip.capitalize
        COVIDTracker::APIManager.get_confirmed_cases(input)
    end 

end  