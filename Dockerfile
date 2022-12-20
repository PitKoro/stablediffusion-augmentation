FROM pytorch/pytorch:1.12.0-cuda11.3-cudnn8-devel

RUN apt-get -y update
RUN apt-get install ffmpeg libsm6 libxext6 wget  -y
RUN apt-get -y install git gcc cmake
RUN apt install libopenmpi-dev -y
RUN apt install pkg-config


RUN pip install -U pip setuptools wheel
RUN pip install -U tqdm jupyterlab ipywidgets
RUN pip install -U opencv-python==4.6.0.66 diffusers==0.9.0 transformers==4.25.1 ninja==1.11.1 \
datasets==2.8.0 scikit-image==0.19.3 fpie==0.2.4 numpy==1.21.6 \
triton==1.1.1 pycocotools==2.0.6 accelerate==0.15.0 ftfy tensorboard modelcards mpi4py


WORKDIR /app

# RUN git clone --recurse-submodules https://github.com/lkwq007/stablediffusion-infinity

EXPOSE 7575
ENTRYPOINT jupyter lab --ip=0.0.0.0 --allow-root --port=7575 --NotebookApp.token='' --NotebookApp.password=''