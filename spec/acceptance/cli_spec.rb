require "spec_helper"

describe "The CLI" do
  context "for mikekelly" do
    it "returns Ruby" do
      result = `bin/gh_lang_fav mikekelly`.chomp
      expect(result).to eq "Ruby"
    end
  end

  context "for matz" do
    it "returns C" do
      result = `bin/gh_lang_fav matz`.chomp
      expect(result).to eq "C"
    end
  end
end
