require_relative '../lib/table.rb'

describe Table do
  let(:check) { Table.new }
  describe '#valid_move' do
    context 'Is it a valid move?' do
      it "10 it's not a valid move" do
        expect(check.valid_move(10)).to eql(true)
      end

      it "0 it's not a valid move" do
        expect(check.valid_move(0)).to eql(true)
      end

      it "5 it's a valid move" do
        expect(check.valid_move(5)).not_to eql(true)
      end
    end
  end
  describe '#check_win' do
    context 'Check horizontal winning moves' do
      it 'Top row horizontal win' do
        check.modify_table(:"9", 'x')
        check.modify_table(:"7", 'x')
        check.modify_table(:"8", 'x')
        expect(check.check_win).to eql(1)
      end
      it 'Middle row horizontal win' do
        check.modify_table(:"4", 'x')
        check.modify_table(:"5", 'x')
        check.modify_table(:"6", 'x')
        expect(check.check_win).to eql(1)
      end
      it 'Bottom row horizontal win' do
        check.modify_table(:"1", 'x')
        check.modify_table(:"2", 'x')
        check.modify_table(:"3", 'x')
        expect(check.check_win).to eql(1)
      end
    end
    context 'Check vertical winning moves' do
      it 'Left column vertical win' do
        check.modify_table(:"1", 'o')
        check.modify_table(:"4", 'o')
        check.modify_table(:"7", 'o')
        expect(check.check_win).to eql(2)
      end
      it 'Middle column vertical win' do
        check.modify_table(:"8", 'o')
        check.modify_table(:"5", 'o')
        check.modify_table(:"2", 'o')
        expect(check.check_win).to eql(2)
      end
      it 'Right column vertical win' do
        check.modify_table(:"9", 'o')
        check.modify_table(:"6", 'o')
        check.modify_table(:"3", 'o')
        expect(check.check_win).to eql(2)
      end
    end
    context 'Check diagonal winning moves' do
      it 'First Diagonal win' do
        check.modify_table(:"1", 'o')
        check.modify_table(:"5", 'o')
        check.modify_table(:"9", 'o')
        expect(check.check_win).to eql(3)
      end
      it 'Second Diagonal win' do
        check.modify_table(:"7", 'x')
        check.modify_table(:"5", 'x')
        check.modify_table(:"3", 'x')
        expect(check.check_win).to eql(3)
      end
    end
    context 'Check draw' do
      it "It's a draw game" do
        check.modify_table(:"1", 'o')
        check.modify_table(:"2", 'x')
        check.modify_table(:"3", 'o')
        check.modify_table(:"4", 'x')
        check.modify_table(:"5", 'o')
        check.modify_table(:"6", 'x')
        check.modify_table(:"7", 'o')
        check.modify_table(:"8", 'x')
        check.modify_table(:"9", 'x')
        expect(check.check_win).not_to eql(1)
      end
    end
  end
end
