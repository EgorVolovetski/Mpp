require 'net/http'

def correctIpAddress?(source)
  url = URI.parse(source)
  host = url.host
  begin
    ip = IPAddr.new host
  rescue IPAddr::InvalidAddressError
    return false
  rescue StandardError
    raise
  end
  return true
end

print ("Enter a IPv4 adress => ")
Ip = gets.chop!
puts correctIpAddress?('https://' + Ip + "/foo") # valid url, valid ip address