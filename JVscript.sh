#!/bin/bash
cd /home/analyst/securityonion
git pull
rm -rf /home/analyst/securityonion/salt/sensoroni/files/analyzers/elasticsearch/source-packages
cd salt/sensoroni/files/analyzers/elasticsearch
pip download -r requirements.txt -d source-packages
#remove the elasticsearch from default and local
rm -rf /opt/so/saltstack/default/salt/sensoroni/files/analyzers/elasticsearch
rm -rf /opt/so/saltstack/local/salt/sensoroni/files/analyzers/elasticsearch
cd ..
cp -r elasticsearch /opt/so/saltstack/default/salt/sensoroni/files/analyzers/elasticsearch
cp -r elasticsearch /opt/so/saltstack/local/salt/sensoroni/files/analyzers/elasticsearch
rm -rf /opt/so/saltstack/local/salt/sensoroni/defaults.yaml
rm -rf /opt/so/saltstack/default/salt/sensoroni/defaults.yaml
rm -rf /opt/so/saltstack/local/salt/sensoroni/soc_sensoroni.yaml
rm -rf /opt/so/saltstack/default/salt/sensoroni/soc_sensoroni.yaml
cd /home/analyst/securityonion/salt/sensoroni/
cp -r defaults.yaml /opt/so/saltstack/default/salt/sensoroni/defaults.yaml
cp -r defaults.yaml /opt/so/saltstack/local/salt/sensoroni/defaults.yaml
cp -r soc_sensoroni.yaml /opt/so/saltstack/default/salt/sensoroni/soc_sensoroni.yaml
cp -r soc_sensoroni.yaml /opt/so/saltstack/local/salt/sensoroni/soc_sensoroni.yaml

