import unified_map as umap

def add(x, y, z):
    return x+y+z

data = [(1, 2, 3), (10, 20, 30), (1, 20, 300), (42, 15, 27)]

# Serial on one core
results = umap.multivariate.serial.for_loop(add, data)
results = umap.multivariate.serial.generator_expression(add, data)
results = umap.multivariate.serial.generator_function(add, data)
results = umap.multivariate.serial.list_comprehension(add, data)
results = umap.multivariate.serial.map(add, data)
results = umap.multivariate.serial.starmap(add, data)

# Parallel on several cores
results = umap.multivariate.parallel.dask(add, data)
results = umap.multivariate.parallel.futures(add, data)
results = umap.multivariate.parallel.joblib(add, data)
results = umap.multivariate.parallel.multiprocessing(add, data)

# Distributed on several machines
umap.cluster_setup.dask.connect_to_scheduler('10.0.0.5:8789')
results = umap.multivariate.distributed.dask(add, data)

umap.cluster_setup.spark.connect_to_scheduler('10.0.0.5:7077')
results = umap.multivariate.distributed.spark(add, data)
