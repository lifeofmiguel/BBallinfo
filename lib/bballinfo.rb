class Bballinfo
    @@all = []
#attr acceossr
#self.send
def initialize(data)
    data.each do |key, value| 
        self.class.attr_accessor(key)
        self.send("#{key}=", value)
    end 
        @@all << self
    end

    def self.all
        @@all
    end
    
    def self.find_by_name(team_name)
        self.all.find do |team_object|
            team_object.full_name == team_name
        end
    end

end

#module wrapper 