$ErrorActionPreference = 'Stop';

$packageName     = $env:chocolateyPackageName
$toolsDir        = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://lol.secure.dyn.riotcdn.net/channels/public/x/installer/current/live.eune.exe'
  checksum       = '3621e07823a028a6db34903865892423e29de943e3c1c99b1573b9c0ae9e8be0'
  checksumType   = 'sha256'
  silentArgs     = '--skip-to-install'
}

Install-ChocolateyPackage @packageArgs
