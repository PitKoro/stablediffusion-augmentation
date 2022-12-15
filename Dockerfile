FROM pytorch/pytorch:1.12.0-cuda11.3-cudnn8-devel

RUN apt-get -y update
RUN apt-get install ffmpeg libsm6 libxext6 wget  -y
RUN apt-get -y install git
RUN apt-get -y install gcc
RUN apt install cmake -y
RUN apt install pkg-config
# RUN apt-get install -y libopencv-dev

RUN pip install -U pip setuptools
RUN pip install tqdm jupyterlab ipywidgets scikit-image opencv-python accelerate ninja
RUN pip install -qq -U diffusers==0.9.0 transformers==4.25.1 omegaconf==2.2.3 fpie


WORKDIR /app

RUN git clone --recurse-submodules https://github.com/lkwq007/stablediffusion-infinity

EXPOSE 7575
ENTRYPOINT jupyter lab --ip=0.0.0.0 --allow-root --port=7575 --NotebookApp.token='' --NotebookApp.password=''