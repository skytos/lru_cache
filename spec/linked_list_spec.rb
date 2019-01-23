require 'linked_list'

describe LinkedList do

  describe '#each' do
    let(:list) { LinkedList.new }

    context "an empty list" do
      it "does not yield" do
        expect {
          list.each { raise 'should not happen' }
        }.not_to raise_error
      end
    end

    context "a list with one element" do
      before {
        list.push_back("hi")
      }

      it "yields the data once" do
        a = []
        list.each {|x| a.push(x)}
        expect(a).to eq(['hi'])
      end
    end

    context "a list with three elements" do
      before {
        list.push_back("hi")
        list.push_back("there")
        list.push_back("world")
      }

      it "yields the data once" do
        a = []
        list.each {|x| a.push(x)}
        expect(a).to eq(['hi', 'there', 'world'])
      end
    end

    context "a list with three elements added to the front" do
      before {
        list.push_front("hi")
        list.push_front("there")
        list.push_front("world")
      }

      it "yields the data once" do
        a = []
        list.each {|x| a.push(x)}
        expect(a).to eq(['world', 'there', 'hi'])
      end
    end

    context "a list with elements added to the front and back" do
      before {
        list.push_front("hi")
        list.push_back("there")
        list.push_front("world")
      }

      it "yields the data once" do
        a = []
        list.each {|x| a.push(x)}
        expect(a).to eq(['world', 'hi', 'there'])
      end
    end
  end
end
