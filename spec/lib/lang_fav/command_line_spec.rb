require 'spec_helper'

describe LangFav::CommandLine do
  let(:out) { double(:out) }
  let(:arguments) { [username] }
  let(:api) { double(:api) }
  let(:language) { "Ruby"}

  subject(:cli) { described_class.new(out: out, arguments: arguments, api: api) }

  before do
    allow(api).to receive(:fetch_user).and_return(api_user)
  end

  describe "#run" do
    context "a valid github username" do
      let(:username) { "mikekelly" }
      let(:api_user) { double(:api_user, favourite_language: language) }

      it "outputs the favourite language of the user" do
        expect(out).to receive(:call).with language
        cli.run
      end
    end
  end
end
