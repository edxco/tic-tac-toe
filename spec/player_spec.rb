require '../lib/player.rb'

describe Player do
    context "Initialize player name" do
      it "Initialize with name Gabriela" do
          p1 = Player.new("Gabriela")
          expect(p1.name).to eql("Gabriela")
      end
    end

    context "Initialize player sign" do
        it "Initialize with default sign" do
            p1 = Player.new("Gabriela")
            expect(p1.sign).to eql("x")
        end
    end
end