<#  .SYNOPSIS  
    MOSNAR - Ransomware detection test program
.DESCRIPTION  
    This script encrypts with XOR (key: 0x13) all the files inside
	the directory ".\files", and changes the extensions to ".enc".
	The purpouse is to check the if the ransomware detection tools
	of the system works. If you run it again, it will back files
	to original state.
.NOTES  
    File Name  : mosnar.ps1  
    Author     : Fabian Martinez Portantier
    Requires   : PowerShell V1
.LINK
	https://github.com/portantier/mosnar
#>

Get-ChildItem "./files" |
Foreach-Object {
	$file = $_
	$filename = $file.FullName;
	write-host $filename;
	
	if ($file -is [System.IO.DirectoryInfo]) { return }
	
	$data = [System.IO.File]::ReadAllBytes("$filename")
	
	$len = $data.Count
	$xored = New-Object Byte[] $len
	
	for($i=0; $i -lt $len ; $i++)
	{
		$xored[$i] = $data[$i] -bxor 0x13
	}
	
	if ($filename -match '.*\.pdf$')
	{
		$new_filename = "$($filename).enc"
	} else {
		$new_filename = $filename.Replace(".enc", "")
	}
	
	[System.IO.File]::WriteAllBytes("$new_filename", $xored)
	
	$file.Delete()
}
