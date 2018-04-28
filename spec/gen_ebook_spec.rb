require './lib/gen_ebook.rb'

describe GenerateMobi do
  it "should generate a mobi file" do
    file = File.open('./top askreddit.html')
    GenerateMobi.generate(file)
  end
end