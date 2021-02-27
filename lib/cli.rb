class CLI
    def run
        greeting
        select
    end

    def greeting
        puts "**********  Welcome to BBallinfo  **********"
        API.new.get_basketball_data
    end

    def display
        Bballinfo.all.collect do |team|
            team.full_name
        end
    end
    
    def select
        prompt = TTY::Prompt.new
        selection = prompt.select("********  Pick your favorite team!  ********", display)
        team_object = Bballinfo.find_by_name(selection)
        team_info(team_object)
    end

    def team_info(object)
        puts "Abbreviation: #{object.abbreviation}"
        puts "City: #{object.city}"
        puts "Conference: #{object.conference}"
        puts "Division: #{object.division}"
        puts "Full Name: #{object.full_name}"
        puts "Name: #{object.name}"
        leave
    end

    def leave
        puts "********  Back to main menu? (y/n)  ********"
        input = gets.chomp
        if input == "y"
        select
        elsif input == "n"
        exit
        end
    end


end