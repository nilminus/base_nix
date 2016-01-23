#!/bin/bash


# Install multi architecture
dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install -y gcc-multilib

# Install nmap, strace, ltrace
sudo apt-get install -y nmap
sudo apt-get install -y strace
sudo apt-get install -y ltrace

# Remove openbsd netcat, add netcat-traditional
sudo apt-get remove -y netcat-openbsd
sudo apt-get install -y netcat-traditional

# Install GDB peda
cd ~/
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit
echo "DONE! debug your program with gdb and enjoy"

sudo pip install pwntools
sudo pip install git+https://github.com/Gallopsled/pwntools#egg=pwntools --upgrade
sudo pip install capstone --upgrade
sudo pip install ropgadget --upgrade
echo "Setting useful gdbinit scripts..."
echo "set disassembly-flavor intel" >> ~/.gdbinit
echo "set follow-fork-mode child" >> ~/.gdbinit
