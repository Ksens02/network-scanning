#!/bin/bash

export SSLKEYLOGFILE=/home/ksens02/Coursera/tcpDump/sslkeys
brave-browser-stable &
sudo tcpdump host apod.nasa.gov -w capture.pcap -G 600 -C 1
