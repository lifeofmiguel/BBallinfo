class CLI
    def run
        greeting
        display
    end

    def greeting
        puts "Welcome to Bballinfo"
        API.new.get_basketball_data
    end

    def display
        Bballinfo.all.collect do |team|
            puts "#{team.full_name}"
        end
    end

end