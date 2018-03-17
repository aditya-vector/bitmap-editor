require_relative '../lib/bitmap_editor'
describe BitmapEditor do
  describe '#run' do
    describe 'Invalid Input File' do
      context 'when file input is nil' do
        subject { BitmapEditor.new.run(nil) }
        it 'should return incorrect file message' do
          expect{ subject }.to output(/please provide correct file/).to_stdout
        end
      end
      context 'when file does not exist' do
        subject { BitmapEditor.new.run('') }
        it 'should return incorrect file message' do
          expect{ subject }.to output(/please provide correct file/).to_stdout
        end
      end
    end

    describe 'Verify command: I' do
      context 'with valid arguments' do
        let(:file) { File.new('./examples/generate_bitmap.txt') }
        subject { BitmapEditor.new.run(file) }
        it 'generates a bitmap with default color white (O)' do
          expect{ subject }.to output(
            <<~STREND
              OOOO
              OOOO
              OOOO
              OOOO
              OOOO
            STREND
          ).to_stdout
        end
      end
    end

    describe 'Verify command: L' do
      context 'with valid arguments' do
        let(:file) { File.new('./examples/color_bitmap.txt') }
        subject { BitmapEditor.new.run(file) }
        it 'generates a bitmap with default color white (O)' do
          expect{ subject }.to output(
            <<~STREND
              OOOO
              OOOO
              OYOO
              OOOO
              OOOO
            STREND
          ).to_stdout
        end
      end
    end

    describe 'Verify command: V' do
      context 'with valid arguments' do
        let(:file) { File.new('./examples/color_vertical_segment_bitmap.txt') }
        subject { BitmapEditor.new.run(file) }
        it 'sets the vertical segment with given color' do
          expect{ subject }.to output(
            <<~STREND
              OOOO
              OOOO
              GOOO
              GOOO
              GOOO
            STREND
          ).to_stdout
        end
      end
    end

    describe 'Verify command: C' do
      context 'with valid arguments' do
        let(:file) { File.new('./examples/clear_bitmap.txt') }
        subject { BitmapEditor.new.run(file) }
        it 'clears the bitmap and sets default color to white (O)' do
          expect{ subject }.to output(
            <<~STREND
              OOOO
              OOOO
              OOOO
              OOOO
              OOOO
            STREND
          ).to_stdout
        end
      end
    end

    describe 'Verify command: H' do
      context 'with valid arguments' do
        let(:file) { File.new('./examples/color_horizontal_segment_bitmap.txt') }
        subject { BitmapEditor.new.run(file) }
        it 'sets the horizontal segment with given color' do
          expect{ subject }.to output(
            <<~STREND
              OOOO
              OOOO
              OOOO
              OOOO
              ORRR
            STREND
          ).to_stdout
        end
      end
    end
  end
end