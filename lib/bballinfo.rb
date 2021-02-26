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

end

#module wrapper 