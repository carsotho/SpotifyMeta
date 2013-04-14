require "./spotify-meta"
require "test/unit"

class TestSpotifyMeta < Test::Unit::TestCase

	def test_spotify_url
		spotifyMeta = SpotifyMeta.new
		assert_equal('ws.spotify.com', spotifyMeta.url, "url not matching...")
	end

	def test_version
		spotifyMeta = SpotifyMeta.new
		assert_equal(1, spotifyMeta.version, "version not matching...")
	end

	def test_search_artist
		spotifyMeta = SpotifyMeta.new
		result = spotifyMeta.search_artist('Gorillaz')

		expected = {"info"=>
  {"num_results"=>14,
   "limit"=>100,
   "offset"=>0,
   "query"=>"Gorillaz",
   "type"=>"artist",
   "page"=>1},
 "artists"=>
  [{"href"=>"spotify:artist:3AA28KZvwAUcZuOKwyblJQ",
    "name"=>"Gorillaz",
    "popularity"=>"0.63181"},
   {"href"=>"spotify:artist:4YWyujHMgsfqNxsIBTkNEX",
    "name"=>"Karaoke - Gorillaz",
    "popularity"=>"0.00039"},
   {"href"=>"spotify:artist:4JccI2wYYtbIvxbjXFQnxE",
    "name"=>"The Allstars Cover Gorillaz",
    "popularity"=>"0.01593"},
   {"href"=>"spotify:artist:3hjp2GfGJGyjiplu9FPE1m",
    "name"=>"Illa Gorillaz",
    "popularity"=>"0.00058"},
   {"href"=>"spotify:artist:5Qfxv84AWnJwKIj25Jhab0",
    "name"=>"Cyco Thah Urchin & Getdoe Gorillaz",
    "popularity"=>"0.00001"},
   {"href"=>"spotify:artist:45WNgk9ahBlxT1cvT0rcH5",
    "name"=>"Untamed Gorillaz",
    "popularity"=>"0.00022"},
   {"href"=>"spotify:artist:1x0240WxiOzcTRcpx3nzlO",
    "name"=>"The Untamed Gorillaz",
    "popularity"=>"0.00023"},
   {"href"=>"spotify:artist:13lvpAnM9chgENNOOvLECT",
    "name"=>"Vanilla Gorillaz",
    "popularity"=>"0.00023"},
   {"href"=>"spotify:artist:7LcjZAoX73zF4AvJc3cywY",
    "name"=>"Green Back Gorillaz",
    "popularity"=>"0.00010"},
   {"href"=>"spotify:artist:45ZlAYj33stOvxOBLlYDnK",
    "name"=>"Albino Gorillaz",
    "popularity"=>"0.00001"},
   {"href"=>"spotify:artist:4fjsFjUrcMsdHdobWU8BSh",
    "name"=>"Suluie Gorillaz",
    "popularity"=>"0.00003"},
   {"href"=>"spotify:artist:4srvb5WHQsfDUaIkClivEY",
    "name"=>"Pink Gorillaz",
    "popularity"=>"0.00000"},
   {"href"=>"spotify:artist:0AnzADJxsrc6Kgnv4AqwDw",
    "name"=>"Red Gorillaz",
    "popularity"=>"0.00008"},
   {"href"=>"spotify:artist:5YyCDqxTh8ozN9E1ggskah",
    "name"=>"Vanilla Gorillaz & Sovereignty",
    "popularity"=>"0.00002"}]}

		assert_equal(expected, result, "fail")
	end

	def test_search_album
		spotifyMeta = SpotifyMeta.new
		result = spotifyMeta.search_album('Demon Days')

		assert_equal(result["albums"][0]["name"], "Demon Days", "fail")
	end

	def test_search_track
		spotifyMeta = SpotifyMeta.new
		result = spotifyMeta.search_track("Clint Eastwood")

		assert_equal(result["tracks"][0]["name"], "Clint Eastwood", "fail")
	end
end