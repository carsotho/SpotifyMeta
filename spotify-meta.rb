require "net/http"
require "json"

class SpotifyMeta
	attr_reader :url
	attr_reader :version

	def initialize
		@url = 'ws.spotify.com'
		@version = 1	
	end
	
	def search_artist(artist, page=1)
		artist = Net::HTTP.get(self.url, '/search/1/artist.json?q='+artist.gsub(' ', '%20')+'&page='+page.to_s)
		JSON.parse(artist)
	end

	def search_album(album, page=1)
		album = Net::HTTP.get(self.url, '/search/1/album.json?q='+album.gsub(' ', '%20')+'&page='+page.to_s)
		JSON.parse(album)
	end

	def search_track(track, page=1)
		track = Net::HTTP.get(self.url, '/search/1/track.json?q='+track.gsub(' ', '%20')+'&page='+page.to_s)
		JSON.parse(track)
	end
end