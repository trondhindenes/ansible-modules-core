#!powershell
# (c) 2014, Trond Hindenes <trond@hindenes.com>, and others
#
# This file is part of Ansible
#
# Ansible is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Ansible is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Ansible.  If not, see <http://www.gnu.org/licenses/>.

# WANT_JSON
# POWERSHELL_COMMON


$params = Parse-Args $args;
$result = New-Object psobject;
Set-Attr $result "changed" $false;

$path = Get-Attr -obj $params -name env_path -failifempty $true -resultobj $result
$ensure = Get-Attr -obj $params -name ensure -default "present"

#Get the current env listing
$oldPath=[System.Environment]::GetEnvironmentVariable("path")
$aroldpaths = $oldpath.split(";")
if (($aroldpaths -contains $path) -and ($ensure -eq "present"))
{
    #NoChange
}
elseif (($aroldpaths -notcontains $path) -and ($ensure -eq "present"))
{
    #add it
    $newPath=$oldPath+";$path"
    $newPath=$newPath.replace(";;",";")
    try
    {
        [System.Environment]::SetEnvironmentVariable("path",$NewPath)
    }
    Catch
    {
        $errormsg = $_[0].exception
        Fail-Json -obj $result -message $errormsg.ToString()
    }
    Set-Attr $result "changed" $true;
}
Set-attr $result "path" $path
Exit-Json -obj $result
