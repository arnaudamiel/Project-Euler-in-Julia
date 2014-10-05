#= XOR decryption
Problem 59

Each character on a computer is assigned a unique code and the preferred standard is ASCII (American Standard Code for Information Interchange). For example, uppercase A = 65, asterisk (*) = 42, and lowercase k = 107.

A modern encryption method is to take a text file, convert the bytes to ASCII, then XOR each byte with a given value, taken from a secret key. The advantage with the XOR function is that using the same encryption key on the cipher text, restores the plain text; for example, 65 XOR 42 = 107, then 107 XOR 42 = 65.

For unbreakable encryption, the key is the same length as the plain text message, and the key is made up of random bytes. The user would keep the encrypted message and the encryption key in different locations, and without both "halves", it is impossible to decrypt the message.

Unfortunately, this method is impractical for most users, so the modified method is to use a password as a key. If the password is shorter than the message, which is likely, the key is repeated cyclically throughout the message. The balance for this method is using a sufficiently long password key for security, but short enough to be memorable.

Your task has been made easy, as the encryption key consists of three lower case characters. Using cipher.txt (right click and 'Save Link/Target As...'), a file containing the encrypted ASCII codes, and the knowledge that the plain text must contain common English words, decrypt the message and find the sum of the ASCII values in the original text.

=#

function solve059()
	theCode = vec(readcsv("p059_cipher.txt",Int))

	key1 = Array(Int,0)
	sizehint(key1,div(length(theCode),3))
	key2 = Array(Int,0)
	sizehint(key2,div(length(theCode),3))
	key3 = Array(Int,0)
	sizehint(key3,div(length(theCode),3))

	for i = 1:3:length(theCode)
		push!(key1,theCode[i])
	end

	for i = 2:3:length(theCode)
		push!(key2,theCode[i])
	end

	for i = 3:3:length(theCode)
		push!(key3,theCode[i])
	end

	theKey = Array(Int,3)

	theKey[1]=int(' ') $ indmax(hist(key1,128)[2])-1
	theKey[2]=int(' ') $ indmax(hist(key2,128)[2])-1
	theKey[3]=int(' ') $ indmax(hist(key3,128)[2])-1

	theFullKey = Array(Int,length(theCode))

	for i = 1:3:length(theCode)-3
		theFullKey[i:i+2] = theKey[1:3]
	end

	theFullKey[length(theFullKey)] = theKey[1]

	sum(theFullKey $ theCode)
end

using Base.Test
@test solve059() == 107359
