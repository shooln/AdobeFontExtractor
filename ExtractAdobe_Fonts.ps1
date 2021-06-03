$XMLfile = "$env:Appdata\Adobe\CoreSync\plugins\livetype\c\entitlements.xml"
$outputFolder = "$env:userprofile\AdobeFontsExtracted" 
$fontlist = Get-ChildItem "$env:Appdata\Adobe\CoreSync\plugins\livetype\" -Recurse -force
$xml = [xml](get-content $XMLfile)
$fonts = $xml.typekitSyncState.fonts.font

if (!(Test-Path -PathType Container $outputFolder)){
    New-Item -ItemType Directory -Force -Path $outputFolder
}

foreach ($font in $fonts){
    $id = $font.id
    $fontname = $font.properties.fullName 
    write-host Font name $fontname has id $id
    foreach ($file in $fontlist ){
        if (($file | Select-Object -ExpandProperty Name )  -eq $id){
            copy-item -path ($file | Select-Object -ExpandProperty FullName) -Destination  "$outputfolder\$fontname.ttf" -force
        }
    } 
}

exit
