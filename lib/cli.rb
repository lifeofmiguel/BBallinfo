class CLI
    def run
        greeting
        select
    end

    def greeting
        puts "Welcome to Bballinfo"
        API.new.get_basketball_data
    end

    def display
        Bballinfo.all.collect do |team|
            team.full_name
        end
    end
    
    def select
        prompt = TTY::Prompt.new
        selection = prompt.select("Pick your favorite team!", display)
        team_object = Bballinfo.find_by_name()
    end

end