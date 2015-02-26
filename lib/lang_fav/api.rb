require "rest-client"
require "json"
require "ostruct"
require "link_header"

require_relative "user"

module LangFav
  class Api
    def fetch_user(username)
      User.new(
        username: username,
        repositories: fetch_repositories(for_user: username),
      )
    end

    private

    def fetch_repositories(for_user:)
      repos = Array.new
      url = "https://api.github.com/users/#{for_user}/repos"

      # This loops over pages of repos and adding them, until there is no longer
      # a next link to follow
      loop do
        response = RestClient.get(url)
        json_repos = JSON.parse response
        links = LinkHeader.parse(response.headers[:link].to_s).to_a
        next_link = links.detect { |link| link[1].include? ["rel", "next"] }

        repos += json_repos

        if next_link.nil?
          break
        else
          url = next_link.first
        end
      end

      repos.map { |repo| OpenStruct.new(repo) }
    end
  end
end
