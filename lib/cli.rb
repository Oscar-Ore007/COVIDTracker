class COVIDTracker::CLI 

#     def start 
#         puts "\n\n\n\n\n\n\n\n"
#         puts "Welcome to COVIDTracker!".blue 
#         sleep(1)
#         puts "\n\n\n"
#         puts "Please type in your state location" 
#         # input = gets.strip.downcase
#         # COVIDTracker::APIManager.get_confirmed_cases(input)
#         display_cases
#         more_options
#     end 

#     def main_loop
#         loop do 
#             menu 
#             input = COVIDTracker::APIManager.get_confirmed_cases 
#             case input 
#             when "exit"
#                 break 
#             when "invalid"
#                 next 
#             else 
#                 puts input 
#                 # display_state_status(input) 
#     end
#     puts "in main loop"
# end 

#     def get_state_info
#         input = gets.strip.downcase 
#         return input if input == "exit"
#         if input i.to_i.between?(1, COVIDTracker::Cases.all.length)
#             return input.to_i
#         else 
#             puts "ummm.... that doesnt make sense"
#             return "invalid"
#         end 
#     end 

#         def display_cases
#             covid =  COVIDTracker::Cases.all.each_with_index do |c, index|
#                 puts "#{index}. #{c.province}"
#                 # puts" #{c.province}"
#             end 
#         end 


#         def more_options
#             puts "If you would like to know more about COVID in your state, select the coresponding number "
#             input = gets.strip.to_i
#             index = input 
#             user_choice = COVIDTracker::Cases.all[index]
#             puts "#{user_choice.province}"
#             puts "Confirmed_Cases in #{user_choice.province}: #{user_choice.confirmed}"
#                 end 
# end  
# end 

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
    end 
    puts "in main loop"
   
    end 
end


def menu 
    display_covid_stats
    # display_instructions
    binding.pry 
end 

def display_covid_stats
    covid = COVIDTracker::Cases.all 
    covid.each do |covid|
        puts covid.province
    end 

end 
#     loop do 
#         menu
#         input = get_state_case_info 
#         case input 
#         when "exit"
#             break
#         when "invalid"
#             next
#        else
#            puts input 
#            #display_state_info(input)
#        end

# end 
# end 


  


# end 