# RSpec.describe Tipgen do
#   it "has a version number" do
#     expect(Tipgen::VERSION).not_to be nil
#   end
#
#   it "does something useful" do
#     expect(false).to eq(true)
#   end
# end
require "spec_helper"

RSpec.describe Tipgen do
  it "has a version number" do
    expect(Tipgen::VERSION).not_to be nil
  end

  it 'Accurately generates a tip given string or integer input' do
    test_1 = Tipgen::Builder.new(total: 100, gratuity: '23.5').generate
    test_2 = Tipgen::Builder.new(total: 100, gratuity: 'high').generate
    test_3 = Tipgen::Builder.new(total: 100, gratuity: 'LOW').generate
    test_4 = Tipgen::Builder.new(total: 100, gratuity: 'standard').generate
    test_5 = Tipgen::Builder.new(total: 100, gratuity: '18').generate
    test_6 = Tipgen::Builder.new(total: 100, gratuity: 20).generate
    test_7 = Tipgen::Builder.new(total: 100, gratuity: 0).generate

    expect(test_1).to eq(123.5)
    expect(test_2).to eq(125.0)
    expect(test_3).to eq(115.0)
    expect(test_4).to eq(118.0)
    expect(test_5).to eq(118.0)
    expect(test_6).to eq(120.0)
    expect(test_7).to eq(100.0)
  end
end
