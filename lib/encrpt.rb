require './lib/enigma'

message = File.read(ARGV[0])

enigma = Enigma.new
encoded = enigma.encrypt(message.downcase)

encrypted_file = File.open(ARGV[1], 'w').write(encoded[:encryption])

puts "Created #{ARGV[1]} with the key #{encoded[:key]} and the date #{encoded[:date]} "
