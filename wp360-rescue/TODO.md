# wp360-rescue
This package should allow a partial (if only some were lost) or full (= after reimaging) recovery of factory settings and all device-specific information and/or identifiers.


## Files and folders
- /etc/codesyscontrol
- /etc/codesysedge
- /etc/\{.,\}fstab
- /etc/machine-id
- /etc/ssh/ssh\_host\_\* 
- /etc/wibu
- /var/lib/CodeMeter
- /var/log/CodeMeter
- /var/opt/codesys
- /var/opt/codesysedge

## Other stuff
Of course, if that was all, this would all be simple and little more than a tar / rm oneliner. Unfortunately, the disk identifier might also be needed (though I'll need to run more tests on that).

Turns out, the disk identifier is needed. I'll now need to see what of the above is needed, as well.

## Certainly needed
- /etc/\{.,\}fstab
- /boot/firmware/cmdline.txt
- MBR disk identifier
