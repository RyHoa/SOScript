#!/bin/bash
#gets to right directory and git pull code
cd /home/admin/securityonion
git checkout 2.4/dev
git pull origin 2.4/dev

#remove source-packages
rm -rf /home/admin/securityonion/salt/sensoroni/files/analyzers/threatfox/source-packages
rm -rf /home/admin/securityonion/salt/sensoroni/files/analyzers/malwarebazaar/source-packages
rm -rf /home/admin/securityonion/salt/sensoroni/files/analyzers/echotrail/source-packages
rm -rf /home/admin/securityonion/salt/sensoroni/files/analyzers/elasticsearch/source-packages

#install source-packages
cd salt/sensoroni/files/analyzers/threatfox
pip download -r requirements.txt -d source-packages
cd salt/sensoroni/files/analyzers/malwarebazaar
pip download -r requirements.txt -d source-packages
cd salt/sensoroni/files/analyzers/echotrail
pip download -r requirements.txt -d source-packages
cd salt/sensoroni/files/analyzers/elasticsearch
pip download -r requirements.txt -d source-packages

#remove defaults and soc_sensoroni yaml
rm -rf /opt/so/saltstack/default/salt/sensoroni/defaults.yaml
rm -rf /opt/so/saltstack/default/salt/sensoroni/soc_sensoroni.yaml

cd /home/admin/securityonion/salt/sensoroni/
cp -r defaults.yaml /opt/so/saltstack/default/salt/sensoroni/defaults.yaml
cp -r soc_sensoroni.yaml /opt/so/saltstack/default/salt/sensoroni/soc_sensoroni.yaml

#remove the analyzers from default and local
rm -rf /opt/so/saltstack/default/salt/sensoroni/files/analyzers/threatfox
rm -rf /opt/so/saltstack/local/salt/sensoroni/files/analyzers/threatfox
rm -rf /opt/so/saltstack/default/salt/sensoroni/files/analyzers/malwarebazaar
rm -rf /opt/so/saltstack/local/salt/sensoroni/files/analyzers/malwarebazaar
rm -rf /opt/so/saltstack/default/salt/sensoroni/files/analyzers/echotrail
rm -rf /opt/so/saltstack/local/salt/sensoroni/files/analyzers/echotrail
rm -rf /opt/so/saltstack/default/salt/sensoroni/files/analyzers/elasticsearch
rm -rf /opt/so/saltstack/local/salt/sensoroni/files/analyzers/elasticsearch

#copies the analzyers to the to default and local
cd /home/admin/securityonion/salt/sensoroni/files/analyzers
cp -r threatfox /opt/so/saltstack/default/salt/sensoroni/files/analyzers/threatfox
cp -r threatfox /opt/so/saltstack/local/salt/sensoroni/files/analyzers/threatfox
cp -r malwarebazaar /opt/so/saltstack/default/salt/sensoroni/files/analyzers/malwarebazaar
cp -r malwarebazaar /opt/so/saltstack/local/salt/sensoroni/files/analyzers/malwarebazaar
cp -r echotrail /opt/so/saltstack/default/salt/sensoroni/files/analyzers/echotrail
cp -r echotrail /opt/so/saltstack/local/salt/sensoroni/files/analyzers/echotrail
cp -r elasticsearch /opt/so/saltstack/default/salt/sensoroni/files/analyzers/elasticsearch
cp -r elasticsearch /opt/so/saltstack/local/salt/sensoroni/files/analyzers/elasticsearch

so-sensoroni-restart



