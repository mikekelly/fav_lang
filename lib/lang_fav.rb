module LangFav
  class CommandLine
    def initialize(out:, arguments:)
      @out, @arguments = out, arguments
    end

    def run
      out.call "Ruby"
    end

    private

    attr_reader :out, :arguments
  end
end
