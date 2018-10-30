function [padded_message] = SHA_256()

message = input ('Enter the string to be converted into hash : ','s');
message_hex = double(message); %decimal values of the string (message_hex-gives decimal ascii)
%64 32-bit word constats (provided by NSA under NIST)
K = ['428a2f98'; '71374491'; 'b5c0fbcf'; 'e9b5dba5'; '3956c25b'; '59f111f1'; '923f82a4'; 'ab1c5ed5';
     'd807aa98'; '12835b01'; '243185be'; '550c7dc3'; '72be5d74'; '80deb1fe'; '9bdc06a7'; 'c19bf174';
     'e49b69c1'; 'efbe4786'; '0fc19dc6'; '240ca1cc'; '2de92c6f'; '4a7484aa'; '5cb0a9dc'; '76f988da';
     '983e5152'; 'a831c66d'; 'b00327c8'; 'bf597fc7'; 'c6e00bf3'; 'd5a79147'; '06ca6351'; '14292967';
     '27b70a85'; '2e1b2138'; '4d2c6dfc'; '53380d13'; '650a7354'; '766a0abb'; '81c2c92e'; '92722c85';
     'a2bfe8a1'; 'a81a664b'; 'c24b8b70'; 'c76c51a3'; 'd192e819'; 'd6990624'; 'f40e3585'; '106aa070';
     '19a4c116'; '1e376c08'; '2748774c'; '34b0bcb5'; '391c0cb3'; '4ed8aa4a'; '5b9cca4f'; '682e6ff3';
     '748f82ee'; '78a5636f'; '84c87814'; '8cc70208'; '90befffa'; 'a4506ceb'; 'bef9a3f7'; 'c67178f2'];

%8 32-bit word initial HASH Values (provided by NSA under NIST)
H0 = dec2bin(hex2dec('6a09e667'),32);
H1 = dec2bin(hex2dec('bb67ae85'),32);
H2 = dec2bin(hex2dec('3c6ef372'),32);
H3 = dec2bin(hex2dec('a54ff53a'),32);
H4 = dec2bin(hex2dec('510e527f'),32);
H5 = dec2bin(hex2dec('9b05688c'),32);
H6 = dec2bin(hex2dec('1f83d9ab'),32);
H7 = dec2bin(hex2dec('5be0cd19'),32);

%Pre-processing:
% begin with the original message of length L bits (message_bytes gives binary ascii) 
% append a single '1' bit (variable used: single_bit)
% append K '0' bits, where K is the minimum number >= 0 such that L + 1 + K + 64 is a multiple of 512
% append L as a 64-bit big-endian integer, making the total post-processed length a multiple of 512 bits
    message_bytes = reshape((dec2bin(message_hex,8)'),1,24);
    single_bit = dec2bin(1);
    %strcat(d,c) = C + d -> in binary
    new_message_bytes = strcat(message_bytes, single_bit);
    k_count = 512 - 64 - length(new_message_bytes);
    
    k_str = num2str(0);
    for i = 1 : (k_count-1)
           k_str = strcat(num2str(0),k_str); 
    end
    last_64 = dec2bin(length(message_bytes),64);
    padded_message = strcat(last_64, k_str, new_message_bytes);
    %n1 = bin2dec(new_message_bytes) decimal of the concatinaed string
    
    
%Process the message in successive 512-bit chunks:
%break message into 512-bit chunks


end