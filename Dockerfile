# FROM pytorch/pytorch:1.12.0-cuda11.3-cudnn8-devel

# RUN apt-get -y update
# RUN apt-get install ffmpeg libsm6 libxext6 wget  -y
# RUN apt-get -y install git
# RUN apt-get -y install gcc
# RUN apt install cmake -y
# RUN apt install pkg-config
# # RUN apt-get install -y libopencv-dev

# RUN pip install -U pip setuptools
# RUN pip install tqdm jupyterlab ipywidgets scikit-image opencv-python accelerate ninja
# RUN pip install -qq -U diffusers==0.9.0 transformers==4.25.1 omegaconf==2.2.3 fpie
# # RUN pip install git+https://github.com/facebookresearch/xformers.git@v0.0.13#egg=xformers
# # RUN pip install pyre-extensions==0.0.23
# # RUN pip install numpy
# # RUN git clone https://github.com/facebookresearch/xformers/
# # RUN cd xformers
# # RUN git submodule update --init --recursive
# # RUN pip install --verbose --no-deps -e .



# WORKDIR /app

# # RUN git clone --recurse-submodules https://github.com/lkwq007/stablediffusion-infinity

# EXPOSE 7575
# ENTRYPOINT jupyter lab --ip=0.0.0.0 --allow-root --port=7575 --NotebookApp.token='' --NotebookApp.password=''

FROM pytorch/pytorch:1.12.0-cuda11.3-cudnn8-devel

RUN apt-get -y update
RUN apt-get install ffmpeg libsm6 libxext6 wget  -y
RUN apt-get -y install git gcc cmake
RUN apt install pkg-config
RUN apt install libopenmpi-dev -y

RUN pip install -U pip setuptools wheel
RUN pip install -U tqdm jupyterlab ipywidgets
RUN pip install -U opencv-python diffusers==0.9.0 accelerate==0.15.0 transformers==4.25.1 ninja==1.11.1 mpi4py \
datasets==2.8.0 scikit-image==0.19.3 fpie==0.2.4 numpy==1.21.6 modelcards==0.1.6 \
triton==1.1.1 pycocotools==2.0.6

# RUN pip install git+https://github.com/facebookresearch/xformers@e773f9d#egg=xformers



WORKDIR /app

# RUN git clone --recurse-submodules https://github.com/lkwq007/stablediffusion-infinity

EXPOSE 7575
ENTRYPOINT jupyter lab --ip=0.0.0.0 --allow-root --port=7575 --NotebookApp.token='' --NotebookApp.password=''