$Driver = Start-SeChrome
Enter-SeUrl -Driver $Driver -Url "http://localhost:5000"

#Find by ID 

$Element = Find-SeElement -Driver $Driver -Id 'datePicker'
$Element | Get-Member

# Find by Class Name

Find-SeElement -Driver $Driver -ClassName 'myClass'

# Find by Tag

Find-SeElement -Driver $Driver -TagName 'img'

# Find Child Elements

$Element = Find-SeElement -Driver $Driver -Id list
Find-SeElement -TagName li -Element $Element | Measure-Object

# Find Element Text 

(Find-SeElement -Driver $Driver -Id typo).Text

# Clicking 

Find-SeElement -Driver $Driver -Id button | Invoke-SeClick

# Sending Key Strokes

$Element = Find-SeElement -Driver $Driver -Id textbox
Send-SeKeys -Element $Element -Keys "Hello, there!"

# Wait for Elements to Appear

Find-SeElement -Driver $Driver -Id add | Invoke-SeClick
Find-SeElement -Driver $Driver -Id 'child'
