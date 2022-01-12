$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ahkFile = Join-Path $toolsDir "chocolateyUninstall.ahk"

$packageArgs = @{
  packageName  = $packageName
  validExitCodes = @(0)
}

Write-Output "Running Autohotkey uninstaller"

Start-Process -FilePath 'AutoHotKey' `
    -ArgumentList $ahkFile `
    -PassThru
Write-Output "Running Action uninstaller"
Uninstall-ChocolateyPackage @packageArgs