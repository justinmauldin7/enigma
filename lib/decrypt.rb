require './lib/enigma'

ARGV == ["encrypted.txt", "decrypted.txt", "04454", "061118"]

decrypted_file = File.open(ARGV[1], "w")
encrypted_file = File.open(ARGV[0], "r")
read_encrypted_file = encrypted_file.read

enigma = Enigma.new
enigma.decryption
enigma_decryption = enigma.decrypt(read_encrypted_file,ARGV[2], ARGV[3])
converted_enigma_decryption = enigma_decryption[:decryption]

decrypted_file.write(converted_enigma_decryption)

puts "Created #{ARGV[1]} with the key #{ARGV[2]} and date #{ARGV[3]}"
