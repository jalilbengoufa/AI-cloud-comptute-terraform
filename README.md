# AI-cloud-comptute-terraform


## install Nvidia driver
### Add NVIDIA package repositories
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.1.243-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804_10.1.243-1_amd64.deb
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
sudo apt-get update
wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
sudo apt install ./nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
sudo apt-get update

# Install NVIDIA driver
sudo apt-get install --no-install-recommends nvidia-driver-430


### install CUDNN
- download from https://developer.nvidia.com/rdp/cudnn-download
- copy `libcudnn7_7.6.5.32-1+cuda10.0_amd64.deb` to server
- sudo dpkg -i </path/to/cudnn_file.deb>


### install poetry
- sudo apt-get install python3-venv -y 
- sudo apt install python3-pip -y 
- sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 10
- curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3
- poetry add keras
- poetry add livelossplot
- poetry add tensorflow-gpu==1.14

### start jupyter notebook

- jupyter-notebook --no-browser --port=5000 --ip='*' &

- http://<External Static IP Address>:5000