require '../lib/table.rb'

describe Table do
    describe "#valid_move" do
        let(:check) {Table.new}
        context "Is it a valid move?" do
            it "Player's input is 10" do
                expect(check.valid_move(10)).to eql(true)
            end

            it "Player's input is 0" do
                expect(check.valid_move(0)).to eql(true)
            end
        end
    end
end