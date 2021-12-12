$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://downloads.mirillis.com/files/action_4_24_0_setup.exe'
  checksum       = '9c34d60ee72f279481fe04d7b9fba2480be2fe12c797eef95b6600155b7f3ed6'
  checksumType   = 'sha256'
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
