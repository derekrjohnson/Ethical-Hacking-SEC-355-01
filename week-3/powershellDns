# 192.168.4.4 to resolve 192.168.3.100 FOSTER 202 PC
# Resolve-DnsName -DnsOnly 192.168.3.100 -Server 192.168.4.4 -ErrorAction Ignore

# Prompt for user input
$networkIP = Read-Host "Enter the network IP (e.g., 192.168.1.0)"
$dnsServer = Read-Host "Enter the DNS server (e.g., 8.8.8.8)"

# Convert the network IP to a [System.Net.IPAddress] object
$baseIPAddress = [System.Net.IPAddress]::Parse($networkIP)

# Get the first three octets of the base IP
$octets = $baseIPAddress.GetAddressBytes()
$baseOctets = "$($octets[0]).$($octets[1]).$($octets[2])."

# Loop through the last octet from 1 to 254
for ($i = 1; $i -lt 255; $i++) {
    # Create the current IP address
    $currentIPAddress = "$baseOctets$i"

    # Resolve the DNS name
    $result = Resolve-DnsName -DnsOnly $currentIPAddress -Server $dnsServer -ErrorAction Ignore

    # Output the result only if it resolves
    if ($result) {
        Write-Output "$currentIPAddress resolves to: $($result.NameHost)"
    }
}
