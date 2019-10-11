# IPTV Protocol Handler

This repository hosts the requisite registry entries and handler script to enable web links to open network streams in VLC.

### Steps to install
1. Install VLC on target computers. Use the 64-bit version on x64 builds of Windows (this allows the C:\Program Files\\... path to be consistent across all computers).
2. Edit the registry entries and LaunchCCTV.cmd to suit your needs (file names, path, URL scheme, etc.)
3. Copy the LaunchCCTV.cmd file to a location on your workstations. The file path needs to match what is listed in the shell open command in the registry.
4. Import the .reg file into Windows.

### URL format notes
The default configuration in this repository registers a URL scheme beginning with cctv://. Anything after this URL scheme needs to be a fully-URLencoded string representing the MRL you wish to open with VLC Media Player. For example, if you wanted to open a multicast network stream at rtp://@239.255.202.32:2001, you would construct the following URL in your web page or email:

 - cctv://rtp%3A%2F%2F%40239.255.202.32%3A2001

The LaunchCCTV.cmd script takes this entire URL as its argument. It then strips cctv:// from the beginning of the string, urldecodes the rest, and passes the result as an argument to VLC.