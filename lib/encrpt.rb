require './lib/enigma'

message = File.read(ARGV[0], 'r')
text = message.read
message.close

enigma = Enigma.new

encoded = enigma.encrypt(text.chomp)
encrpted_file = File.open(ARGV[1], 'w')
encrpted_file.write(encoded[:encrption])
encrpted_file.close
puts "Created #{ARGV[1]} with the key #{encoded[:key]} and the date #{encoded[:date]} "
def encrypt(message, key = default_key, date = convert_date)
  {encryption: cipher,
          key: key,
         date: date}
end
