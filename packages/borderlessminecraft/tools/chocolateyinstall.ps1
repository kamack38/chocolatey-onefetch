$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = 'https://github.com/Mr-Technician/BorderlessMinecraft/releases/download/v1.3.2/BorderlessMinecraft.exe'
  checksum      = '6f8a72539ceebeb5d57c14b96c7b868ee8d1b6a8fc0e7ad2443883b3bafed28d'
  checksumType  = 'sha256'
  unzipLocation = $toolsDir
}

Install-ChocolateyPackage @packageArgs
