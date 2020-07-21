# Get all pages text
#Convert-PDFToText -FilePath "$PSScriptRoot\OutputDocument.pdf"

# Get page 1 text only
Convert-PDFToText -FilePath "$PSScriptRoot\OutputDocument.pdf" -Page 1