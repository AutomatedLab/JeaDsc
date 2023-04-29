task InjectScriptCode {

    $uri = 'https://raw.githubusercontent.com/iRon7/ConvertTo-Expression/master/ConvertTo-Expression.ps1'
    $moduleFilePath = Join-Path -Path $SourcePath -ChildPath 'Modules\ConvertToExpression\ConvertToExpression.psm1'

    $functionContent = Invoke-WebRequest -Uri $uri -UseBasicParsing | Select-Object -ExpandProperty Content
    $moduleFileContent = Get-Content -Path $moduleFilePath -Raw
    $moduleFileContent = $moduleFileContent.Replace("'TOBEREPACED'", $functionContent)

    $moduleFileContent | Set-Content -Path $moduleFilePath -Encoding UTF8

}
