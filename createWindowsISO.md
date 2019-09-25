neue windows iso runterladen
im sources order ist eine install.esd oder install.wim

install.esd ist ein komprimiertes install.wim, falls es eine install.esd ist, muss diese erst entpackt werden.

powershell
dism /Get-WimInfo /WimFile:install.esd

das teilt einem mit, welcher teil welche Version ist, in meinem Fall ist "Windows 10 Pro" Nummer 5

# install.wim aus diesem install.esd extrahieren:

dism /export-image /sourceimagefile:install.esd /sourceindex:5 /destinationimagefile:install.wim /compress:max /checkintegrity

