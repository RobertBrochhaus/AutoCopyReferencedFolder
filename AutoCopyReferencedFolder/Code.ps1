# Load required assemblies 
[void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

$path = $args[0]

Add-Type -AssemblyName PresentationFramework

# Drawing form and controls
$Form_autoFolder = New-Object System.Windows.Forms.Form 
    $Form_autoFolder.Text = "AutoApplicationFolderCreator" 
    $Form_autoFolder.Size = new-Object System.Drawing.Size(400,220)
    $Form_autoFolder.FormBorderStyle = "FixedDialog"
    $Form_autoFolder.TopMost = $true 
    $Form_autoFolder.MaximizeBox = $false
    $Form_autoFolder.MinimizeBox = $false 
    $Form_autoFolder.ControlBox = $true 
    $Form_autoFolder.StartPosition = "CenterScreen"
    $Form_autoFolder.Font = "Segoe UI" 

# Adding a company label to my form 
$label_Company = New-Object System.Windows.Forms.Label
    $label_Company.Location = New-Object System.Drawing.Size(23,23) 
    $label_Company.Size = New-Object System.Drawing.Size(132, 32)
    $label_Company.TextAlign = "MiddleLeft"
    $label_Company.Text = "Company"
    $Form_autoFolder.Controls.Add($label_Company)

# Adding a company Textbox to my form 
$textBox_Company = New-Object System.Windows.Forms.TextBox
    $textBox_Company.Location = New-Object System.Drawing.Size(160,32) 
    $textBox_Company.Size = New-Object System.Drawing.Size(192, 32)
    $textBox_Company.TextAlign = "Left"
    $textBox_Company.Text = "Company"
    $Form_autoFolder.Controls.Add($textBox_Company)

    # Adding a ProjectName label to my form 
$label_Role = New-Object System.Windows.Forms.Label
    $label_ProjectName.Location = New-Object System.Drawing.Size(23,73) 
    $label_ProjectName.Size = New-Object System.Drawing.Size(132, 32)
    $label_ProjectName.TextAlign = "MiddleLeft"
    $label_ProjectName.Text = "ProjectName"
    $Form_autoFolder.Controls.Add($label_ProjectName)

# Adding a company Textbox to my form 
$textBox_ProjectName = New-Object System.Windows.Forms.TextBox
    $textBox_ProjectName.Location = New-Object System.Drawing.Size(160,82) 
    $textBox_ProjectName.Size = New-Object System.Drawing.Size(192, 32)
    $textBox_ProjectName.TextAlign = "Left"
    $textBox_ProjectNamee.Text = "ProjectName"
    $Form_autoFolder.Controls.Add($textBox_ProjectName)

# add a button 

$button_CLickMe = New-Object System.Windows.Forms.Button
    $button_CLickMe.Location = New-Object System.Drawing.Size(23, 123)
    $button_CLickMe.Size = New-Object System.Drawing.Size(192, 32)
    $button_CLickMe.TextAlign = "MiddleCenter"
    $button_CLickMe.Text = "Click Me"
    $button_CLickMe.Add_Click({
        write-host

        $folderName = (Get-Date).tostring("yyyyMMdd") + "_" + $textBox_Company.Text + "_" + $textBox_ProjectName.Text
        $relativePath = New-Item -itemType Directory -Name $folderName| Resolve-Path
        $copyFromSource = Copy-Item \Documents\AutoApplicationFolderCreator\Src\* -Destination $folderName -Recurse
        
        stop-process -Id $PID
        })
          
    $Form_autoFolder.Controls.Add($button_CLickMe)

# show form 
$Form_autoFolder.Add_Shown({$Form_autoFolder.Activate()})
[void] $Form_autoFolder.ShowDialog() 