class API

    def initialize
        @team_url = "https://www.balldontlie.io/api/v1/teams"
        @player_url = "https://www.balldontlie.io/api/v1/players?per_page=100&page=1"
     end

    def get_basketball_data  
        bballinfo_hash = HTTParty.get(@team_url)
        basketball_data = bballinfo_hash["data"]
        basketball_data.collect do |team|
           Bballinfo.new(team)
        end 
     end

     def get_basketball_players
      bballinfo_hash = HTTParty.get(@player_url)
      basketball_data = bballinfo_hash["data"]
       basketball_data.each do |player|
         Player.new(player)
        end 
     end
end