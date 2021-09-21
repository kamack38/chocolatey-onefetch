$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$url = 'https://download01.logi.com/web/ftp/pub/techsupport/gaming/lghub_installer.exe'
$checksum  = '802CD10A7DA42F3D932B7D03EC02C6493F84E73F5A186A081AB4C91BF55F5A2D'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = $url
  checksum       = $checksum
  checksumType   = "sha256"
}

Install-ChocolateyPackage @packageArgs
