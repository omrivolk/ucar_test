from mpi4py import MPI

# Initialize the MPI environment
comm = MPI.COMM_WORLD

# Get the number of processes
world_size = comm.Get_size()

# Get the rank of the process
world_rank = comm.Get_rank()

# Get the name of the processor
processor_name = MPI.Get_processor_name()

# Each process prints its rank, size, and processor name
print(f"Hello, World! from processor {processor_name}, rank {world_rank} out of {world_size} processors")

# Finalize the MPI environment (optional in mpi4py as it does it automatically)
MPI.Finalize()
