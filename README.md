# Server-Alert  
Gives an alert via email if a pre-defined server is not reachable  
  
**How to Edit Alert Message**  
> alertTemplate.txt  
  
This is the file which will be sent to the dedicated email. This file can be renamed and rendered in a HTML _.html_ file.  
  
**How to Edit Alert Email**  
Change _email@domain.com_ on line 23 to your prefered email  
  
**Change Email Subject**  
Change _[ALERT] Server 192.168.1.12/24 (pi.hole/) not responding..._ to your email subject header.  
  
**Changing Failed Data Points Threashhold**  
This defines how many times a ping has to fail to give an alert.  
Change the number on line 30 to the number of failed data points.  
  
**Changing Server Address**  
Change _ping -c 1 xxx.xxx.xxx.xxx_ on line 8 to your server address / IP address  
