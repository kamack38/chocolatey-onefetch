$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.20.1/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.20.1/tree-sitter-windows-x64.gz'
  checksum       = 'ab841dd96d0fa0fa1940676161de2d7ae72dac05bcb28cfe75b3a6aded704573'
  checksum64     = '741cb8d8745e2feea32e303876d6dea664fa246f5b4e0a5b849eea173304bec7'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
