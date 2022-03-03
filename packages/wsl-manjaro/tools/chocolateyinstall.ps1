﻿$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$exePath = Join-Path $toolsDir "Manjaro.exe"
$rootfsPath = Join-Path $toolsDir 'rootfs.tar.gz'

$packageArgs = @{
  packageName   = $packageName
  url           = 'https://github.com/sileshn/ManjaroWSL/releases/download/20220227/ManjaroWSL.zip'
  checksum      = 'eae9029892ffdaa7d6364a0f45140733b573932de2f7fabc099e58f605cc2a08'
  checksumType  = 'sha256'
  unzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
New-Item -Path "$exePath.ignore" -ItemType File
Start-Process -FilePath $exePath

$installable = $true
wsl --set-default-version 2

& $exePath isregd
if ($?) {
  Write-Warning 'ManjaroWsl is already registered'
  exit 1
}

if ($installable) {
  $res = Start-Process -FilePath $exePath -ArgumentList 'install', $rootfsPath
  if (!$res) { Write-Error 'ManjaroWsl installation failed!'; exit 1 }
}
