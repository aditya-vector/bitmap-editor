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

  describe '#color_pixel' do
    let(:bitmap) { Bitmap.new(width: 4, height: 5) }
    context 'when width is out of bitmap bounds' do
      subject { bitmap.color_pixel(5, 3, 'Z') }
      it 'should raise out of bounds error' do
        expect { subject }.to raise_error('Arguments out of bound for given bitmap')
      end
    end
    context 'when height is out of bitmap bounds' do
      subject { bitmap.color_pixel(3, 7, 'Z') }
      it 'should raise out of bounds error' do
        expect { subject }.to raise_error('Arguments out of bound for given bitmap')
      end
    end
  end

  describe '#draw_vertical_segment' do
    let(:bitmap) { Bitmap.new(width: 4, height: 5) }
    context 'when width is out of bitmap bounds' do
      subject { bitmap.draw_vertical_segment(5, 3, 'Z') }
      it 'should raise out of bounds error' do
        expect { subject }.to raise_error('Arguments out of bound for given bitmap')
      end
    end
    context 'when height is out of bitmap bounds' do
      subject { bitmap.draw_vertical_segment(3, 7, 'Z') }
      it 'should raise out of bounds error' do
        expect { subject }.to raise_error('Arguments out of bound for given bitmap')
      end
    end
  end

  describe '#draw_horizontal_segment' do
    let(:bitmap) { Bitmap.new(width: 4, height: 5) }
    context 'when width is out of bitmap bounds' do
      subject { bitmap.draw_horizontal_segment(5, 3, 'Z') }
      it 'should raise out of bounds error' do
        expect { subject }.to raise_error('Arguments out of bound for given bitmap')
      end
    end
    context 'when height is out of bitmap bounds' do
      subject { bitmap.draw_horizontal_segment(3, 7, 'Z') }
      it 'should raise out of bounds error' do
        expect { subject }.to raise_error('Arguments out of bound for given bitmap')
      end
    end
  end
end
