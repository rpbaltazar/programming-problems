#!/usr/bin/env ruby

HELPER_COUNTER = {1 => 1}

def loop_part input
  count = 1
  return HELPER_COUNTER[input] if HELPER_COUNTER[input]
  # return count if input == 1
  if input % 2 == 1
    count += loop_part 3*input + 1
  else
    count += loop_part input/2
  end
  HELPER_COUNTER[input] = count
end

while true
  begin
    line = $stdin.readline()
    max_count = 0
    lower_limit, upper_limit = line.split ' '
    (lower_limit..upper_limit).each do |number|
      count = loop_part number.to_i
      if max_count < count
        max_count = count
      end
    end
    puts "#{lower_limit} #{upper_limit} #{max_count}"
  rescue EOFError
    exit 0
  end
end
