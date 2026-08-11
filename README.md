<h3 align="center">!! The page is under construction and is not complete!! </h3>

---

<h1 align="center">FreeDriver Backup and Revovery</h1>


<div align="center">
  
## Backup and Restore .inf Drivers compatible with OEM devices Desktops, Notebooks or Tablets : Lenovo, Acer, HP, Asus, Dell and more ..

</div>

The Driver Save project is written in PowerShell and is compatible with Windows 10 and Windows 11. It allows you to back up OEM drivers before migration, reinstallation, or any kind of intervention in the operating system, both on desktop PCs and laptops.

The best moment to create a backup is right after the first boot of the OEM device (for example a new laptop or an OEM PC). This way, you have the original drivers of your device safely stored and ready to be restored if needed.

Of course, the backup can be created on any device running Windows. I emphasize OEM mainly because finding the correct drivers is not always easy, and this tool lets you create a driver backup that can save you a lot of trouble.

<p align="center"><img src="https://raw.githubusercontent.com/CorviusPress/FreeDriver-Backup-and-Recovery/refs/heads/main/FreeDriver%20Backup%20and%20Restore.png" alt=""></p>  
<div align="center">

---

## How to use FreeDriver for Backup :

</div>


### Use DriverSave on the Windows platform

1. Download .exe or ps1 if you want to run Powershell from the repository [**FreeDriver Last Relase Download**](https://github.com/CorviusPress/FreeDriver-Backup-and-Recovery/releases/tag/V1.1) 
2.  Click the **BackupAndRestoreDriver.exe** and open it.
3.  First, select the folder where you want to save the backup, or the folder from which you want to restore the backup, in my case I have the folder in the **"SAVE"** folder on the **"C:\"** drive. In your case, for backup, choose an external device such as an external **HDD** or **USB** key. </br>

    <p align="center"><img src="https://raw.githubusercontent.com/CorviusPress/FreeDriver-Backup-and-Recovery/refs/heads/main/FreeDriver_Backup_and_Recovery_Img/Select%20Folder.png" alt="select folder"></p>
    
5.   After selecting the target folder, click on the `"Backup Driver"` button. This should start a backup of your current drivers to the selected appropriate folder. Depending on the device, the backup can be from `800MB` to `1.5GB`.
6.   Illustrative image of LOG / and its contents
<p align="center"><img src="https://raw.githubusercontent.com/CorviusPress/FreeDriver-Backup-and-Recovery/refs/heads/main/FreeDriver_Backup_and_Recovery_Img/Backup%20Complet.png" alt=""></p>



---

<div align="center">

## How to use FreeDriver for Recovery

</div>

- To restore a driver or just a specific driver for a specific item, you have two options.
- After a clean installation on your device, you can restore the collectively backed up drivers via the **"Restore drivers"** option:

<p align="center"><img src="https://raw.githubusercontent.com/CorviusPress/FreeDriver-Backup-and-Recovery/refs/heads/main/FreeDriver_Backup_and_Recovery_Img/Restoring%20Complet.png" alt=""></p>

</div>
- After the restore is complete, you should see a window with a message that the restore was completed.


---

## How to use FreeDriver for Recovery from Device Manager

- In case you want to restore only a specific item, be it a network card, audio, or other component via Device Manager.
- In the Update Drivers window that opens, select Browse my computer for drivers.
- In the Browse for drivers on your computer window, select the Browse... button
- In the Browse For Folder window, browse to the location where the drivers were downloaded to, and then select the OK button.
- In the Browse for drivers on your computer window, make sure the path to the drivers is correct, then select the Next button.

<p align="center"><img src="https://raw.githubusercontent.com/CorviusPress/FreeDriver-Backup-and-Recovery/refs/heads/main/FreeDriver_Backup_and_Recovery_Img/Recovery_from_device%20manager.png" alt=""></p>

---
  
### Saving a log of Backup or Restore 

1. Wait until the driver is successfully backed up or restored.
2. After finishing, when a window appears asking if you want to close the application, click `NO` .
3. Then just click on the `[SAVE LOG]` icon which will be saved to your desktop, see the attached screen for the contents of the log.

<p align="center"><img src="https://raw.githubusercontent.com/CorviusPress/DriversSave/refs/heads/main/FreeDriverSave_Images/Save%20Log.png" alt=""></p>

4. You can find the saved LOG on the desktop under the name `"DriveLog + Creation date"`. I chose the text `.txt` format to make it easier for users who would like to compare different logs with each other or something else. The upcoming version 1.3 will probably add the option to choose where to save the LOG and its own name.

<p align="center"><img src="https://raw.githubusercontent.com/CorviusPress/DriversSave/refs/heads/main/FreeDriverSave_Images/Get%20Driver%20Log.png" alt=""></p>

5. Example of the logo when choosing `[BackUP]` / `Restore Driver` :

<p align="center"><img src="https://raw.githubusercontent.com/CorviusPress/DriversSave/refs/heads/main/FreeDriverSave_Images/Driver%20Log.png" alt=""></p>
---



