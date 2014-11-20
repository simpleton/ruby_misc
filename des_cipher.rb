#encoding=utf-8
require 'pp'
require 'hex_string'
class Des
  require 'openssl'
  require 'base64'
  ALG = 'DES-CBC'
  KEY = "1234567812345678"
  DES_KEY = "12345678"
  def encode(str)
    des = OpenSSL::Cipher::Cipher.new(ALG)
    #des.pkcs5_keyivgen(KEY, DES_KEY)
    des.encrypt
    des.key = KEY
    des.iv = DES_KEY
    cipher = des.update(str) + des.final
    return Base64.encode64(cipher)
  end

  def decode(str)
    str = Base64.decode64(str)
    des = OpenSSL::Cipher::Cipher.new(ALG)
    des.decrypt
    des.key = KEY
    des.iv = DES_KEY
    str = des.update(str) + des.final
  end

  def KEY()
    KEY
  end

  def DES_KEY()
    DES_KEY
  end
end

puts __ENCODING__
des = Des.new
str = 'abc'

pp des.KEY
pp des.DES_KEY

pp '=====encrypt====='
pp des.encode("abcabcabc")
pp des.encode("ABC")
#pp des.encode("中国人".encode(""))
#pp des.encode("在那遥远的地方".encode())
#pp "中国人"
str =  des.decode("S078JKKtSvAMWap/sIGpd4eiphXoB0MB8EfFuFogsz8RLhrqnYxuAI8jchhX2zrYlCcVJcbeIfkwP7h6A+13QRIPDjUZPyuG6UtnbQ6iIeZ3kbVstT9zQlcDUPMVjAD4JHVZ2lWCPqykPdm+SBwc7OSYGsS5Q8mEyAjGgMXHAVxlQeLauYa356CSOcsB/pjUMYnx0gIkq6UbBaww+hoQmEhAruzflpFx55lURPRvl3OamO/4BDfcgMWrndIkPycCqyj2hxJV6jrZhzhO2WQ8SUwuLAS7iZdBBKZ2L30U+oh77avQ21Crlj/bDI6q4XiSTXBA3zqGVhwqzB7i5F55vGlK0GQl+df9JPIlaSYG/OBu3svqojsbin8hsJqMFJGvhugdZyiVJvPTp6C9frrftjXxY3uyB5zROi7+8ZNPxe4oaQZCqMT6BfepTWyNTNmDlMbPpnVWy82eWW+h0ywERelFLvfGAsYBM9YGuhdZynHuBndLmQx42J7omUET40yojWFoTugN6PFkUgPMVj3nVG/V4am5hnZyP0JoZi1YaP1WqjLQHrNcs8UTdGzacRBU4rXh04Qd8ZaKIORXpN6dX0idUwf/MlrMEJ7lG2tcmj4lj0b0+YCbsQr76asEfhDGQW/j4HrKE2zOciXk1DotDV1sdnsW3/0rSL4D1AgQ77sxJI2+XHEBEG8JXaKtGelj0xO3Hdr90xSjTiGhfoBBbmIWsO3UkuH79ErdY5zqJ8RmrNcZx94mxiF7jshVBvGEIR0T23PrBCCgtTrroWfZXmVlhTgGtefkq4YdNR2gQUYYuL6T+4BCew==``")

#print str.encode('UTF-8')
#print str

#print [des.decode("6rtTnrF34mPkJ5SO3RiaaQ==")].pack('H*')
str1 =  des.decode("6rtTnrF34mPkJ5SO3RiaaQ==")

#print str1.to_hex_string.hex.chr(Encoding::UTF_8)
print "你好"
print str1.length
print "---"
print "在那遥远的地方".length
print "---"
print str1.force_encoding("GBK").encode("UTF-8")
#print str1.to_hex_string.encode("unicode")
