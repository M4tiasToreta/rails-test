require "./app/services/string_splitter_service.rb"

RSpec.describe StringSplitterService do
    describe "split and count string" do 
      it "returns the string splitted and counted for a word that contains multiple repeated letters and Uppercase" do 
        string = "Abóbora"

        splitter = StringSplitterService.new(string) 
        expected_result = { 'a' => 2, 'b' => 2, 'ó' => 1, 'o' => 1, 'r' => 1 }
        expect(splitter.call).to eq(expected_result) 
      end
    end
  end