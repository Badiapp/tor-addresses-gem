RSpec.describe Tor::Addresses::Record do
  subject { described_class.new(line) }

  let(:line) { 'ExitAddress 216.218.134.12 2018-05-24 21:09:49' }

  describe '#address', :vcr do
    let(:result) { subject.address }

    it 'returns the expected ip address' do
      expect(result).to eq('216.218.134.12')
    end
  end

  describe '#found_at', :vcr do
    let(:result) { subject.found_at }

    it 'returns the expected date' do
      expect(result.year).to eq(2018)
      expect(result.month).to eq(5)
      expect(result.day).to eq(24)
      expect(result.hour).to eq(21)
      expect(result.minute).to eq(9)
    end
  end
end
