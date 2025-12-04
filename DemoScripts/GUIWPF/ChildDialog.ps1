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
   Title="Child"
   Topmost="True">
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
        <TextBlock Grid.Column="0" Grid.Row="0" Grid.ColumnSpan="2" Margin="5" Text="Bitte geben Sie eine Information ein:"/>

        <TextBox Name="TxtInformation" Grid.Column="1" Grid.Row="1" Margin="5"></TextBox>

        <StackPanel Orientation="Horizontal" HorizontalAlignment="Right" VerticalAlignment="Bottom" Margin="0,10,0,0" Grid.Row="3" Grid.ColumnSpan="2">
        <Button Name="ButOk" MinWidth="80" Height="22" Margin="5">OK</Button>
        <Button Name="ButCancel" MinWidth="80" Height="22" Margin="5">Cancel</Button>
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
# add more handlers
$window.ButCancel.add_Click(
  {
    $window.DialogResult = $false
  }
)

$window.ButOk.add_Click(
  {
    $window.DialogResult = $true
  }
)
#endregion Event Handlers

#region Manipulate Window Content
$null = $window.TxtInformation.Focus()
#endregion

# Show Window
$result = Show-WPFWindow -Window $window

#region Process results
if ($result -eq $true)
{
  $fResult = [PSCustomObject]@{
    childText = $window.TxtInformation.Text
  }
}
else
{
  $fResult = [PSCustomObject]@{
    childText = $null
  }
}
#endregion Process results

return $fResult