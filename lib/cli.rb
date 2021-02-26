class CLI
    def run
        greeting
    end

    def greeting
        puts "Welcome to Bballinfo"
        API.new.get_basketball_data
    end


end