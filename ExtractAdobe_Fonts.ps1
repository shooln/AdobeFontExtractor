$XMLfile = "$env:userprofile\AppData\Roaming\Adobe\CoreSync\plugins\livetype\c\entitlements.xml"
$outputFolder = "$env:userprofile\AdobeFontsExtracted" 
$edir = Get-ChildItem "$env:userprofile\AppData\Roaming\Adobe\CoreSync\plugins\livetype\e" | Select-Object -ExpandProperty Name
$rdir = Get-ChildItem "$env:userprofile\AppData\Roaming\Adobe\CoreSync\plugins\livetype\r" | Select-Object -ExpandProperty Name
$tdir = Get-ChildItem "$env:userprofile\AppData\Roaming\Adobe\CoreSync\plugins\livetype\t" | Select-Object -ExpandProperty Name
$udir = Get-ChildItem "$env:userprofile\AppData\Roaming\Adobe\CoreSync\plugins\livetype\u" | Select-Object -ExpandProperty Name
$wdir = Get-ChildItem "$env:userprofile\AppData\Roaming\Adobe\CoreSync\plugins\livetype\w" | Select-Object -ExpandProperty Name
$xdir = Get-ChildItem "$env:userprofile\AppData\Roaming\Adobe\CoreSync\plugins\livetype\x" | Select-Object -ExpandProperty Name
$xml = [xml](get-content $XMLfile)
$fonts = $xml.typekitSyncState.fonts.font

if (!(Test-Path -PathType Container $outputFolder)){
    New-Item -ItemType Directory -Force -Path $outputFolder
}

foreach ($font in $fonts){
    $id = $font.id
    $fontname = $font.properties.fullName 
    write-host Font name $fontname has id $id
    foreach ($file in $edir){
        if ($file -eq $id){
            copy-item -path "$env:userprofile\AppData\Roaming\Adobe\CoreSync\plugins\livetype\e\$file" -Destination  "$outputfolder\$fontname.ttf" -force
        }
    }
    foreach ($file in $rdir){
        if ($file -eq $id){
            copy-item -path "$env:userprofile\AppData\Roaming\Adobe\CoreSync\plugins\livetype\r\$file" -Destination  "$outputfolder\$fontname.ttf" -force
        }
    }
    foreach ($file in $tdir){
        if ($file -eq $id){
            copy-item -path "$env:userprofile\AppData\Roaming\Adobe\CoreSync\plugins\livetype\t\$file" -Destination  "$outputfolder\$fontname.ttf" -force
        }
    }
    foreach ($file in $udir){
        if ($file -eq $id){
            copy-item -path "$env:userprofile\AppData\Roaming\Adobe\CoreSync\plugins\livetype\u\$file" -Destination  "$outputfolder\$fontname.ttf" -force
        }
    }
    foreach ($file in $wdir){
        if ($file -eq $id){
            copy-item -path "$env:userprofile\AppData\Roaming\Adobe\CoreSync\plugins\livetype\w\$file" -Destination  "$outputfolder\$fontname.ttf" -force
        }
    }
    foreach ($file in $xdir){
        if ($file -eq $id){
            copy-item -path "$env:userprofile\AppData\Roaming\Adobe\CoreSync\plugins\livetype\x\$file" -Destination  "$outputfolder\$fontname.ttf" -force
        }
    } 
}

exit