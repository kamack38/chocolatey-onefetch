$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/BetterDiscord/Installer/releases/download/v1.1.1/BetterDiscord-Windows.exe'
  checksum       = '50ed26767c4866ebd94f76d23cb1c535df16d3f87840fb3dba3fd77409f00d0b'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
