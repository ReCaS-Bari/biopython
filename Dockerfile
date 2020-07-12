FROM python:2

RUN apt-get update \
        && apt-get install -y --no-install-recommends \
           python-keystoneclient python-swiftclient   \
        && rm -rf /var/lib/apt/lists/*

RUN wget http://biopython.org/DIST/biopython-1.59.tar.gz \
    && tar -xzf biopython-1.59.tar.gz \
    && rm biopython-1.59.tar.gz \
    && pip install numpy \
    && pip install reportlab

WORKDIR /biopython-1.59

RUN python setup.py build \
    && python setup.py test \
    && python setup.py install

WORKDIR /
RUN rm -r biopython-1.59 \
