class COVIDTracker::CLI 

    def start 
        puts "Welcome to COVIDTracker!"
        puts "Please type the name of a state in the US to review their live case numbers"
        input = gets.chomp.capitalize
        COVIDTracker::APIManager.get_confirmed_cases(input)
        display_cases
        more_options
    end 

        def display_cases
            COVIDTracker::Cases.all.each_with_index do |c,index|
                puts"#{index}. #{c.province}"
            end 
        end 


        def more_options
            puts "If you would like to know more about COVID in your state, select the coresponding number "
            input = gets.chomp.to_i
            index = input 
            user_choice = COVIDTracker::Cases.all[index]
            puts "#{user_choice.province}"
            puts "Confirmed_Cases in #{user_choice.province}: #{user_choice.confirmed}"
                end 
end  