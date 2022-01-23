$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.20.3/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.20.3/tree-sitter-windows-x64.gz'
  checksum       = 'b1347056b2844c0f5cdba0087e08e75e94a5dd8b21fb301b283e9165a02fb017'
  checksum64     = '62264da57da9d03f08bc6c17996dca5227511833c5843ec00c3d321e99163cf7'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
