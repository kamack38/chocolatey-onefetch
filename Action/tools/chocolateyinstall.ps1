$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ahkFile = Join-Path $toolsDir "chocolateyInstall.ahk"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://downloads.mirillis.com/files/action_4_24_2_setup.exe'
  checksum       = 'c010e507b8fae6e24ca57031164b41157be977fab160324311294d65870f3e5d'
  checksumType   = 'sha256'
  validExitCodes = @(0)
}

Write-Output "Running Autohotkey installer"

Start-Process -FilePath 'AutoHotkey' `
  -ArgumentList $ahkFile `
  -PassThru
Write-Output "Running Action installer"
Install-ChocolateyPackage @packageArgs
