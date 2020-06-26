class COVIDTracker::CLI  

def start 
    intro
    get_state_info 
    main_loop
end 

def intro
     puts "\n\n\n\n\n\n\n\n"
        puts "Welcome to COVIDTracker!".blue 
        sleep(1)
        puts "\n\n\n"
end 

def get_state_info
   COVIDTracker::APIManager.get_confirmed_cases
end 

def main_loop
    loop do 
        menu 
        input = get_state_choice 
        case input 
        when 'exit'
            break 
        when 'invalid' 
            next
        else 
           puts input 
           display_single_state(input)  
        
            end 
        end 
    puts "in main loop"
end


    def menu
        display_stats
        display_instructions
    #    binding.pry 
    end 

    def get_state_choice
        input = gets.strip.downcase
        return input if input == "exit"
        if input.to_i.between?(1, COVIDTracker::Cases.all.length)
            return input.to_i - 1 
        else 
            puts "ummm.. that doesnt make sense, please try again."
            return "invalid"
    end 
end 


    def display_stats 
        covid = COVIDTracker::Cases.all 
        covid.each.with_index(1) do |covid, index|
            puts "#{index}. #{covid.province}" 
        end 
    end 

    def display_single_state(i)
        covid_object = COVIDTracker::Cases.all[i]
        COVIDTracker::APIManager.get_covid_details(covid_object)
        binding.pry 
    end 

    def display_instructions
        puts <<-INST

    
Please choose a state by number of type 'exit' to exit the program.

        INST
    end 

end 

