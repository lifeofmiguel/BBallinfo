class Player

    @@all = []

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

    def self.find_by_name(input)
        self.all.find do |player_object|
            player_object.first_name == input
        end
    end
end