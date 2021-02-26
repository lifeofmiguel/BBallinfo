class Bballinfo
    @@all = []
#attr acceossr
#self.send
    def initialize(bballinfo_hash)
        bballinfo_hash.each do |key, value|
            self.send("#{key}=", value)
        end 
        @@all << self
    end

    def self.all
        @@all
    end



end

#module wrapper 