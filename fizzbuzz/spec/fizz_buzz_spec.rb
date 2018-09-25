# require_relative '../fizz_buzz'
#
# RSpec.describe FizzBuzz, "#say" do
#   context "pass in any argument data type" do
#     it "returns a string" do
#       expect(FizzBuzz.fizz_buzz(1).is_a?(String))
#     end
#   end
#
#   context "passing in a number divisible by three" do
#     it "returns Fizz" do
#       expect(FizzBuzz.fizz_buzz(3)).to eq('Fizz')
#     end
#   end
#
#   context "passing in a number not divisible by three" do
#     it "doesn't return Fizz" do
#       expect(FizzBuzz.fizz_buzz(5)).not_to eq('Fizz')
#     end
#   end
#
#   context "pass in a number divisible by five" do
#     it 'returns Buzz' do
#       expect(FizzBuzz.fizz_buzz(5)).to eq('Buzz')
#     end
#   end
#
#   context "pass in a number divisible by seven" do
#     it 'returns Whiz' do
#       expect(FizzBuzz.fizz_buzz(14)).to eq('Whiz')
#     end
#   end
#
#   context "pass in a number divisible by three, five, and seven" do
#     it 'returns FizzBuzzWhiz' do
#       expect(FizzBuzz.fizz_buzz(105)).to eq('FizzBuzzWhiz')
#     end
#   end
#
#   context "pass in a number divisible by three and five" do
#     it 'returns FizzBuzz' do
#       expect(FizzBuzz.fizz_buzz(15)).to eq('FizzBuzz')
#     end
#   end
#
#   context "pass in a number divisible by five and seven" do
#     it 'returns BuzzWhiz' do
#       expect(FizzBuzz.fizz_buzz(35)).to eq('BuzzWhiz')
#     end
#   end
# end
