# Load necessary WPF assemblies
Add-Type -AssemblyName PresentationFramework

# Function to create a circular, frameless blinking reminder window that auto-closes
function Show-BlinkReminder {
    # Create a new WPF window without the top bar
    $window = New-Object System.Windows.Window
    $window.Title = "Eye Blink Reminder"
    $window.Width = 200
    $window.Height = 200
    $window.WindowStartupLocation = 'CenterScreen'
    $window.Topmost = $true
    $window.WindowStyle = 'None'        # Removes the title bar
    $window.ResizeMode = 'NoResize'     # Disables resizing
    $window.AllowsTransparency = $true  # Allows transparency for smooth edges
    $window.Background = [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.Color]::FromArgb(200, 255, 255, 0)) # Semi-transparent yellow background

    # Clip the window to make it circular
    $clip = New-Object System.Windows.Shapes.Path
    $clip.Data = New-Object System.Windows.Media.EllipseGeometry([System.Windows.Point]::new(100, 100), 100, 100)
    $window.Clip = $clip.Data

    # Create a label for the reminder message
    $label = New-Object System.Windows.Controls.Label
    $label.Content = "Blink!"
    $label.HorizontalAlignment = 'Center'
    $label.VerticalAlignment = 'Center'
    $label.FontSize = 24
    $label.Foreground = 'Black'
    $window.Content = $label

    # Create an animation for the window
    $animation = New-Object System.Windows.Media.Animation.DoubleAnimation
    $animation.From = 1
    $animation.To = 0.5
    $animation.AutoReverse = $true
    $animation.Duration = New-Object System.Windows.Duration([System.TimeSpan]::FromSeconds(0.5))
    $animation.RepeatBehavior = 'Forever'

    # Apply the animation to the window opacity
    $storyboard = New-Object System.Windows.Media.Animation.Storyboard
    [System.Windows.Media.Animation.Storyboard]::SetTarget($animation, $window)
    [System.Windows.Media.Animation.Storyboard]::SetTargetProperty($animation, [System.Windows.PropertyPath]::new('Opacity'))
    $storyboard.Children.Add($animation)
    $storyboard.Begin($window)

    # Use DispatcherTimer to close the window after 5 seconds
    $dispatcherTimer = New-Object System.Windows.Threading.DispatcherTimer
    $dispatcherTimer.Interval = [TimeSpan]::FromSeconds(5)
    $dispatcherTimer.Add_Tick({
        $dispatcherTimer.Stop()       # Stop the timer
        $window.Close()               # Close the window
    })
    $dispatcherTimer.Start()

    # Show the window as a modal dialog
    $window.ShowDialog() | Out-Null
}

# Loop to show the reminder every 5 minutes
while ($true) {
    Show-BlinkReminder
    Start-Sleep -Seconds 300
}
