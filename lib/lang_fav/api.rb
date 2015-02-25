module LangFav
  class Api
    def fetch_user(username)
      User.new(username: username)
    end

    class User
      def initialize(username:)
        @username = username
      end

      def favourite_language
        "Ruby"
      end

      private

      attr_reader :username
    end
  end
end
