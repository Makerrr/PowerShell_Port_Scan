$iprng = "127.0.0.1"  # IP range to scan (in this case, localhost)

$portrng = 130..140    # Port range to scan (from port 130 to 140)

foreach ($ip in $iprng) {
    foreach ($port in $portrng) {
        $tcpClient = New-Object System.Net.Sockets.TcpClient
        $tcpClient.ReceiveTimeout = 500  # Set receive timeout to 500 milliseconds
        
        try {
            $tcpClient.Connect($ip, $port)
            Write-Host "Port $port is open on $ip"
            $tcpClient.Close()
        } catch {
            # Port is closed or unreachable
            Write-Host "Port $port is closed on $ip"
            $tcpClient.Close()
        }
    }
}
