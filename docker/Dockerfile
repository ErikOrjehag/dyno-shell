FROM osrf/ros:kinetic-desktop-full
ENV LANG en_US.UTF-8
RUN apt-get update && apt-get install -y \
  tmux \
  curl \
  wget \
  vim \
  nano \
  less \
  sudo \
  libgl1-mesa-glx \
  libgl1-mesa-dri \
  mesa-utils \
  unzip \
  x11-xkb-utils \
  python-pip \
  ranger \
  portaudio19-dev \
  python-pyaudio \
  && rm -rf /var/likb/apt/lists/*

RUN pip install -U catkin_tools
RUN pip install dialogflow SpeechRecognition
RUN pip install --upgrade cryptography pyOpenSSL

ADD pynaoqi-python2.7-2.5.5.5-linux64 /pynaoqi-python2.7-2.5.5.5-linux64
ENV PYTHONPATH $PYTHONPATH:/pynaoqi-python2.7-2.5.5.5-linux64/lib/python2.7/site-packages
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/lib/pynaoqi-python2.7-2.5.5.5-linux64/lib/python2.7/site-packages
