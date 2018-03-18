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

      context 'when command is invalid' do
        let(:file) { File.new('./examples/invalid/invalid_command.txt') }
        subject { BitmapEditor.new.run(file) }
        it 'should return unrecognized command message' do
          expect{ subject }.to output(/unrecognised command :\(/).to_stdout
        end
      end
    end

    describe 'Verify command: I' do
      context 'with valid arguments' do
        let(:file) { File.new('./examples/valid/generate_bitmap.txt') }
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
        let(:file) { File.new('./examples/valid/color_bitmap.txt') }
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
      context 'when no bitmap is present' do
        let(:file) { File.new('./examples/invalid/color_bitmap.txt') }
        subject { BitmapEditor.new.run(file) }
        it 'should raise an error' do
          expect { subject }.to raise_error('There is no image')
        end
      end
    end

    describe 'Verify command: V' do
      context 'with valid arguments' do
        let(:file) { File.new('./examples/valid/color_vertical_segment_bitmap.txt') }
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
      context 'when no bitmap is present' do
        let(:file) { File.new('./examples/invalid/color_vertical_segment_bitmap.txt') }
        subject { BitmapEditor.new.run(file) }
        it 'should raise an error' do
          expect { subject }.to raise_error('There is no image')
        end
      end
    end

    describe 'Verify command: C' do
      context 'with valid arguments' do
        let(:file) { File.new('./examples/valid/clear_bitmap.txt') }
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
      context 'when no bitmap is present' do
        let(:file) { File.new('./examples/invalid/clear_bitmap.txt') }
        subject { BitmapEditor.new.run(file) }
        it 'should raise an error' do
          expect { subject }.to raise_error('There is no image')
        end
      end
    end

    describe 'Verify command: H' do
      context 'with valid arguments' do
        let(:file) { File.new('./examples/valid/color_horizontal_segment_bitmap.txt') }
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
      context 'when no bitmap is present' do
        let(:file) { File.new('./examples/invalid/color_horizontal_segment_bitmap.txt') }
        subject { BitmapEditor.new.run(file) }
        it 'should raise an error' do
          expect { subject }.to raise_error('There is no image')
        end
      end
    end

    describe 'Verify command: S' do
      context 'when no bitmap is present' do
        let(:file) { File.new('./examples/invalid/show.txt') }
        subject { BitmapEditor.new.run(file) }
        it 'should raise an error' do
          expect { subject }.to raise_error('There is no image')
        end
      end
    end
  end
end
