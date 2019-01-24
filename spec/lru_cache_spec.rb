require 'lru_cache'

describe LRUCache do
  let(:cache) { LRUCache.new(max_size) }
  let(:max_size) { 3 }
  let(:key) { "foo" }
  let(:val) { "bar" }

  describe '.new' do
    it "sets the max_size and size" do
      expect(cache.size).to eq(0)
      expect(cache.max_size).to eq(max_size)
    end

    it "can be #get'ed from" do
    end
  end

  describe "#set(key, val)" do

    context "when setting a new key" do
      it "stores the value under the key" do
        cache.set(key, val)
        expect(cache.get(key)).to eq(val)
      end

      it "increases the size" do
        expect{cache.set(key, val)}.to change{cache.size}.from(0).to(1)
      end

      it "adds the key to the back of #keys" do
        cache.set(key, val)
        expect(cache.keys).to eq([key])
      end
    end

    context "when re-setting an already seen key" do
      let(:oldval) { "xyz" }
      before { cache.set(key, oldval) }

      it "stores the new value under the key" do
        cache.set(key, val)
        expect(cache.get(key)).to eq(val)
      end

      it "does not increase the size" do
        expect{cache.set(key, val)}.not_to change{cache.size}.from(1)
      end

      it "moves the key to the back of #keys" do
        cache.set("otherkey", "otherval")
        expect{ cache.set(key, val) }.to change{cache.keys}.from([key, "otherkey"]).to(["otherkey", key])
      end
    end

  end

  describe "#get(key)" do
    context "key is not in the cache" do
      it "returns nil" do
        expect(cache.get(key)).to be_nil
      end

      it "does not affect #keys" do
        expect{cache.get(key)}.not_to change{cache.keys}.from([])
      end
    end

    context "key is in the cache" do
      before { cache.set(key, val) }

      it "returns the stored value" do
        expect(cache.get(key)).to eq(val)
      end

      it "moves they key to the back of #keys" do
        cache.set("otherkey", "otherval")
        expect{cache.get(key)}.to change{cache.keys}.from([key, 'otherkey']).to(['otherkey', key])
      end
    end
  end

  describe "#keys" do
    it "returns an array of they keys stored in the cache in order of use" do
      cache.set('a', 1)
      cache.set('b', 2)
      cache.set('c', 3)
      expect(cache.keys).to eq(['a', 'b', 'c'])
    end
  end
end
