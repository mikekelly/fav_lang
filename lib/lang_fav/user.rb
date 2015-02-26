module LangFav
  class User
    def initialize(username:, repositories:)
      @username, @repositories = username, repositories
    end

    def favourite_language
      repositories.group_by(&:language).values.max_by(&:size).to_a.first.language
    end

    private

    attr_reader :username, :repositories
  end
end
