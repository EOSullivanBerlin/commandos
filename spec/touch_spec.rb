require 'touch'

describe Touch do
  subject(:touch) { described_class.new(filename) }
  let!(:tips) { touch.tips }
  let!(:all_tips) { tips[:rm] }
  let!(:filename) { 'tips/touch.txt' }

  describe 'initialisation' do
    it 'throws and error if the touch tip file does not exist' do
      expect { Touch.new('nonexistent_touch.txt') }.to raise_error(Errno::ENOENT)
    end

    it 'loads the tip' do
      expect(touch.tips.count).to eq(1)
    end
  end

  describe 'Tip for rm' do
    it 'suggests using rm with a filename when touch is used' do
      expect(touch.suggest_tips('ruby-kickstart')).to eq(tips[:rm])
    end

    it 'does not suggest using the rm option when it has already been used' do
      expect(touch.suggest_tips('rm ')).not_to eq(tips[:rm])
    end
  end
end
