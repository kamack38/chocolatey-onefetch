$ErrorActionPreference = 'Stop';

$packageName     = $env:chocolateyPackageName
$toolsDir        = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://lol.secure.dyn.riotcdn.net/channels/public/x/installer/current/live.eune.exe'
  checksum       = '3621E07823A028A6DB34903865892423E29DE943E3C1C99B1573B9C0AE9E8BE0'
  checksumType   = 'sha256'
  silentArgs     = '--skip-to-install'
}

Install-ChocolateyPackage @packageArgs
