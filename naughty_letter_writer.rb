require 'erb'

kids_data   = File.read('data/kids-data.txt')
naughty_letter = File.read('templates/naughty_sample_letter.txt.erb')

kids_data.each_line do |kid|

  kid_data_array = kid.split

  name     = kid_data_array[0]
  gender   = kid_data_array[1]
  behavior = kid_data_array[2]
  toys     = kid_data_array[3..8]
  toy = toys.sample
  infraction = kid_data_array[15..kid_data_array.length-1].to_a.join(' ')
  naughty_toys = toys.reject {|t| toy == t}.join(', ')

  next unless behavior == 'naughty'

  filename    = 'letters/naughty/' + name + '.txt'
  letter_text = ERB.new(naughty_letter, nil, '-').result(binding)

  puts "Writing #{filename}."
  File.write(filename, letter_text)

end

puts 'Done!'
