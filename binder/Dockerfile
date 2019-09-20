FROM ubuntu:19.04
LABEL maintainer="Harald Schilly <hsy@sagemath.com>"
ENV DEBIAN_FRONTEND=noninteractive

ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

USER root

RUN apt-get update \
 && apt-get install -yq \
      curl \
      wget \
      bzip2 \
      ca-certificates \
      locales \
      fonts-liberation \
      run-one \
      sudo \
      fonts-liberation \
      run-one \
      python3-dev \
      python3-pip \
      build-essential \
      python3-setuptools \
      python3-wheel \
      pandoc \
      texlive-full \
      lsb-release \
  && apt-get clean && apt-get autoremove -y && rm -rf /var/lib/apt/lists/* \
  && pip3 install --no-cache \
      notebook \
      jupyterlab \
      numpy \
      scipy \
      pandas \
      seaborn \
      scikit-learn \
      cython \
      sympy \
      statsmodels \
      matplotlib \
      yapf

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen

# installing extras, e.g. latex webquiz
# https://tex.stackexchange.com/questions/73016/how-do-i-install-an-individual-package-on-a-linux-system
COPY extra.sh /extra.sh
RUN bash /extra.sh

RUN adduser --disabled-password \
    --gecos "User" \
    --uid ${NB_UID} \
    ${NB_USER}
WORKDIR ${HOME}
USER $NB_UID