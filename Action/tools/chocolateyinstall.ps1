$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://downloads.mirillis.com/files/action_4_21_5_setup.exe'
  checksum       = 'FB73D16647CFA2A26A6737F1576AD1654C09C118376D7D10455FD2DEB1C99856'
  checksumType   = 'sha256'
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
