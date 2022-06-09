#!/bin/bash 

apt-get update && sudo apt-get upgrade
sleep 2

echo "Installing the required materials for running the tool"
sleep 1 
#sublist3r
apt-get install sublist3r

#subfinder
apt-get install subfinder

#assestfinder
apt install assetfinder

#Amass
apt-get install -y amass nmap golang
sleep 1
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.local/bin:$PATH
sleep 1
#Findomain
echo "Installing Findomain"
wget https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux
chmod +x findomain-linux
mv findomain-linux findomain
sleep 1
#httprobe
go get -u github.com/tomnomnom/httprobe
mv $HOME/go/bin/httprobe /usr/bin


#subzy
go get -u -v github.com/lukasikic/subzy
go install -v github.com/lukasikic/subzy@latest
sleep 1
mv $HOME/go/bin/subzy /usr/bin
sleep 1
echo "Successfullly installed all the dependencies and required materials ....."