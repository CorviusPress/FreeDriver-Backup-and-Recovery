Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# ========== COLOR PALETTE ==========
$PrimaryBlue      = [System.Drawing.Color]::FromArgb(100, 149, 237)
$PrimaryBlueHover = [System.Drawing.Color]::FromArgb(120, 170, 255)
$AccentRed        = [System.Drawing.Color]::FromArgb(220, 20, 60)
$WindowBack       = [System.Drawing.Color]::FromArgb(245, 245, 245)
$PanelBack        = [System.Drawing.Color]::FromArgb(235, 235, 235)
$TextColor        = [System.Drawing.Color]::FromArgb(40, 40, 40)

# ========== ROUNDED BUTTONS ==========
function Set-RoundedCorners {
    param([System.Windows.Forms.Button]$button, [int]$radius = 8)

    $path = New-Object System.Drawing.Drawing2D.GraphicsPath
    $path.AddArc(0, 0, $radius, $radius, 180, 90)
    $path.AddArc($button.Width - $radius, 0, $radius, $radius, 270, 90)
    $path.AddArc($button.Width - $radius, $button.Height - $radius, $radius, $radius, 0, 90)
    $path.AddArc(0, $button.Height - $radius, $radius, $radius, 90, 90)
    $path.CloseFigure()
    $button.Region = New-Object System.Drawing.Region($path)
}

# ========== for BUTTON ICONS compability ==========
function Set-ButtonIcon {
    param([System.Windows.Forms.Button]$button, [string]$emoji)
    $button.Text = "$emoji  $($button.Text)"
}

# ========== MAIN WINDOW (10% HIGHER) ==========
$form = New-Object System.Windows.Forms.Form
$form.Text = "Backup and Restore Drivers 🧑‍💻 By Curvius Press"
$form.Size = New-Object System.Drawing.Size(520, 480)   # ← increased height
$form.StartPosition = "CenterScreen"
$form.BackColor = $WindowBack
$form.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$form.ForeColor = $TextColor
$form.FormBorderStyle = 'FixedDialog'
$form.MaximizeBox = $false

# ========== HEADER PANEL ==========
$headerPanel = New-Object System.Windows.Forms.Panel
$headerPanel.Location = New-Object System.Drawing.Point(0, 0)
$headerPanel.Size = New-Object System.Drawing.Size($form.ClientSize.Width, 50)
$headerPanel.BackColor = [System.Drawing.Color]::FromArgb(230, 235, 245)
$headerPanel.Anchor = "Top, Left, Right"
$form.Controls.Add($headerPanel)

# ========== CENTERED HEADER LABEL ==========
$headerLabel = New-Object System.Windows.Forms.Label
$headerLabel.Text = "Backup and Restore Driver"
$headerLabel.Location = New-Object System.Drawing.Point(0, 0)
$headerLabel.Size = New-Object System.Drawing.Size($headerPanel.Width, 50)
$headerLabel.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
$headerLabel.ForeColor = $TextColor
$headerLabel.TextAlign = 'MiddleCenter'
$headerLabel.AutoSize = $false
$headerPanel.Controls.Add($headerLabel)

# ========== MAIN PANEL (10% HIGHER) ==========
$mainPanel = New-Object System.Windows.Forms.Panel
$mainPanel.Location = New-Object System.Drawing.Point(10, 60)
$mainPanel.Size = New-Object System.Drawing.Size(490, 400)  
$mainPanel.BackColor = $PanelBack
$mainPanel.BorderStyle = 'FixedSingle'
$form.Controls.Add($mainPanel)

# ========== LABEL + PATH TEXTBOX ==========
$label = New-Object System.Windows.Forms.Label
$label.Text = "Destination folder:"
$label.Location = New-Object System.Drawing.Point(15, 15)
$label.Size = New-Object System.Drawing.Size(130, 20)
$label.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
$label.ForeColor = $TextColor
$mainPanel.Controls.Add($label)

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(15, 40)
$textBox.Size = New-Object System.Drawing.Size(340, 24)
$textBox.BackColor = [System.Drawing.Color]::White
$textBox.ForeColor = $TextColor
$textBox.BorderStyle = 'FixedSingle'
$mainPanel.Controls.Add($textBox)

$browseButton = New-Object System.Windows.Forms.Button
$browseButton.Text = "Browse..."
$browseButton.Location = New-Object System.Drawing.Point(365, 38)
$browseButton.Size = New-Object System.Drawing.Size(100, 28)
$browseButton.BackColor = [System.Drawing.Color]::FromArgb(230, 230, 230)
$browseButton.font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
$browseButton.ForeColor = $TextColor
$browseButton.FlatStyle = 'Flat'
$browseButton.FlatAppearance.BorderSize = 0
$mainPanel.Controls.Add($browseButton)
Set-RoundedCorners $browseButton
Set-ButtonIcon $browseButton ""

$browseButton.Add_MouseEnter({ $browseButton.BackColor = [System.Drawing.Color]::FromArgb(210, 210, 210) })
$browseButton.Add_MouseLeave({ $browseButton.BackColor = [System.Drawing.Color]::FromArgb(230, 230, 230) })

$browseButton.Add_Click({
    $folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
    if ($folderBrowser.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        $textBox.Text = $folderBrowser.SelectedPath
    }
})

# ========== BUTTON STYLE FUNCTION ==========
function Style-Button {
    param([System.Windows.Forms.Button]$button, [System.Drawing.Color]$baseColor)

    $button.FlatStyle = 'Flat'
    $button.BackColor = $baseColor
    $button.ForeColor = [System.Drawing.Color]::White
    $button.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
    $button.FlatAppearance.BorderSize = 0
    $button.Tag = $baseColor

    Set-RoundedCorners $button

    $button.Add_MouseEnter({
        param($sender)
        if ($sender.Tag -eq $AccentRed) {
            $sender.BackColor = [System.Drawing.Color]::FromArgb(200, 30, 70)
        } else {
            $sender.BackColor = $PrimaryBlueHover
        }
    })

    $button.Add_MouseLeave({
        param($sender)
        $sender.BackColor = $sender.Tag
    })
}

# ========== ACTION BUTTONS ==========
$backupButton = New-Object System.Windows.Forms.Button
$backupButton.Text = "Start backup"
$backupButton.Location = New-Object System.Drawing.Point(15, 80)
$backupButton.Size = New-Object System.Drawing.Size(140, 32)
Style-Button $backupButton $PrimaryBlue
Set-ButtonIcon $backupButton ""
$mainPanel.Controls.Add($backupButton)

$restoreButton = New-Object System.Windows.Forms.Button
$restoreButton.Text = "Restore drivers"
$restoreButton.Location = New-Object System.Drawing.Point(170, 80)
$restoreButton.Size = New-Object System.Drawing.Size(140, 32)
Style-Button $restoreButton $PrimaryBlue
Set-ButtonIcon $restoreButton ""
$mainPanel.Controls.Add($restoreButton)

$exitButton = New-Object System.Windows.Forms.Button
$exitButton.Text = "Close"
$exitButton.Location = New-Object System.Drawing.Point(325, 80)
$exitButton.Size = New-Object System.Drawing.Size(140, 32)
Style-Button $exitButton $AccentRed
Set-ButtonIcon $exitButton "❌"
$mainPanel.Controls.Add($exitButton)
$exitButton.Add_Click({ $form.Close() })

# ========== PROGRESS BAR ==========
$progressLabel = New-Object System.Windows.Forms.Label
$progressLabel.Text = "Progress:"
$progressLabel.Location = New-Object System.Drawing.Point(15, 120)
$progressLabel.ForeColor = $TextColor
$mainPanel.Controls.Add($progressLabel)
# Label en BOLD
$progressLabel.font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
$progressBar = New-Object System.Windows.Forms.ProgressBar
$progressBar.Location = New-Object System.Drawing.Point(15, 145)
$progressBar.Size = New-Object System.Drawing.Size(450, 18)
$progressBar.Style = 'Continuous'
$mainPanel.Controls.Add($progressBar)

# ========== LOG TEXTBOX ==========
$outputBox = New-Object System.Windows.Forms.TextBox
$outputBox.Location = New-Object System.Drawing.Point(15, 175)
$outputBox.Size = New-Object System.Drawing.Size(450, 160)
$outputBox.Multiline = $true
$outputBox.ScrollBars = "Vertical"
$outputBox.ReadOnly = $true
$outputBox.BackColor = [System.Drawing.Color]::White
$outputBox.ForeColor = $TextColor
$outputBox.BorderStyle = 'FixedSingle'
$mainPanel.Controls.Add($outputBox)

# ========== SAVE LOG BUTTON ==========
$saveLogButton = New-Object System.Windows.Forms.Button
$saveLogButton.Text = "Save log"
$saveLogButton.Location = New-Object System.Drawing.Point(15, 345)
$saveLogButton.Size = New-Object System.Drawing.Size(140, 32)
Style-Button $saveLogButton $PrimaryBlue
Set-ButtonIcon $saveLogButton ""
$mainPanel.Controls.Add($saveLogButton)

$saveLogButton.Add_Click({
    $path = "$env:USERPROFILE\Desktop\DriverLog_$(Get-Date -Format 'yyyy-MM-dd_HH-mm-ss').txt"
    $outputBox.Text | Out-File -FilePath $path -Encoding UTF8
    [System.Windows.Forms.MessageBox]::Show("Log saved to:`n$path","Saved","OK","Information")
})

# ========== DARK MODE SWITCH ON OFF ==========
$themeSwitch = New-Object System.Windows.Forms.CheckBox
$themeSwitch.Text = "Dark Mode"
$themeSwitch.Location = New-Object System.Drawing.Point(360, 350)
$themeSwitch.AutoSize = $true
$mainPanel.Controls.Add($themeSwitch)

$themeSwitch.Add_CheckedChanged({
    if ($themeSwitch.Checked) {
        $form.BackColor = [System.Drawing.Color]::FromArgb(30,30,30)
        $mainPanel.BackColor = [System.Drawing.Color]::FromArgb(45,45,45)
        $headerPanel.BackColor = [System.Drawing.Color]::FromArgb(50,50,50)
        $form.ForeColor = [System.Drawing.Color]::White
        $headerLabel.ForeColor = [System.Drawing.Color]::White
        $label.ForeColor = [System.Drawing.Color]::White
        $progressLabel.ForeColor = [System.Drawing.Color]::White
        $outputBox.BackColor = [System.Drawing.Color]::FromArgb(20,20,20)
        $outputBox.ForeColor = [System.Drawing.Color]::White
        $textBox.BackColor = [System.Drawing.Color]::FromArgb(20,20,20)
        $textBox.ForeColor = [System.Drawing.Color]::White
    }
    else {
        $form.BackColor = $WindowBack
        $mainPanel.BackColor = $PanelBack
        $headerPanel.BackColor = [System.Drawing.Color]::FromArgb(230,235,245)
        $form.ForeColor = $TextColor
        $headerLabel.ForeColor = $TextColor
        $label.ForeColor = $TextColor
        $progressLabel.ForeColor = $TextColor
        $outputBox.BackColor = [System.Drawing.Color]::White
        $outputBox.ForeColor = $TextColor
        $textBox.BackColor = [System.Drawing.Color]::White
        $textBox.ForeColor = $TextColor
    }
})

# ========== BACKUP LOGIC ==========
$backupButton.Add_Click({
    $backupPath = $textBox.Text
    if ([string]::IsNullOrWhiteSpace($backupPath)) {
        [System.Windows.Forms.MessageBox]::Show("Select the destination folder.","Error","OK","Error")
        return
    }

    if (!(Test-Path $backupPath)) {
        try { New-Item -ItemType Directory -Path $backupPath -Force | Out-Null }
        catch {
            [System.Windows.Forms.MessageBox]::Show("Cannot create the folder.","Error","OK","Error")
            return
        }
    }

    $outputBox.Text = "🟢 Exporting drivers to: $backupPath`r`n"
    $progressBar.Value = 0

    try {
        dism /online /export-driver /destination:$backupPath
        $outputBox.AppendText("✅ Export complete.`r`n")

        $infFiles = Get-ChildItem -Path $backupPath -Recurse -Filter *.inf
        $total = $infFiles.Count

        if ($total -gt 0) {
            $i = 0
            foreach ($inf in $infFiles) {
                Start-Sleep -Milliseconds 30
                $i++
                $percent = [math]::Round(($i / $total) * 100)
                $progressBar.Value = $percent
                $outputBox.AppendText("📦 Prepared: $($inf.Name) ($percent%)`r`n")
            }
        } else {
            $outputBox.AppendText("⚠️ No .inf files found.`r`n")
        }

    } catch {
        $outputBox.AppendText("❌ Error exporting drivers: $($_.Exception.Message)`r`n")
    }

    $progressBar.Value = 100
    $outputBox.AppendText("🎉 Backup complete.`r`n")
    $close = [System.Windows.Forms.MessageBox]::Show("Backup completed. Do you want to close the application?", "Done", "YesNo", "Question")
    if ($close -eq [System.Windows.Forms.DialogResult]::Yes) {
        $form.Close()
    }
})

# ========== RESTORE LOGIC ==========
$restoreButton.Add_Click({
    $restorePath = $textBox.Text
    if ([string]::IsNullOrWhiteSpace($restorePath)) {
        [System.Windows.Forms.MessageBox]::Show("Select the folder.","Error","OK","Error")
        return
    }

    if (!(Test-Path $restorePath)) {
        [System.Windows.Forms.MessageBox]::Show("Folder does not exist.","Error","OK","Error")
        return
    }

    $outputBox.Text = "🔄 Restoring drivers from: $restorePath`r`n"
    $progressBar.Value = 0

    $infFiles = Get-ChildItem -Path $restorePath -Recurse -Filter *.inf
    $total = $infFiles.Count

    if ($total -eq 0) {
        $outputBox.AppendText("⚠️ No .inf files found.`r`n")
        return
    }

    $i = 0
    foreach ($inf in $infFiles) {
        try {
            $outputBox.AppendText("➡️ Installing: $($inf.FullName)`r`n")
            pnputil /add-driver "$($inf.FullName)" /install
            $outputBox.AppendText("✅ Done.`r`n")
        } catch {
            $outputBox.AppendText("❌ Error: $($inf.FullName)`r`n")
        }

        $i++
        $percent = [math]::Round(($i / $total) * 100)
        $progressBar.Value = $percent
    }

    $progressBar.Value = 100
    $outputBox.AppendText("🎉 Restoration complete.`r`n")
    $close = [System.Windows.Forms.MessageBox]::Show("Restoring completed. Do you want to close the application?", "Done", "YesNo", "Question")
    if ($close -eq [System.Windows.Forms.DialogResult]::Yes) {
        $form.Close()
    }
})

# ========== RUN application GUI ==========
[void]$form.ShowDialog()
