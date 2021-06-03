$XMLfile = "$env:Appdata\Adobe\CoreSync\plugins\livetype\c\entitlements.xml"
$outputFolder = "$env:userprofile\AdobeFontsExtracted" 
$fontlist = Get-ChildItem "$env:Appdata\Adobe\CoreSync\plugins\livetype\" -Filter *.*tf -Recurse | Select-Object -ExpandProperty Name
$xml = [xml](get-content $XMLfile)
$fonts = $xml.typekitSyncState.fonts.font

if (!(Test-Path -PathType Container $outputFolder)){
    New-Item -ItemType Directory -Force -Path $outputFolder
}

foreach ($font in $fonts){
    $id = $font.id
    $fontname = $font.properties.fullName 
    write-host Font name $fontname has id $id
    foreach ($file in $fontlist){
        if ($file -eq $id){
            copy-item -path "$env:userprofile\AppData\Roaming\Adobe\CoreSync\plugins\livetype\e\$file" -Destination  "$outputfolder\$fontname.ttf" -force
        }
    } 
}

exit
