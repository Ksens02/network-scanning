#!/bin/bash

export SSLKEYLOGFILE="" # Add path to a created "sslkeys" file. E.g.: /home/user/example_folder/sslkeys
brave-browser-stable & # can be changed to any browser
sudo tcpdump host apod.nasa.gov -w capture.pcap -G 600 -C 1 # the parameters can be, and SHOULD be, updated. This includes the website. 
