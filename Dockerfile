# Use the official jupyter image as a base
FROM ubuntu:22.04

# Set the maintainer label
LABEL maintainer="hosamzolfonoon@gmail.com"

# Prevent prompts from blocking the installation process
ENV DEBIAN_FRONTEND=noninteractive

# Update apt-get
RUN apt-get update && apt-get install -y \
	build-essential \
	libssl-dev \
	libffi-dev \
	python3-dev \
	python3 \
	python3-pip \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy necessary files into Docker containor
COPY Images /home/sea/Images
COPY requirements.txt /home/sea/
COPY Data /home/sea/Data
COPY statistics_experiment_analysis.ipynb /home/sea/
COPY requirements.txt /home/sea/
COPY LICENSE /home/sea/
# Set working directory
WORKDIR /home/sea/

# Install the required Python packages
RUN pip3 install -r requirements.txt

# Make Results Folder
RUN mkdir Results

# Explose Jupyter notebook port
EXPOSE 8888

# Run Jupyter notebook
#CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]

