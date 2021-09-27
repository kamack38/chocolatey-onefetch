$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$url64 = 'https://github.com/7coil/DiscordForOffice/releases/download/1.2/DiscordForOffice.exe'
$checksum64  = '847B0DA2BC7E3B641EA2DC0052D35EF644727DF076CDB207CAFA919E80590127'
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
