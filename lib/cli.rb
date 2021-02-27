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
        puts "#{object.abbreviation}"
        puts "#{object.city}"
        puts "#{object.conference}"
        puts "#{object.division}"
        puts "#{object.full_name}"
        puts "#{object.name}"
        leave
    end

    def leave
        puts "Continue? (y/n)"
        input = gets.chomp
        if input == "y"
        select
        elsif input == "n"
        exit
        end
    end


end