$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.20.2/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.20.2/tree-sitter-windows-x64.gz'
  checksum       = '42fe565e7dcbd1e2f3cab8bf9816f8ccee714f5ec06598f6ea04a2fffba6f5d9'
  checksum64     = 'ab7b506af6e077d0ed1c96aa3f029dd7d79fb3264a00f0741f92e2ba543640a4'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
