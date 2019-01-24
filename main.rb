require 'lru_cache'

def get_size
  line = gets.rstrip
  match = /SIZE ([0-9]+)/.match(line)
  exit unless match
  match[1].to_i
end

def handle_request(cache)
  line = gets
  line.strip! if line
  if line == nil || line == 'EXIT'
    return false
  elsif line =~ /^GET ([^ ]+)$/
    val = cache.get($1)
    if val
      puts "GOT #{val}"
    else
      puts 'NOTFOUND'
    end
  elsif line =~ /^SET ([^ ]+) ([^ ]+)$/
    cache.set($1, $2)
    puts 'SET OK'
  else
    puts 'ERROR'
  end
  return true
end

size = get_size
puts size
cache = LRUCache.new(size)
while handle_request(cache);end
