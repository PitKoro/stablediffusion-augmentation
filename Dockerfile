FROM pytorch/pytorch:1.12.0-cuda11.3-cudnn8-devel

RUN apt-get -y update
RUN apt-get install ffmpeg libsm6 libxext6 wget  -y
RUN apt-get -y install git
RUN apt-get -y install gcc
RUN apt install pkg-config
# RUN apt-get install -y libopencv-dev

RUN pip install -U pip setuptools
RUN pip install tqdm jupyterlab ipywidgets scikit-image opencv-python perlin-noise einops omegaconf chitra
RUN pip install -qq -U diffusers==0.4.1 transformers ftfy 


WORKDIR /app

RUN git clone --recurse-submodules https://github.com/lkwq007/stablediffusion-infinity

# RUN cd stablediffusion-infinity
# RUN cp -r PyPatchMatch/csrc .
# RUN cp PyPatchMatch/Makefile .
# RUN cp PyPatchMatch/travis.sh .
# RUN cp PyPatchMatch/patch_match.py .
# WORKDIR /app
ENTRYPOINT jupyter lab --ip=0.0.0.0 --allow-root --port=8888 --NotebookApp.token='' --NotebookApp.password=''