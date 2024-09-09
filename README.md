# EyeBlinker
A PowerShell script that reminds me to blink every 5 minutes| How to create a task in windows task scheduler 



## Save the Script

Save the above script as BlinkReminder.ps1 in a directory you can easily find, like C:\Scripts\BlinkReminder.ps1.

## Set Up Task Scheduler

### Create a New Task:

Click on “Create Task…” in the right-hand pane.
In the General tab, give your task a name, like “Blink Reminder.”
Select “Run only when the user is logged on” to avoid permission issues.
Check “Run with highest privileges” to make sure it runs without interruptions.
Set Up a Trigger:

Go to the Triggers tab and click “New…”.
Set the task to trigger “At log on” and click OK.
Define the Action:

Go to the Actions tab and click “New…”.
Choose “Start a program” as the action.
In the Program/script box, type powershell.exe.
In the Add arguments (optional) box, enter : -WindowStyle Hidden -File "C:\Scripts\BlinkReminder.ps1"

Adjust Additional Settings:

You can leave the default settings in the Conditions and Settings tabs, or adjust them as needed.
Save and Test Your Task:

Click OK to save the task. You might be asked for your password.
To test, right-click on your task in Task Scheduler and select “Run”


Conclusion
This setup is a simple yet effective way to remind yourself to take care of your eyes throughout the day. It's easy to implement, runs seamlessly in the background, and can be customized to suit your needs. Whether you spend long hours coding, gaming, or simply browsing, a regular blinking reminder can make a big difference in maintaining your eye health.

Give it a try, and let me know how it works for you!
