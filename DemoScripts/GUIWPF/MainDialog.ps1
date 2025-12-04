#region XAML window definition
# Right-click XAML and choose WPF/Edit... to edit WPF Design
# in your favorite WPF editing tool
$xaml = @'
<Window
   xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
   xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
   MinWidth="200"
   Width ="400"
   SizeToContent="Height"
   Title="Main" Cursor="Pen">
    <Grid Margin="10,40,10,10">
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="Auto"/>
            <ColumnDefinition Width="*"/>
        </Grid.ColumnDefinitions>
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
        </Grid.RowDefinitions>

        <TextBlock Grid.Column="0" Grid.Row="1" Margin="5" Text="Information:"/>
        <TextBox Name="TxtInformation" Grid.Column="1" Grid.Row="1" Margin="5" IsEnabled="False"></TextBox>

        <StackPanel Orientation="Horizontal" HorizontalAlignment="Right" VerticalAlignment="Bottom" Margin="0,10,0,0" Grid.Row="3" Grid.ColumnSpan="2">
            <Button x:Name="ButEdit" MinWidth="80" Height="22" Margin="5" Content="Edit"/>
            <Button x:Name="ButShell" MinWidth="80" Height="22" Margin="5" Content="Shell" />
            <Button x:Name="ButClose" MinWidth="80" Height="22" Margin="5" Content="Close"/>
           
        </StackPanel>
    </Grid>
</Window>
'@
#endregion



#region Code Behind
function Convert-XAMLtoWindow
{
  param
  (
    [Parameter(Mandatory=$true)]
    [string]
    $XAML
  )
  
  Add-Type -AssemblyName PresentationFramework
  
  $reader = [XML.XMLReader]::Create([IO.StringReader]$XAML)
  $result = [Windows.Markup.XAMLReader]::Load($reader)
  $reader.Close()
  $reader = [XML.XMLReader]::Create([IO.StringReader]$XAML)
  while ($reader.Read())
  {
      $name=$reader.GetAttribute('Name')
      if (!$name) { $name=$reader.GetAttribute('x:Name') }
      if($name)
      {$result | Add-Member NoteProperty -Name $name -Value $result.FindName($name) -Force}
  }
  $reader.Close()
  $result
}

function Show-WPFWindow
{
  param
  (
    [Parameter(Mandatory=$true)]
    [Windows.Window]
    $Window
  )
  
  $result = $null
  $null = $window.Dispatcher.InvokeAsync{
    $result = $window.ShowDialog()
    Set-Variable -Name result -Value $result -Scope 1
  }.Wait()
  $result
}
#endregion Code Behind

#region Convert XAML to Window
$window = Convert-XAMLtoWindow -XAML $xaml 
#endregion

#region Define Event Handlers
# Right-Click XAML Text and choose WPF/Attach Events to
# add more 
$window.ButEdit.add_Click{
  # remove param() block if access to event information is not required
  param
  (
    [Parameter(Mandatory)][Object]$sender,
    [Parameter(Mandatory)][Windows.RoutedEventArgs]$e
  )
  
  #open child form
  $childwindow = .\ChildDialog.ps1
  #set result in Main
  $window.TxtInformation.Text = $childwindow.childText
}
$window.ButClose.add_Click{
  # remove param() block if access to event information is not required
  param
  (
    [Parameter(Mandatory)][Object]$sender,
    [Parameter(Mandatory)][Windows.RoutedEventArgs]$e
  )
  
  $window.DialogResult = $true
}
$window.ButShell.add_Click{
  # remove param() block if access to event information is not required
  param
  (
    [Parameter(Mandatory)][Object]$sender,
    [Parameter(Mandatory)][Windows.RoutedEventArgs]$e
  )
  
  Invoke-Item -Path C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
  
  #Alternative:
  # Start-Process -FilePath C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ArgumentList '-NoExit -Command "& { Get-Process p*  }"'
}





#endregion Event Handlers

#region Manipulate Window Content
$window.TxtInformation.Text = 'xxx'
$null = $window.TxtInformation.Focus()
$null = $window.ButClose.IsDefault = $true
#endregion

# Show Window
$result = Show-WPFWindow -Window $window

#region Process results
if ($result -eq $true)
{
  $myDialogResult = [PSCustomObject]@{
    EmployeeName = $window.TxtInformation.Text
  }
}

#endregion Process results

$myDialogResult
