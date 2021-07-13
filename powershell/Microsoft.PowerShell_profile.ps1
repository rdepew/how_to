# Aliases to run vi/vim from the command line
New-Alias -Name vi -Value 'C:\Program Files (x86)\vim\vim82\vim.exe'
New-Alias -Name vim -Value 'C:\Program Files (x86)\vim\vim82\vim.exe'

# Include this if you like a vim command line experience
# (This must be like 'set -o vi' in Linux)
Set-PSReadlineOption -EditMode vi -BellStyle None
# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
