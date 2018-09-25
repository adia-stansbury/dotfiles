require_relative '../anagram'

RSpec.describe Anagram, "#find_anagrams" do
  # context "pass in dog" do
  #   it "returns god" do
  #     expect(Anagram.find_anagrams('dog')).to eq('god')
  #   end
  # end

  context "check length of word" do
    it "returns array of words with same length" do
      expect(Anagram.words_of_same_length('dog')).to eq(['dog','god'])
      expect(Anagram.words_of_same_length('dog')).not_to include('dollar')
    end
  end

  context "find everything that contains first letter" do
    it "returns array of words that contain first letter of word" do

    end
  end
end
