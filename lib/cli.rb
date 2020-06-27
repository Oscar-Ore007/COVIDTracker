class COVIDTracker::CLI  

    def initialize 
        @page = 1
        @limit = 50 
    end 

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
   COVIDTracker::APIManager.get_confirmed_cases(@page,@limit)
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
        when 'next'
            @page += 1 
            _, stop = get_page_range 
            if COVIDTracker::Cases.all.length < stop
                get_state_info 
            end 

        when 'previous'
            if @page <= 1 
                puts "You are on page 1! Welcome Back!".cyan 
            else
                @page -= 1
            end 

        else 
           display_single_state(input)  
        
            end 
        end 
    puts "THANK YOU! BE SAFE AND REMEMBER TO SAFE 6 FT APART, WASH YOUR HANDS,AND WEAR A MASK!".green
end


    def menu
        display_stats
        display_instructions
    #    binding.pry 
    end 

    def get_state_choice
        input = gets.strip.downcase
        commands = ["exit","next","previous"]
        return input.downcase if commands.include?(input.downcase) 
        if input.to_i.between?(1,COVIDTracker::Cases.all.length)
        # if input.to_i.between?(73, COVIDTracker::Cases.all.length)
            return input.to_i 
        else 
            
            puts "ummm.. that doesnt make sense, please try again."
            return "invalid"
    end 
end 


    def display_stats 
        start, stop = get_page_range 
        covid = COVIDTracker::Cases.all[start...stop]
        covid.each.with_index(start) do |covid, index|
            puts "#{index}. #{covid.province}" 
        end 
    end 

    def get_page_range 
        [(@page -1) * @limit,@page * @limit]
    end 

    def display_single_state(i)
        covid_object = COVIDTracker::Cases.all[i]
        COVIDTracker::APIManager.get_covid_details(covid_object)
        # binding.pry 
        puts covid_object.full_details
        puts "WOW! Check out the covid stats for your state!"
        puts "Press any key to continue!"
        gets
    end 

    def display_instructions
        puts <<-INST
<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
    
1.)Please choose a state by typing in the coresponding number or type 'exit' to exit the program.
2.)Type 'next' to view another list of states
3.)Type 'previous' to go back to the previous list of states

<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
        INST
    end 

end 

