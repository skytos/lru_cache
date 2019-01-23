require 'linked_list'

describe LinkedList do
  let(:list) { LinkedList.new }

  describe '#each' do

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

  describe "#push_front" do
    it "returns the node that is created" do
      node = list.push_front("hey")
      expect(node.data).to eq "hey"
      expect(node.prev).to be_nil
      expect(node.next).to be_nil
    end

    it "adds the node to the back" do
      list.push_front('hi')
      list.push_front('there')
      expect(list.to_a).to eq(['there', 'hi'])
    end
  end

  describe "#push_back" do
    it "returns the node that is created" do
      node = list.push_back("hey")
      expect(node.data).to eq "hey"
      expect(node.prev).to be_nil
      expect(node.next).to be_nil
    end

    it "adds the node to the back" do
      list.push_back('hi')
      list.push_back('there')
      expect(list.to_a).to eq(['hi', 'there'])
    end
  end

  describe "#delete_node" do
    it "removes the node from the list" do
      list.push("hi")
      node = list.push("there")
      list.push("world")
      list.delete_node(node)
      expect(list.to_a).to eq(['hi', 'world'])
    end

    it "can empty the list" do
      node = list.push("hi")
      list.delete_node(node)
      expect(list.to_a.empty?).to eq true
    end

    it "works to remove the first element" do
      node = list.push('hi')
      list.push('there')
      list.delete_node(node)
      expect(list.to_a).to eq(['there'])
    end
    it "works to remove the last element" do
      list.push('hi')
      node = list.push('there')
      list.delete_node(node)
      expect(list.to_a).to eq(['hi'])
    end
  end
end
