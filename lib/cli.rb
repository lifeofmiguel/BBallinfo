class CLI
    def run
        greeting
        menu
    end

    def greeting
        puts "**********  Welcome to BBallinfo  **********"
        API.new.get_basketball_data
        API.new.get_basketball_players
    end

    def display_team
        Bballinfo.all.collect do |team|
            team.full_name 
        end
    end

    def menu
        prompt = TTY::Prompt.new
        input = selection = prompt.select("******  What would you like to see?  ******", %w(teams players))
        if input == "teams"
            select_team
        else
            select_player
        end
    end
    
    def select_team
        prompt = TTY::Prompt.new
        selection = prompt.select("********  Pick your favorite team!  ********", display_team)
        team_object = Bballinfo.find_by_name(selection)
        team_info(team_object)
    end

    def team_info(object)
        puts "******  Here is all you need to know  ******"
        puts "Abbreviation: #{object.abbreviation}"
        puts "City: #{object.city}"
        puts "Conference: #{object.conference}"
        puts "Division: #{object.division}"
        puts "Full Name: #{object.full_name}"
        puts "Name: #{object.name}"
        leave
    end

    def select_player
        prompt = TTY::Prompt.new
        answer = prompt.select("Choose a player", display_player)
        player_object = Player.find_by_name(answer)
        player_info(player_object)
     end

    def display_player
        Player.all.collect do |player|
            player.first_name
        end
    end
    

    def player_info(object)
        puts "First Name: #{object.first_name}"
        puts "Last Name: #{object.last_name}"
        puts "Position: #{object.position}"
        leave
    end

    def leave
        puts "********  Back to main menu? (y/n)  ********"
        input = gets.chomp
        if input == "y"
        menu
        elsif input == "n"
        exit
        end
    end
end