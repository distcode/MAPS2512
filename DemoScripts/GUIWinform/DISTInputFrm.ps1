<#	
	.NOTES
	===========================================================================
	 Created on:   	12.10.2016
	 Created by:   	DI Thomas Schleich
	 Organization: 	DIST
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>

#region Formdefinition
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

$myForm = New-Object System.Windows.Forms.Form
$myForm.Text = "Userinformation"
$myForm.Size = New-Object System.Drawing.Size(380,140)

$mylblVorname = New-Object System.Windows.Forms.Label
$mylblVorname.Location = New-Object System.Drawing.Size(10, 20)
$mylblVorname.Size = New-Object System.Drawing.Size(75, 20)
$mylblVorname.Text = “Vorname:”
$myForm.Controls.Add($mylblVorname)

$mytxtVorname = New-Object System.Windows.Forms.TextBox
$mytxtVorname.Location = New-Object System.Drawing.Size(85, 20)
$mytxtVorname.Size = New-Object System.Drawing.Size(260, 20)
$mytxtVorname.Text = “Vorname”
$mytxtVorname.Name = "txtVorname"
$myForm.Controls.Add($mytxtVorname)

$mylblNachname = New-Object System.Windows.Forms.Label
$mylblNachname.Location = New-Object System.Drawing.Size(10,40)
$mylblNachname.size = New-Object System.Drawing.Size(75,20)
$mylblNachname.Text = "Nachname:"
$myForm.Controls.Add($mylblNachname)

$mytxtNachname = New-Object System.Windows.Forms.TextBox
$mytxtNachname.Location = New-Object System.Drawing.Size(85,40)
$mytxtNachname.Size = New-Object System.Drawing.Size(260,40)
$mytxtNachname.Text = "Nachname"
$mytxtNachname.Name = "txtNachname"
$myform.controls.Add($mytxtNachname)

$mylblUnix = New-Object System.Windows.Forms.Label
$mylblUnix.Location = New-Object System.Drawing.Size(10,60)
$mylblUnix.Size = New-Object System.Drawing.Size(75,20)
$mylblUnix.Text = "Unix:"
$myForm.Controls.Add($mylblUnix)

$mychkUnix = New-Object System.Windows.Forms.CheckBox
$mychkUnix.location = New-Object System.Drawing.Size(85,60)
# $mychkUnix.Size nicht notwendig
$mychkUnix.Name = "chkUnix"
$mychkUnix.Checked = $false
$myForm.controls.Add($mychkUnix)

$myBtnOK = New-Object System.Windows.Forms.Button
$myBtnOK.Location = New-Object System.Drawing.Size(195, 65)
$myBtnOK.Size = New-Object System.Drawing.Size(75, 25)
$myBtnOK.Text = "OK"
$myBtnOK.Name = "btnOK"
$myBtnOK.DialogResult = "OK"
$myBtnOK.Add_Click({ $myForm.Close() })
$myForm.Controls.Add($myBtnOK)
$myForm.AcceptButton = $myBtnOK

$myBtnCancel = New-Object System.Windows.Forms.Button
$myBtnCancel.Location = New-Object System.Drawing.Size(270, 65)
$myBtnCancel.Size = New-Object System.Drawing.Size(75, 25)
$myBtnCancel.Name = "btnCancel"
$myBtnCancel.Text = “Cancel”
$myBtnCancel.DialogResult = “Cancel”
$myBtnCancel.Add_Click({ $myForm.Close() })
$myForm.Controls.Add($myBtnCancel)
#endregion


$myForm.add_Shown({$myForm.Activate()})
[void] $myForm.ShowDialog()

If ($myForm.DialogResult -like “OK”)
{
	# "Es soll der User {0} angelegt werden." -f ($mytxtVorname.Text + " " + $mytxtNachname.Text)

	$result = New-Object -TypeName psobject
	$result | Add-Member -MemberType NoteProperty -Name Vorname -Value $mytxtVorname.Text
	$result | Add-Member -MemberType NoteProperty -Name Nachname -Value $mytxtNachname.Text
	$result | add-member -MemberType NoteProperty -Name UnixUser -Value $mychkUnix.Checked

	return $result
}
else
{
	return $null
}
