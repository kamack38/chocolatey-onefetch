Import-Module au

$releases = 'https://blitz-stable.blitz.gg/'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $request = Invoke-WebRequest -Uri $releases -UseBasicParsing

    [xml]$doc = $request.Content
    $file = ($doc.ListBucketResult.Contents | Sort-Object LastModified -Descending | Where-Object Key -Match "Blitz-.*.exe$").Key[0]
    $url = $releases + $file

    $version = $file -replace "Blitz-" -replace ".exe"

    return @{
        URL32   = $url
        Version = $version
    }
}

Update-Package -NoReadme
