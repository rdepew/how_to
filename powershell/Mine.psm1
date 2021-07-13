# Navigation for SW QA stuff

function net64 {
    cd "C:\Windows\Microsoft.NET\Framework64\v4.0.30319"
}

function server {
    cd "C:\Program Files (x86)\AutoSol\Communication Manager\Server"
}

function dennis {
    cd $env:HOMEPATH"\OneDrive - AUTOSOL\Documents\SW QA stuff\ACM-6958 OPC-UA server\OPC_UA_Jan04_Server_folder"
}

function s61 {
    cd $env:HOMEPATH"\OneDrive - AUTOSOL\Documents\SW QA stuff\ACM-6958 OPC-UA server\Server61"
}

# General navigation

function home {
  cd $env:HOMEPATH
}

function mine {
    cd $env:HOMEPATH"\OneDrive - AUTOSOL\Documents\WindowsPowerShell\Modules\Mine"
}

# This one is to list the functions
function funcs {
    Get-ChildItem -Path Function:\* | more
}

function reload {
    echo "Sorry, you have to reload the Mine functions manually."
    echo "First enter the command 'mine' to go to the Modules\Mine directory."
    echo "Then enter the command 'Import-Module -Force .\Mine.psm1' ."
}

function docs {
    cd $env:HOMEPATH"\OneDrive - AUTOSOL\Documents"
}

function how {
    cd $env:HOMEPATH"\OneDrive - AUTOSOL\Documents\how_to"
}

function ws {
    cd $env:HOMEPATH"\OneDrive - AUTOSOL\Documents\workspace"
}

function cleanup {
    python3 $env:HOMEPATH"\OneDrive - AUTOSOL\Documents\workspace\cleanup_acm_files\cleanup_acm_files.py"
    cd $env:HOMEPATH"\OneDrive - AUTOSOL\how_to"
}

