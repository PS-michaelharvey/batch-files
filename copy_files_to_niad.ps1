$runconfig = Read-Host "Choose a command: `n<1> copy local AM debug to niad `n<2> copy local PLM debug to niad `n<3> copy both to niad `n"

$pathlocalplm = "C:\Users\Michael Harvey\Git\Core\PLManager\bin\Debug"
$pathlocalam = "C:\Users\Michael Harvey\Git\Core\_src\AutoMatchTestHarness\bin\Debug"
$pathniadam = "\\niad01\CommonShare\Project Files\Automatch\AutomatchFramework4.6"
$pathniadplm = "\\niad01\CommonShare\Project Files\PLManager\PLM5.2"

if ($runconfig -eq 1) {

    start \\niad01
    
    $check2 = Test-Path $pathlocalam
    $check3 = Test-Path $pathniadam
    
    if ($check2 -And $check3) {
        
        Remove-Item -Path $pathniadam\* -Include *.dll,*.exe
        
        Copy-Item -Path $pathlocalam\* -Destination $pathniadam -Include *.dll,*.exe
        
        Write-Host "Files copied"   
    }
    else {
    
        Write-Host "path not found"
    }
}
elseif ($runconfig -eq 2) {

    start \\niad01
    $check1 = Test-Path $pathlocalplm
    $check2 = Test-Path $pathniadplm
    
    if ($check1 -And $check2) {
    
        Remove-Item -Path $pathniadplm\* -Include *.dll,*.exe
        
        Copy-Item -Path $pathlocalplm\* -Destination $pathniadplm -Include *.dll,*.exe
        
        Write-Host "Files copied"
    }
    else {
    
        Write-Host "path not found"
    }
}
elseif ($runconfig -eq 3) {

    start \\niad01
    
    $check3 = Test-Path $pathlocalam
    $check2 = Test-Path $pathniadam
    $check4 = Test-Path $pathlocalplm
    $check5 = Test-Path $pathniadplm
    
    if ($check2 -And $check3 -And $check4 -And $check5) {
    
        Remove-Item -Path $pathniadplm\* -Include *.dll,*.exe
        
        Copy-Item -Path $pathlocalplm\* -Destination $pathniadplm -Include *.dll,*.exe
        
        Remove-Item -Path $pathniadam\* -Include *.exe,*.dll
        
        Copy-Item -Path $pathlocalam\* -Destination $pathniadam -Include *.dll,*.exe
        
        Write-Host "Files copied"
    }
    else {
        Write-Host "path not found"
    }
}    
else {
    Write-Host "Unrecognized run config"
}