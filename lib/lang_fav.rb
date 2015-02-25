module LangFav
  class CommandLine
    def initialize(out:, arguments:, api: Api.new)
      @out, @arguments, @api = out, arguments, api
    end

    def run
      out.call target_user.favourite_language
    end

    private

    def target_user
      @target_user ||= api.fetch_user(username)
    end

    def username
      arguments.first
    end

    attr_reader :out, :arguments, :api
  end

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
