$Global:GlobalValue = 'Global'
$Script:ScriptValue = 'Script'
$LocalValue = 'Local'
function Start-LocalScope {
    $Global:GlobalValue
    $Script:ScriptValue
    $LocalValue
    
    $Local:MyLocalValue = 'Start-LocalScope'
    $Local:MyLocalValue
}

Start-LocalScope
$Local:MyLocalValue

function Start-LocalScope {
    $Local:LocalValue = 'Start-LocalScope'
    $Local:LocalValue 
}

Start-LocalScope

$Local:LocalValue
$Local:LocalValue = 'Local'


function Start-LocalScope {
    $Private:LocalValue = 'Start-LocalScope'
    $Private:LocalValue 
}

Start-LocalScope
$Local:LocalValue
$Private:LocalValue 



