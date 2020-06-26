class COVIDTracker::CLI  

def start 
    welcome 
    intro
    get_state_info 
    main_loop
end 

def welcome
    print "

    ..######...#######..##.....##.####.########..########.########.....###.....######..##....##.########.########.
    .##....##.##.....##.##.....##..##..##.....##....##....##.....##...##.##...##....##.##...##..##.......##.....##
    .##.......##.....##.##.....##..##..##.....##....##....##.....##..##...##..##.......##..##...##.......##.....##
    .##.......##.....##.##.....##..##..##.....##....##....########..##.....##.##.......#####....######...########.
    .##.......##.....##..##...##...##..##.....##....##....##...##...#########.##.......##..##...##.......##...##..
    .##....##.##.....##...##.##....##..##.....##....##....##....##..##.....##.##....##.##...##..##.......##....##.
    ..######...#######.....###....####.########.....##....##.....##.##.....##..######..##....##.########.##.....##
                                                                                                               
   ".cyan
  
   puts "
   <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
   ".light_green
   sleep(2)
end 

def intro
     puts "\n\n\n\n\n\n\n\n"
        puts "Welcome to COVIDTracker!".blue 
        sleep(1)
        puts "\n\n\n"
end 

def get_state_info
    puts "Please any key to view COVID-19 Statistics in the United States"
    gets
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
           display_single_state(input)  
        
            end 
        end 
    puts "THANK YOU! BE SAFE AND REMEBER TO WASH YOUR HANDS AND WEAR A MASK!".green
end


    def menu
        display_stats
        display_instructions
    #    binding.pry 
    end 

    def get_state_choice
        input = gets.strip.downcase
        return input if input == "exit"
        if input.to_i.between?(1,COVIDTracker::Cases.all.length)
        # if input.to_i.between?(73, COVIDTracker::Cases.all.length)
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
        # binding.pry 
        puts covid_object.full_details
        puts 'press any key to continue'
        gets
    end 

    def display_instructions
        puts <<-INST

    
Please choose a state by number of type 'exit' to exit the program.

        INST
    end 

end 

