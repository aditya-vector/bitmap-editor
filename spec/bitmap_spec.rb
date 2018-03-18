require_relative '../lib/bitmap'

describe Bitmap do
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
    context 'when height is out of bounds(0)' do
      subject { Bitmap.new(width: 100, height: 0) }
      it 'should raise out of bounds error' do
        expect { subject }.to raise_error('Arguments out of bound')
      end
    end
    context 'when height is out of bounds(0)' do
      subject { Bitmap.new(width: 0, height: 259) }
      it 'should raise out of bounds error' do
        expect { subject }.to raise_error('Arguments out of bound')
      end
    end
    context 'when width and height are just in bounds' do
      subject { Bitmap.new(width: 250, height: 250) }
      it 'should not raise out of bounds error' do
        expect { subject }.not_to raise_error
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
    context 'when width and height are just in bounds' do
      subject { bitmap.color_pixel(4, 5, 'Z') }
      it 'should not raise out of bounds error' do
        expect { subject }.not_to raise_error
      end
    end
  end

  describe '#draw_vertical_segment' do
    let(:bitmap) { Bitmap.new(width: 4, height: 5) }
    context 'when height range end is out of bitmap bounds' do
      subject { bitmap.draw_vertical_segment(3, 6, 1, 'Z') }
      it 'should raise out of bounds error' do
        expect { subject }.to raise_error('Arguments out of bound for given bitmap')
      end
    end
    context 'when height range start is less than one' do
      subject { bitmap.draw_vertical_segment(0, 3, 2, 'Z') }
      it 'should raise out of bounds error' do
        expect { subject }.to raise_error('Arguments out of bound for given bitmap')
      end
    end
    context 'when height range start is greater than height range end' do
      subject { bitmap.draw_vertical_segment(3, 1, 2, 'Z') }
      it 'should not change map' do
        expect { subject }.not_to change{ bitmap }
      end
    end
    context 'when width and height are just in bounds' do
      subject { bitmap.draw_vertical_segment(4, 1, 5, 'Z') }
      it 'should not raise out of bounds error' do
        expect { subject }.not_to raise_error
      end
    end
  end

  describe '#draw_horizontal_segment' do
    let(:bitmap) { Bitmap.new(width: 4, height: 5) }
    context 'when width range end is out of bitmap bounds' do
      subject { bitmap.draw_horizontal_segment(1, 5, 2, 'Z') }
      it 'should raise out of bounds error' do
        expect { subject }.to raise_error('Arguments out of bound for given bitmap')
      end
    end
    context 'when width range start is less than one' do
      subject { bitmap.draw_horizontal_segment(0, 4, 3, 'Z') }
      it 'should raise out of bounds error' do
        expect { subject }.to raise_error('Arguments out of bound for given bitmap')
      end
    end
    context 'when width range start is greater than width range end' do
      subject { bitmap.draw_horizontal_segment(3, 1, 2, 'Z') }
      it 'should not change map' do
        expect { subject }.not_to change{ bitmap }
      end
    end
    context 'when width and height are just in bounds' do
      subject { bitmap.draw_horizontal_segment(1, 4, 5, 'Z') }
      it 'should not raise out of bounds error' do
        expect { subject }.not_to raise_error
      end
    end
  end
end
