#!/bin/bash
cp $0 /tmp/node_serialport_fork.sh

git reset --hard
grep -r '@serialport/bindings-cpp' -l | xargs sed 's/@serialport\/bindings-cpp/@sie-js\/node-serialport-bindings-cpp/g' -i
grep -r 'github.com/serialport/bindings-cpp.git' -l | xargs sed 's/github.com\/serialport\/bindings-cpp.git/github.com\/siemens-mobile-hacks\/node-serialport-bindings-cpp.git/g' -i
echo '# @sie-js/node-serialport-bindings-cpp' > README.md
echo 'Fork with https://github.com/serialport/bindings-cpp/pull/229' >> README.md
sed -i 's/- main/- fork/g' ./.github/workflows/build.yml

mv /tmp/node_serialport_fork.sh $0
