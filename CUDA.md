# Install CUDA on Ubuntu 20.04 and Nvidia RTX 3090

**Install CUDA 11 Toolkit**

```bash
sudo apt install nvidia-cuda-toolkit
```
```bash
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget http://developer.download.nvidia.com/compute/cuda/11.0.2/local_installers/cuda-repo-ubuntu2004-11-0-local_11.0.2-450.51.05-1_amd64.deb
sudo apt install ./cuda-repo-ubuntu2004-11-0-local_11.0.2-450.51.05-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu2004-11-0-local/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda
```

**Verify CUDA**

```bash
nvcc -V  
```

**Install cuDNN**

first go to this link then choose Download cuDNN. You'll be asked to login/create an account. After logging in, you'll be asked to accept the Terms of the cuDNN Software License Agreement.
A list of downloadable cuDNN will be displayed, click on Download cuDNN v7.6.5 (November 5th, 2019), for CUDA 10.1 then choose cuDNN Library for Linux.
After the download is finished, extract the file, then open the terminal and run:

```bash
cd cudnn-10.1-linux-x64-v7.6.5.32 # or whatever folder you got after extracting the file
```

Then:

```bash
sudo cp cuda/include/cudnn.h /usr/lib/cuda/include/
```

After that:

```bash
sudo cp cuda/lib64/libcudnn* /usr/lib/cuda/lib64/
```

Finally:

```bash
sudo chmod a+r /usr/lib/cuda/include/cudnn.h /usr/lib/cuda/lib64/libcudnn*
```

Once you finish, you have to add the CUDA path to your ~/.bashrc file. You need to run:

```bash
echo 'export LD_LIBRARY_PATH=/usr/lib/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/lib/cuda/include:$LD_LIBRARY_PATH' >> ~/.bashrc  
```

Then run:
```bash
source ~/.bashrc 
```

**Install Tensorflow**

```bash
pip3 install -U tensorflow=2.4.0
pip3 install -U tensorflow-gpu=2.4.0
```

**Verify Tensorflow**

```bash
import tensorflow as tf
tf.config.list_physical_devices('GPU')
```

**Install Torch >= 1.8**

```bash
pip3 install -U --pre torch torchvision -f https://download.pytorch.org/whl/nightly/cu110/torch_nightly.html 
```

## For Docker install
https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker

## References
- https://askubuntu.com/questions/1230645/when-is-cuda-gonna-be-released-for-ubuntu-20-04
- https://github.com/pytorch/pytorch/issues/45028
- https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker