RSpec.describe Tor::Addresses do
  subject { described_class }

  describe '.list', :vcr do
    let(:result) { subject.list }

    it 'returns a collection' do
      VCR.use_cassette('check_tor') do
        expect(result).to be_an(Array)
      end
    end

    it 'the objects inside respond to address and found at' do
      VCR.use_cassette('check_tor') do
        expect(result.sample).to respond_to(:address, :found_at)
      end
    end
  end
end
