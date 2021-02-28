class API

    def initialize
        @url = "https://www.balldontlie.io/api/v1/teams"
     end

    def get_basketball_data  
        bballinfo_hash = HTTParty.get(@url)
        basketball_data = bballinfo_hash["data"]
        basketball_data.each do |team|
           Bballinfo.new(team)
        end
     end
end