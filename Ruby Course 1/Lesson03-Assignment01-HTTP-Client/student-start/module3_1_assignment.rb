require 'httparty'
require 'pp'

class Recipe
	include HTTParty
	base_uri 'http://food2fork.com/api'
	default_params key: ENV["FOOD2FORK_KEY"] # abfe17136fc7a4020e35fbef9d6bbcc1
	format :json

	def self.for term
		get("/search", query: { q: term}, :verify => false)["recipes"]
	end
end
