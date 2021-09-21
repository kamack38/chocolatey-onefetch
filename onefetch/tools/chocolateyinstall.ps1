$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$url64 = 'https://github.com/o2sh/onefetch/releases/download/v2.10.2/onefetch-win.tar.gz'
$checksum64  = 'B70A2199DC3371F8F56CD06A8DEAEC7B024D15CB83023968927A685DF48BE404'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url64Bit       = $url64
  checksum64     = $checksum64
  checksumType64 = "sha256"
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
$File = Get-ChildItem -File -Path $env:ChocolateyInstall\lib\$packageName\tools\ -Filter *.tar
Get-ChocolateyUnzip -fileFullPath $File.FullName -destination $env:ChocolateyInstall\lib\$packageName\tools\

$ShimArgs = @{
   Name     = 'onefetch'
   Path     = "$toolsDir\onefetch.exe"
}

Install-BinFile @ShimArgs