# MOSNAR (RANSOM spelled in reverse)

Ransomware Detection Test PowerShell Script

This small script process the files inside the "files" directory and 
XOR each one with the key 0x13.

Adds the extension ".enc" to each file.

If detects that the file already has the extension ".enc", it removes 
the extension.

So, if you run the script two times, all the changes of the first run 
are reverted to the original state (is the magic of XOR).

The purpouse of this script is to test anti-ransomware solutions, to 
check if can detect the behaviour.
