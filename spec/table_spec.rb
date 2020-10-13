require '../lib/table.rb'

describe Table do
    let(:check) {Table.new}
    describe "#valid_move" do
        context "Is it a valid move?" do
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
    describe "#check_win" do
        context "Check winning moves" do
            it "First row horizontal win" do
                check.modify_table(:"9", "x")
                check.modify_table(:"7", "x")
                check.modify_table(:"8", "x")
                expect(check.check_win).to eql(1)
            end
        end
    end
end