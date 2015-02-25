require "rspec"

describe "The CLI" do
  it "returns a Github user's favourite language" do
    result = `bin/gh_lang_fav mikekelly`.chomp
    expect(result).to eq "Ruby"
  end
end
