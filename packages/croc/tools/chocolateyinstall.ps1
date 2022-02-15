$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v9.5.1/croc_9.5.1_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v9.5.1/croc_9.5.1_Windows-64bit.zip'
  checksum       = '9914cfe61e350780e8c8368823bf7f8d3556c20354853870d115a445aa372f87'
  checksum64     = 'b29852a14721c5459f79f7f9942c5d4ba3f44ddf7c30f23ec7d734806ae4e10b'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
