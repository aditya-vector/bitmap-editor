require_relative '../lib/bitmap'

describe BitmapEditor do
	describe '#initialize' do
    context 'when width is out of bounds(>250)' do
      subject { Bitmap.new(width: 261, height: 100) }
      it 'should raise out of bounds error' do
        expect { subject }.to raise_error('Arguments out of bound')
      end
    end
    context 'when height is out of bounds(>250)' do
      subject { Bitmap.new(width: 100, height: 259) }
      it 'should raise out of bounds error' do
        expect { subject }.to raise_error('Arguments out of bound')
      end
    end
  end
end
