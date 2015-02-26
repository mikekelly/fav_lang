require "spec_helper"
require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
end

describe LangFav::Api do
  subject(:api) { described_class.new }
  let(:username) { "mikekelly" }

  describe "#fetch_user" do
    let(:fetched_user) { api.fetch_user(username) }

    it "returns an object with the expected favourite language" do
      VCR.use_cassette("fetch_user") do
        expect(fetched_user.favourite_language).to eq "Ruby"
      end
    end
  end
end
