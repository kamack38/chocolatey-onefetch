Import-Module au

$url = 'https://download01.logi.com/web/ftp/pub/techsupport/gaming/lghub_installer.exe'

function global:au_BeforeUpdate {
  $Latest.Checksum32 = Get-RemoteChecksum -Url $Latest.Url32 -Algorithm 'SHA256'
}

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    Invoke-WebRequest $url -o "$env:TEMP\lghub_installer.exe"
    $version = (Get-ChildItem -Path "$env:TEMP\lghub_installer.exe" | Select-Object -First 1).VersionInfo.FileVersion

    return @{
        URL     = $url
        Version = $version
    }
}

Update-Package
