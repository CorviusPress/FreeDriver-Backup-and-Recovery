<h3 align="center">!! The page is under construction and is not complete!! </h3>

---

<h1 align="center">🐈‍⬛ FreeDriver Backup and Recovery 🐈‍⬛</h1>

---

*<h2 align="center">Backup and Restore .inf Drivers compatible with OEM devices Desktops, Notebooks or Tablets : Lenovo, Acer, HP, Asus, Dell and more .. 📓</h2>*

>  [!IMPORTANT]
>  The Driver Save project is written in PowerShell and is compatible with Windows 10 and Windows 11. It allows you to back up OEM drivers before migration, reinstallation, or any kind of intervention in the operating system, both on desktop PCs and laptops.
>
> The best moment to create a backup is right after the first boot of the OEM device (for example a new laptop or an OEM PC). This way, you have the original drivers of your device safely stored and ready to be restored if needed.
>
> Of course, the backup can be created on any device running Windows. I emphasize OEM mainly because finding the correct drivers is not always easy, and this tool lets you create a driver backup that can save you a lot of trouble.

<p align="center"><img src="https://github.com/CorviusPress/FreeDriver-Backup-and-Recovery/blob/main/FreeDriver%20Backup%20and%20Recovery.png"></p>  


  
---

<h1 align="center"> 💾 How to use FreeDriver for Backup 💾 </h1>



- Download .exe or ps1 if you want to run Powershell from the repository [**FreeDriver Last Relase Download**](https://github.com/CorviusPress/FreeDriver-Backup-and-Recovery/releases/tag/V1.1) 
-  Click the **BackupAndRestoreDriver.exe** and open it.
- First, select the folder where you want to save the backup, or the folder from which you want to restore the backup, in my case I have the folder in the **"SAVE"** folder on the **"C:\"** drive. In your case, for backup, choose an external device such as an external **HDD** or **USB** key. </br>

    <p align="center"><img src="https://raw.githubusercontent.com/CorviusPress/FreeDriver-Backup-and-Recovery/refs/heads/main/FreeDriver_Backup_and_Recovery_Img/Select%20Folder.png" width="500"></p>
    
- After selecting the target folder, click on the `"Backup Driver"` button. This should start a backup of your current drivers to the selected appropriate folder. Depending on the device, the backup can be from `800MB` to `1.5GB`.

> [!NOTE]
> - Windows drivers are not a single file but a package. Each driver contains an installation script **(.inf)**, a cryptographic signature (.cat), and the actual binary driver **(.sys)**. The **.inf** file is the main entry point for Windows — it defines how the driver is installed, which device it supports, and where the other files should be copied.
> - This is why drivers exported with pnputil appear as **“oemXX.inf”**: the **INF** file is the head of the entire package that *Windows uses to identify the driver*.
> - Illustrative image of the save drivers contents :

<img src="https://github.com/CorviusPress/FreeDriver-Backup-and-Recovery/blob/main/FreeDriver_Backup_and_Recovery_Img/SAVE_Contents.png" width="">

---

<div align="center">
  
# 📇 How to use FreeDriver for Recovery 📇 

</div>

- To restore a driver or just a specific driver for a specific item, you have two options.
- After a clean installation on your device, you can restore the collectively backed up drivers via the **"Restore drivers"** option:

<p align="center"><img src="https://raw.githubusercontent.com/CorviusPress/FreeDriver-Backup-and-Recovery/refs/heads/main/FreeDriver_Backup_and_Recovery_Img/Restoring%20Complet.png" alt="" width="550"></p>

</div>

- After the restore is complete, you should see a window with a message that the restore was completed → 🎉 Backup & Recovery complete.

---

<div align="center">

# 📂 How to use FreeDriver for Recovery from Device Manager 📂

</div>

> [!NOTE]
> Open device Manager, and select itom for recoery, or for install/update driver.
> In the Device Manager, select Browse my computer for drivers.
> In the next menu, choose **Browse my computer for drivers**, then click the **Browse**  button.
>
> Next, locate and **select the folder** where the drivers were backed up, and then simply click **OK**.
>
> In the Browse my computer for drivers window, verify that the path to the drivers is correct, and then click Next. This should allow Device Manager to install the appropriate driver.
>
> **If you are not sure which folder to select, choose the entire SAVE folder — Device Manager will scan it and automatically pick the correct driver**.

<p align="center"><img src="https://raw.githubusercontent.com/CorviusPress/FreeDriver-Backup-and-Recovery/refs/heads/main/FreeDriver_Backup_and_Recovery_Img/Recovery_from_device%20manager.png" width="550"></p>

---

<div align="center">
  
# 🕵️Saving a log of Backup or Restore 🗒️ 

</div>

- Wait until the driver is successfully backed up or restored.
- After finishing, when a window appears asking if you want to close the application, click `NO` .
- Then simply click the icon under the `[SAVE LOG]` label, which saves the process output into the appropriate folder under the name “DriverLog+Date.txt”.
- The date is appended after “DriverLog” to keep the output organized and also to prevent overwriting your original file or triggering the “file already exists” warning.

<p align="center"><img src="https://github.com/CorviusPress/FreeDriver-Backup-and-Recovery/blob/main/FreeDriver_Backup_and_Recovery_Img/Save%20Log.png" width="450"></p>

- You can find the saved **LOG** on the desktop under the name **`"DriveLog + Creation date"`**. I chose the text `.txt` format to make it easier for users who would like to compare different logs with each other or something else.
- The upcoming version 1.3 will probably add the option to choose where to save the *LOG* and its own name.

<p align="center"><img src="https://github.com/CorviusPress/FreeDriver-Backup-and-Recovery/blob/main/FreeDriver_Backup_and_Recovery_Img/Get%20Driver%20Log.png" width=""></p>

>  [!TIP]
> Since the log can contain up to a hundred entries, a **"green check mark"** ✅ is shown after installation or backup to indicate **"OK"**, the process completed without errors, or a
> **"red cross"** to highlight an error ⁉️ . This way, even during fast mission scrolling, you can quickly locate a point where an issue may have occurred. 😸

- Example of the contents of a `log` file **`[BackUP]` / `Restore Driver`** :

<p align="center"><img src="https://github.com/CorviusPress/FreeDriver-Backup-and-Recovery/blob/main/FreeDriver_Backup_and_Recovery_Img/Driver%20Log.png" width="550"></p>

---



