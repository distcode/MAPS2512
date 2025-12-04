
$Caption = "Title of Box"
$Text = "This is the message."
$Buttons = [System.Windows.Forms.MessageBoxButtons]"AbortRetryIgnore"

# Den Text auf den Buttons kann man NICHT ändern !!!

$result = [System.Windows.Forms.MessageBox]::Show($Text,$Caption,$Buttons)

Switch ($result)
{
    "No"  { "No pressed." }
    "Yes" { "Yes pressed." }

    default { "$result clicked." }
}

# Find all Buttons
[System.Windows.Forms.MessageBoxButtons].GetEnumNames()

# Find the value of each button
[System.Windows.Forms.MessageBoxButtons].GetEnumValues().value__

# Show a nice table
[System.Windows.Forms.MessageBoxButtons].GetEnumNames() | % { "$([System.Windows.Forms.MessageBoxButtons]::$_.value__) $_" }