#!/bin/bash
mkdir tools/docker
cp ./test/functional/tools/catDocker.xml tools/docker
cp config/tool_conf.xml.sample config/tool_conf.xml
sed -i -e 's/^#cleanup_job = always/cleanup_job = never/' /etc/galaxy/galaxy.ini
sed -i -e '$ i  <section id="docker" name="catDocker">\
   <tool file="docker/catDocker.xml"/>\
 </section>' config/tool_conf.xml
echo "galaxy  ALL = (root) NOPASSWD: SETENV: /usr/bin/docker" >> /etc/sudoers

/usr/bin/startup
