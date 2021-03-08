FROM tiangolo/meinheld-gunicorn:python3.8-2020-12-06

# Prep for building shit.
# RUN apt-get update \
#     && apt-get install -y --no-install-recommends \
#     software-properties-common

# Install geospatial libraries
# RUN apt-get update \
#     && apt-get install -y \
#     gdal-bin \
#     libgdal-dev \
#     python-gdal

# ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
# ENV C_INCLUDE_PATH=/usr/include/gdal

# RUN pip install GDAL

# We keep all build scripts and non-Python dependencies in here.
COPY ./app/install /install

# Install Python packages.
RUN pip install -r /install/requirements.txt

# Additional build steps should go below.
