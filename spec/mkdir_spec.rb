require 'mkdir'

describe Mkdir do
  subject(:mkdir) { described_class.new }
  let!(:filename) { 'tips/mkdir.txt' }
  let!(:tips) { mkdir.tips }

  describe 'initialisation' do
    it 'throws an error if the tip file does not exist' do
      expect { Mkdir.new('nonexistent_mkdir.txt') }.to raise_error(Errno::ENOENT)
    end

    it 'loads the tips' do
      File.open(filename, 'r') do |file|
        expect(tips.count).to eq file.readlines.size
      end
    end
  end

  describe '#suggest_tips' do
    describe 'Tip for rmdir' do
      it 'suggests using rmdir when mkdir is used' do
        expect(mkdir.suggest_tips('ruby-kickstart').include?(tips[:rmdir])).to be true
      end
    end

    describe 'Tip for open' do
      it 'suggests using open . when mkdir is used' do
        expect(mkdir.suggest_tips('ruby-kickstart').include?(tips[:open])).to be true
      end
    end
  end
end
