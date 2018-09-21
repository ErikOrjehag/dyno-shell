# Having problems with permissions when using regular ADD command on .tar.gz so I need to chmod on host first.
tar -xzf pynaoqi-python2.7-2.5.5.5-linux64.tar.gz
chmod --reference=pynaoqi-python2.7-2.5.5.5-linux64/lib/python2.7/dist-packages pynaoqi-python2.7-2.5.5.5-linux64/lib/python2.7/site-packages

docker build -t dyno:dev .
