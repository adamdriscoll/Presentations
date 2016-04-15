#ChangeACL.ps1
$Right="FullControl"

#The possible values for Rights are 
# ListDirectory, ReadData, WriteData 
# CreateFiles, CreateDirectories, AppendData 
# ReadExtendedAttributes, WriteExtendedAttributes, Traverse
# ExecuteFile, DeleteSubdirectoriesAndFiles, ReadAttributes 
# WriteAttributes, Write, Delete 
# ReadPermissions, Read, ReadAndExecute 
# Modify, ChangePermissions, TakeOwnership
# Synchronize, FullControl

$StartingDir=Read-Host "What directory do you want to start at?"
$Principal=Read-Host "What security principal do you want to grant" `
"$Right to? `n Use format domain\username or domain\group"

#define a new access rule.
#note that the $rule line has been artificially broken for print purposes.
#it needs to be one line. the online version of the script is properly
#formatted.
$rule=new-object System.Security.AccessControl.FileSystemAccessRule
($Principal,$Right,"Allow")

foreach ($file in $(Get-ChildItem $StartingDir -recurse)) {
  $acl=get-acl $file.FullName
 
  #Add this access rule to the ACL
  $acl.SetAccessRule($rule)
  
  #Write the changes to the object
  set-acl $File.Fullname $acl
  }
