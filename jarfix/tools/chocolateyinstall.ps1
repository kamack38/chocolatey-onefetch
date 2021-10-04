$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://johann.loefflmann.net/downloads/jarfix.exe'
  url64bit       = 'https://johann.loefflmann.net/downloads/jarfix.exe'
  checksum       = '3A00C5B808954E9DCA76418506EACEC9CB1CB0FD844318A896EBAE787F5EAAE2'
  checksum64     = '3A00C5B808954E9DCA76418506EACEC9CB1CB0FD844318A896EBAE787F5EAAE2'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
