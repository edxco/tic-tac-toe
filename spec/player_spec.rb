require '../lib/player.rb'

describe Player do
    context "Initialize player name" do
      it "Initialize with name Gabriela" do
          p1 = Player.new("Gabriela")
          expect(p1.name).to eql("Gabriela")
      end
      it "Initialize player name with a previous string" do
        p1 = Player.new("Michael")
        expect(p1.name).not_to eql("Gabriela")
    end
    end

    context "Initialize player sign" do
        it "Initialize with default sign" do
            p1 = Player.new("Gabriela")
            expect(p1.sign).to eql("x")
        end
        it "Initialize with default sign" do
            p1 = Player.new("Gabriela")
            expect(p1.sign).not_to eql("o")
        end
    end
end

describe "#check_player" do
    let(:p1) {"Michael"}
    let(:p2) {"Michael"}
    let(:p3) {"Gabriela"}
    context "It's the same player name" do
        it "Cannot name both players Michael" do
            expect(check_player(p1, p2)).to eql(true)
        end
        it "Both names are different" do
            expect(check_player(p1, p3)).not_to eql(true)
        end
    end
end

describe "#check7_sign" do
    let(:sign1) {"x"}
    let(:sign2) {"X"}
    let(:sign3) {"o"}
    let(:sign4) {5}
    context "The user input a valid sign" do
        it "It's a valid sign (x)" do
            expect(check_sign(sign1)).to eql(false)
        end
        it "It's not a valid sign (X)" do
            expect(check_sign(sign2)).not_to eql(false)
        end
        it "It's a valid sign (o)" do
            expect(check_sign(sign3)).to eql(false)
        end
        it "5 is not a valid character" do
            expect(check_sign(sign4)).not_to eql(false)
        end
    end
end
