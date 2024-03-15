
Add-Type -TypeDefinition @"
using System;
using System.Drawing;
using System.Runtime.InteropServices;

public class MouseMovement
{
    [DllImport("user32.dll")]
    public static extern bool GetCursorPos(out Point lpPoint);

    [DllImport("user32.dll")]
    public static extern bool SetCursorPos(int x, int y);

    public static void DrawCircle(int centerX, int centerY, int radius)
    {
        double angle = 0;
        double angleStep = 0.1;

        while (true)
        {
            int x = centerX + (int)(radius * Math.Cos(angle));
            int y = centerY + (int)(radius * Math.Sin(angle));

            SetCursorPos(x, y);

            angle += angleStep;
            System.Threading.Thread.Sleep(11); // Задержка между итерациями
        }
    }
}
"@

[MouseMovement]::DrawCircle(444, 666, 333)
