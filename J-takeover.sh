#!/bin/bash 

apt-get update && apt-get upgrade
sleep 1
echo -n "Enter the domain : "
read domain
sleep 1 
echo -n "Do you want to get connected to us y/n? "
read connect

if [ "$connect" = "y" ];
then
  xdg-open "https://instagram.com/mdhasan8178"
  xdg-open "https://twitter.com/Mdhsan19"
  xdg-open "https://www.linkedin.com/in/md-hasan-03596a1b5/"
  xdg-open "https://medium.com/@jerryhackgather"
  xdg-open "https://www.youtube.com/channel/UC1k1KrUWxihK0pXKFNm_O_A"
  xdg-open "https://github.com/hack2gather"
else
  echo "No problem buddy, Let's move for further procedure ...."
fi

sleep 2
mkdir result/$domain

sleep 1
echo "Scanning for the sub-domain enumeration from the host $domain "
subfinder -d $domain -all -o $PWD/result/$domain/sub.txt
sublist3r -d $domain -b $PWD/default.txt/subdomains2.txt -o $PWD/result/$domain/sub.txt
sleep 2
echo "Starting amass "
amass enum -d $domain --passive -o result/$domain/sub.txt
sleep 1
assetfinder --subs-only $domain > result/$domain/assest.txt

sleep 1

./findomain -t $domain -r -u $PWD/result/$domain/sub.txt


sleep 1
cat result/$domain/sub.txt | httprobe | tee -a $PWD/result/$domain/alive.txt

sleep 1
subzy --targets $PWD/result/$domain/alive.txt

echo "Scan finished sucessfully ..............."
