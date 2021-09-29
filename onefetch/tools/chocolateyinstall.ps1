$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/o2sh/onefetch/releases/download/v2.10.2/onefetch-win.tar.gz'
  url64bit       = 'https://github.com/o2sh/onefetch/releases/download/v2.10.2/onefetch-win.tar.gz'
  checksum       = 'b70a2199dc3371f8f56cd06a8deaec7b024d15cb83023968927a685df48be404'
  checksum64     = 'b70a2199dc3371f8f56cd06a8deaec7b024d15cb83023968927a685df48be404'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
$File = Get-ChildItem -File -Path $toolsDir -Filter *.tar
Get-ChocolateyUnzip -fileFullPath $File.FullName -destination $toolsDir
