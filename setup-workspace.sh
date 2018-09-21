# sudo dpkg-reconfigure keyboard-configuration

# Please first setup an SSH key with your github account:
# Create: https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
# Add: https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/


# Install Catkin Tools
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
sudo apt-get update
sudo apt-get install python-catkin-tools


# Setup catkin workspace and Dyno shell
mkdir ~/Code
cd ~/Code
git clone git@github.com:ErikOrjehag/dyno-shell.git
cd dyno-shell
cp rosenv-templ.sh ~/.rosenv
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws
source /opt/ros/kinetic/setup.bash
catkin_make
echo "source ~/.rosenv" >> ~/.bashrc
source ~/.bashrc
type ddep
type dmake


# Clone and compile ROS repositories
cd  ~/catkin_ws/src
git clone git@github.com:samiamlabs/dyno.git
git clone git@github.com:samiamlabs/omnibot_driver.git
git clone git@github.com:samiamlabs/mecanum_controller.git
git clone git@github.com:samiamlabs/tricycle_controller.git
git clone git@github.com:samiamlabs/ros-sharp.git
cd ros-sharp
git checkout warehouse
cd ~
ddep
dmake


# Clone and build Dyno documentation
cd ~/Code
git clone git@github.com:samiamlabs/dyno_docs.git
curl https://bootstrap.pypa.io/get-pip.py | sudo python -
sudo pip install sphinx sphinx-autobuild sphinx-rtd-theme testresources
cd dyno_docs
make html


# Clone and install dependencies for Dyno ROS Interface
cd ~/Code
git clone git@github.com:samiamlabs/dyno-ros-interface.git
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install yarn
cd dyno-ros-interface
yarn


# Install Unity
cd ~/Downloads
wget https://beta.unity3d.com/download/48afb4a72b1a/UnitySetup-2018.2.1f1
chmod +x UnitySetup-2018.2.1f1
./UnitySetup-2018.2.1f1
# Unity executable can now be found in ~/Unity-2018.2.1f1/Editor/Unity
# Login (google)
# Open project (~/catkit_ws/src/ros-sharp/Unity3D)
# File > Open Scene (~/catkin_ws/src/ros-sharp/Unity3D/Assets/Dyno/Scenes/warehouse.unity)
# Edit > Project Settings > Player > Other Settings > Configuration > Scripting Runtime Version (.NET 4.x Equivalent)
# dyno_forklift > Inspector > Ros Connector > Ros Bridge Server Url (ws://localhost:9090)
