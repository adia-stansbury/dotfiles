class RomanConverter

  ONES_LIST = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
  TENS_LIST = %w(X XX)

  def self.convert(integer)
    if integer < 10
      return ONES_LIST.dig(integer - 1)
    end

    if integer == 10
      return 'X'
    end

    if integer > 10 && integer < 20
     return "X" + ONES_LIST[integer - 11]
    end

    if integer == 20
      return "XX"
    end

    if integer > 20 && integer < 30
     return "XX" + ONES_LIST[integer - 21]
    end

    if integer == 30
      return 'XXX'
    end

    if integer > 30 && integer < 40
     return "XXX" + ONES_LIST[integer - 31]
    end
  end
end

RSpec.describe RomanConverter, "#convert" do
  context "pass in arabic" do
    it "returns roman equivalent" do
      expect(RomanConverter.convert(1)).to eq('I')
      expect(RomanConverter.convert(2)).to eq('II')
      expect(RomanConverter.convert(3)).to eq('III')
      expect(RomanConverter.convert(5)).to eq('V')
      expect(RomanConverter.convert(7)).to eq('VII')
      expect(RomanConverter.convert(10)).to eq('X')
      expect(RomanConverter.convert(11)).to eq('XI')
      expect(RomanConverter.convert(12)).to eq('XII')
      expect(RomanConverter.convert(13)).to eq('XIII')
      expect(RomanConverter.convert(14)).to eq('XIV')
      expect(RomanConverter.convert(19)).to eq('XIX')
      expect(RomanConverter.convert(20)).to eq('XX')
      expect(RomanConverter.convert(21)).to eq('XXI')
      expect(RomanConverter.convert(29)).to eq('XXIX')
      expect(RomanConverter.convert(30)).to eq('XXX')
      expect(RomanConverter.convert(31)).to eq('XXXI')
    end
  end
end

