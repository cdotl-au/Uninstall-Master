# Define the name of the software to uninstall
$softwareName = "Acrobat"
 
# Get a list of installed software matching the name
$software = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "*$softwareName*" }
 
# If software is found, uninstall each instance
if ($software) 
{
    foreach ($app in $software) 
    {
        Write-Host "Uninstalling $($app.Name)..."
        $app.Uninstall()
        Write-Host "Uninstallation of $($app.Name) complete."
    }
} 
else 
{
    Write-Host "No instances of $softwareName found."
}
