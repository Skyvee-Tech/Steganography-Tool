param(
    [string]$action,
    [string]$coverfile,
    [string]$secretfile,
    [string]$outfilepath,
    [string]$infile
)

$zwsp = [char]0x200B
$zwnj = [char]0x200C

if ($action -eq 'encode') {
    $cover  = (Get-Content $coverfile  -Encoding UTF8).TrimEnd()
    $secret = (Get-Content $secretfile -Encoding UTF8).TrimEnd()
    $outfile = (Get-Content $outfilepath -Encoding UTF8).TrimEnd()

    $bytes = [System.Text.Encoding]::UTF8.GetBytes($secret)
    $bits  = ''
    foreach ($b in $bytes) {
        $bits += [Convert]::ToString($b, 2).PadLeft(8, '0')
    }

    $hidden = ''
    foreach ($bit in $bits.ToCharArray()) {
        if ($bit -eq '1') { $hidden += $zwsp } else { $hidden += $zwnj }
    }

    $result = $cover + $hidden
    [System.IO.File]::WriteAllText($outfile, $result, [System.Text.Encoding]::UTF8)
    Write-Host "  [+] Berhasil! File tersimpan: $outfile" -ForegroundColor Green
    Write-Host "  [+] Pesan rahasia sudah tersembunyi." -ForegroundColor Green
}

if ($action -eq 'decode') {
    $targetfile = (Get-Content $infile -Encoding UTF8).TrimEnd()

    if (-not (Test-Path $targetfile)) {
        Write-Host "  [-] File tidak ditemukan!" -ForegroundColor Red
        exit
    }

    $content = [System.IO.File]::ReadAllText($targetfile, [System.Text.Encoding]::UTF8)
    $bits = ''
    foreach ($c in $content.ToCharArray()) {
        if ($c -eq $zwsp)    { $bits += '1' }
        elseif ($c -eq $zwnj) { $bits += '0' }
    }

    if ($bits.Length -eq 0) {
        Write-Host "  [-] Tidak ada pesan tersembunyi di file ini." -ForegroundColor Yellow
        exit
    }

    $bl = New-Object System.Collections.Generic.List[byte]
    for ($i = 0; $i -lt $bits.Length - 7; $i += 8) {
        $bl.Add([Convert]::ToByte($bits.Substring($i, 8), 2))
    }

    $decoded = [System.Text.Encoding]::UTF8.GetString($bl.ToArray())
    Write-Host "  [+] Pesan ditemukan!" -ForegroundColor Green
    Write-Host ""
    Write-Host "  >> $decoded" -ForegroundColor Cyan
}
