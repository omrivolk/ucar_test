# Base image with Python and MPI installed
FROM ubuntu:20.04

# Set environment variables to prevent timezone and locale prompts
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

# Install necessary packages (including tzdata for timezone)
RUN apt-get update && apt-get install -y \
    tzdata \
    python3 \
    python3-pip \
    openmpi-bin \
    libopenmpi-dev && \
    ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

# Install mpi4py for Python
RUN pip3 install mpi4py

# Set the working directory in the container
WORKDIR /app

# Copy the Python script into the container
COPY hello_mpi.py .

ENV OMPI_ALLOW_RUN_AS_ROOT=1
ENV OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1

# Command to run the MPI program with 4 processes
CMD ["mpirun", "-np", "4", "python3", "hello_mpi.py"]
