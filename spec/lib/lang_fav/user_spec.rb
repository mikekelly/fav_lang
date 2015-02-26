require "spec_helper"

describe LangFav::User do
  let(:username) { "mikekelly" }

  describe "#favourite_language" do
    let(:ruby_repo) { double(:repo, language: "Ruby") }
    let(:other_repo) { double(:repo, language: "Zubzubzub") }
    let(:repositories) { Array.new(2) { other_repo } + Array.new(3) { ruby_repo } }
    subject(:user) {
      described_class.new(username: username, repositories: repositories)
    }

    # TODO: add contexts for edge cases (no repos, no predominant language)
    it "returns the user's favourite language" do
      expect(subject.favourite_language).to eq "Ruby"
    end
  end
end
