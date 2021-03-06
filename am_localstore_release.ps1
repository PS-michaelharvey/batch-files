$runconfig = Read-Host "Choose a command:`n<1> Copy AM local release to processshare `n<2> Copy LocalStore local release to processshare"

$pathlocalam = "C:\Users\Michael Harvey\Git\Core\_src\AutoMatchTestHarness\bin\Release"
$pathamprod = "\\10.21.1.45\ProcessShare\Automatch"
$pathamcopy = "\\10.21.1.45\ProcessShare\Automatch - Copy"

$pathlocalstorelocal = "C:\Users\Michael Harvey\Git\Core\_src\LocalStoreImport\bin\Release"
$pathlocalstoreprod = "\\10.21.1.45\ProcessShare\LocalStoreCrawler"
$pathlocalstorecopy = "\\10.21.1.45\ProcessShare\LocalStoreCrawler\Backup"

#$desktop = "C:\Users\Michael Harvey\Desktop"

if ($runconfig -eq 1) {

    #start \\10.21.1.45 #test to see if connected
    
    $check2 = Test-Path $pathlocalam
    $check3 = Test-Path $pathamprod
    $check4 = Test-Path $pathamcopy
    
    if ($check2 -And $check3 -And $check4) 
    {
        $dest = $pathamcopy + "\$((Get-Date).ToString('yyyy-MM-dd'))"
        #Write-Host $dest
        
        New-Item -ItemType Directory -Path $dest
        
        Copy-Item -Path $pathamprod\* -Destination $dest -Include *.dll,*.exe
        
        Copy-Item -Path $pathlocalam\* -Destination $pathamprod -Include *.dll,*.exe
        
        Write-Host "Files copied"   
    }
    else {
        Write-Host "path not found"
    }
}
if ($runconfig -eq 2) {
    $check5 = Test-Path $pathlocalstorelocal
    $check6 = Test-Path $pathlocalstoreprod
    
    $dest = $pathlocalstorecopy + "\$((Get-Date).ToString('yyyy-MM-dd'))"
    
    New-Item -ItemType Directory -Path $dest
    
    Copy-Item -Path $pathlocalstoreprod\* -Destination $dest -Include *.dll,*.exe
        
    Copy-Item -Path $pathlocalstorelocal\* -Destination $pathlocalstoreprod -Include *.dll,*.exe
    
    Write-Host "Files copied"   
    
}








        #Copy-Item -Path $pathamprod\*.dll -Destination $dest
        #Copy-Item -Path $pathamprod\*.exe -Destination $dest
        
        
        
        #Copy-Item -Path $pathlocalam\*.dll -Destination $pathamprod
        #Copy-Item -Path $pathlocalam\*.exe -Destination $pathamprod