# Uninstall-Master

This PowerShell script is designed to uninstall any installed instances of the software from a Windows machine.

## Description

The script searches for all installed software that matches the name in the variable "softwareName" and uninstalls each instance found. It uses WMI (Windows Management Instrumentation) to query installed products and performs the uninstallation process.

## Usage

1. Open PowerShell with administrative privileges.
2. Copy and paste the script into the PowerShell window or save it as a `.ps1` file and run it.

## Script

```powershell
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
