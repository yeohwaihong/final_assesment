class Recipe
  include HTTParty
  ENV["FOOD2FORK_KEY"] = 'c2baf59f01e643f4d0a5c0e950299fb9'
  base_uri 'http://food2fork.com/api'
  default_params key: ENV["FOOD2FORK_KEY"]
  format :json

  def self.for term
  get("/search", query: { q: term})["recipes"]
  end
end
