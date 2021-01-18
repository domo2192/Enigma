require './lib/enigma'

encrypted_text = File.open(ARGV[0])

enigma = Enigma.new
decoded = enigma.decrypt(encrypted_text, ARGV[2], ARGV[3])
File.open(ARGV[1], 'w').write(decoded[:decryption])

p "Created '#{ARGV[1]}' with the key #{decoded[:key]} and date #{decoded[:date]}"
