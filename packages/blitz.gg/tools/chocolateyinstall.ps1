$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://blitz-stable.blitz.gg/Blitz-1.16.23.exe'
  checksum       = '9a733f4bd6a726fbab94e7a18fe412dc28f99bebeadb2d078afe8c9ca292f072'
  checksumType   = 'sha256'
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
