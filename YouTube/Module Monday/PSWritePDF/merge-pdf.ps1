$FilePath1 = "$PSScriptRoot\Example01_Simple.pdf"
$FilePath2 = "$PSScriptRoot\Example01_WithSections.pdf"

$OutputFile = "$PSScriptRoot\OutputDocument.pdf" # Shouldn't exist / will be overwritten

Merge-PDF -InputFile $FilePath1, $FilePath2 -OutputFile $OutputFile

$PDF = get-pdf .\OutputDocument.pdf 
Get-PDFDetails -Document $PDF
.\OutputDocument.pdf 