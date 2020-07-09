Write-Host "Cleaning folders" -ForegroundColor Green
remove-item .\BlazorPresentation\bin -Recurse -Force
remove-item .\BlazorPresentation\obj -Recurse -Force

Write-Host "Removing previous releases" -ForegroundColor Green
Remove-Item .\docs\* -Recurse -Force -Exclude "404.html",".nojekyll"

Write-Host "Building" -ForegroundColor Green
dotnet publish -r win-x64 -c Release -o ./release

Write-Host "Copy files to docs" -ForegroundColor Green
Copy-Item -Path .\release\wwwroot\* -Destination .\docs

Start-Sleep -Seconds 1

Write-Host "Modify index" -ForegroundColor Green
$IndexContent = Get-Content -Path .\docs\index.html
$IndexContent = $IndexContent -replace '<base href="/" />', '<base href="https://kelvysb.github.io/BlazorPresentation/" />'
Set-Content -Path .\docs\index.html -Value $IndexContent

Write-Host "Remove temp folder" -ForegroundColor Green
remove-item .\release -Recurse -Force

pause