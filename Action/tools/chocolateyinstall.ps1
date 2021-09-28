$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$url64 = 'https://downloads.mirillis.com/files/action_4_21_5_setup.exe'
$checksum64  = 'FB73D16647CFA2A26A6737F1576AD1654C09C118376D7D10455FD2DEB1C99856'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url64Bit       = $url64
  checksum64     = $checksum64
  checksumType64 = "sha256"
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
