param(
    [ArgumentCompleter( {
            param ( $CommandName,
                $ParameterName,
                $WordToComplete,
                $CommandAst,
                $FakeBoundParameters )
            $packages = (Get-ChildItem -Directory -Path $PSScriptRoot\packages).Name
            $searchBlock = { $_ -like "$WordToComplete*" }
            $completion = $packages | Where-Object $searchBlock 
            return $completion
        })]
    [string]$PackageName
)

choco pack "$PSScriptRoot\packages\$PackageName\$PackageName.nuspec" --outputdirectory $PSScriptRoot\nupkgs