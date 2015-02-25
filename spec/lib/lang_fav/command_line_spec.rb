require 'spec_helper'

describe LangFav::CommandLine do
  let(:out) { double(:out) }
  let(:arguments) { [username] }

  subject(:cli) { described_class.new(out: out, arguments: arguments) }

  describe "#run" do
    context "a valid github username" do
      let(:username) { "mikekelly" }

      it "outputs the favourite language of the user" do
        expect(out).to receive(:call).with "Ruby"
        cli.run
      end
    end
  end
end
