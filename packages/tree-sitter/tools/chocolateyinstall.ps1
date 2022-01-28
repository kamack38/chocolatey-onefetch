$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.20.4/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.20.4/tree-sitter-windows-x64.gz'
  checksum       = '8e6230ddfc0496329c20f004aaea375f2cd1cb97a48e301fc0d6dd8b1aac638e'
  checksum64     = '4cebb2a439ee3615effa6f90a1357d491a079785d5055ad33d21dd098d51c1b9'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
