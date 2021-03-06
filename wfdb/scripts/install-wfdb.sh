dpkg -s "gcc" >/dev/null 2>&1 && {
    echo "gcc is installed."
} || {
    echo "gcc is not installed."
    apt-get install gcc
}

dpkg -s "curl-config" >/dev/null 2>&1 && {
    echo "curl-config is installed."
} || {
  echo "curl-config is not installed."
  apt-get install libcurl4-openssl-dev
}

file="/usr/include/expat.h"
if [ -f "$file" ]
then
	echo "$file found."
else
	echo "$file not found."
  apt-get install libexpat1-dev
  #Install expat lib
fi

rm wfdb.tar.gz*

rm -rf wfdbsrc

wget https://www.physionet.org/physiotools/wfdb.tar.gz                                                   

mkdir wfdbsrc

tar xf wfdb.tar.gz -C wfdbsrc

cd wfdbsrc/wfdb*

./configure

make install

make check

#--------------- Install  Other  Dependecies-----------------------
apt-get update
python --version
apt-get install -y sudo
apt-get install -y libhdf5-dev libhdf5-serial-dev # Install HDF5
apt-get install -y python-dev
apt-get build-dep python-tables
HDF5_DIR=/usr/lib/x86_64-linux-gnu/hdf5/serial/ pip install tables
pip install --upgrade -r $PREDMACH_DIR/requirements.txt
