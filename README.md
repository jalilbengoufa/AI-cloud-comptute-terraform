# AI-cloud-comptute-terraform


### install Nvidia driver
- curl -O http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.0.130-1_amd64.deb
- sudo dpkg -i cuda-repo-ubuntu1804_10.0.130-1_amd64.deb -y 
- sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
- sudo apt-get update -y 
- sudo apt-get install cuda -y 
- nvidia-smi

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
- pip3 install tensorflow-gpu

### start jupyter notebook

- jupyter notebook --generate-config

- add
```
c = get_config()
c.NotebookApp.ip = '*'
c.NotebookApp.open_browser = False
c.NotebookApp.port = 5000
```
- jupyter-notebook password
- jupyter-notebook --no-browser --port=5000

- http://<External Static IP Address>:5000