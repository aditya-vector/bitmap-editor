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
  end
end