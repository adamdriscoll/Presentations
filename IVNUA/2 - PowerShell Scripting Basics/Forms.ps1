
function New-Form {
$Form = New-Object system.windows.forms.form
$Form.Text = 'This is the window text!!'

$Button = New-Object System.Windows.Forms.Button
$Button.Text = 'Click me!!'
$Button.add_Click({ 1..10 | % { [System.Windows.Forms.MessageBox]::Show("Hey, IVNUA!!!!") } })

$Form.Controls.Add($Button)
$Form.ShowDialog()
}

New-Form