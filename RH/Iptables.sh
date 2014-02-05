#!/bin/bash
sudo iptables -F
sudo iptables-save
sudo chkconfig iptables off
