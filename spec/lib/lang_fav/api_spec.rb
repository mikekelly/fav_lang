require "spec_helper"

describe LangFav::Api do
  subject(:api) { described_class.new }
  let(:username) { "mikekelly" }

  describe "#fetch_user" do
    it "returns a user object" do
      expect(api.fetch_user(username)).to be_a_kind_of LangFav::Api::User
    end
  end

  describe LangFav::Api::User do
    describe "#favourite_language" do
      subject(:user) { described_class.new(username: username) }

      it "returns the user's favourite language" do
        expect(subject.favourite_language).to eq "Ruby"
      end
    end
  end
end
