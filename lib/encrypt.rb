require './lib/enigma'

ARGV == ["message.txt", "encrypted.txt"]

encrypted_file = File.open(ARGV[1], "w")
message_file = File.open(ARGV[0], "r")
read_message_file = message_file.read

enigma = Enigma.new
enigma.encryption
enigma_encryption = enigma.encrypt(read_message_file)

encrypted_file.write(enigma_encryption)

puts "Created #{ARGV[1]} with the key #{enigma_encryption[:key]} and date #{enigma_encryption[:date]}"
