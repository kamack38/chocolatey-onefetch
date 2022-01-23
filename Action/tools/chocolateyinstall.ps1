$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ahkFile = Join-Path $toolsDir "chocolateyInstall.ahk"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://downloads.mirillis.com/files/action_4_24_3_setup.exe'
  checksum       = 'aacefa46cd44e43dc77668122d78a76cce3dbd5b9aee45705e7b886b9fa4b2bc'
  checksumType   = 'sha256'
  validExitCodes = @(0)
}

Write-Output "Running Autohotkey installer"

Start-Process -FilePath 'AutoHotkey' `
  -ArgumentList $ahkFile `
  -PassThru
Write-Output "Running Action installer"
Install-ChocolateyPackage @packageArgs
